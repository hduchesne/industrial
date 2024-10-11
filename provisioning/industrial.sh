#!/bin/bash

# Description: Script to deploy Industrial Suite and optionally install jExperience and Forms.

# Default variables
host="http://localhost:8080"
auth="root:root"
jExp=false

# Function to display usage information
usage() {
    cat <<EOF
Usage: $0 [-j] [-h <host>] [-u <username:password>] [--help|-?]
  -j                    Install jExperience and Forms
  -h <host>             Specify the host URL (default: $host)
  -u <username:password> Specify the authentication credentials (default: $auth)
  --help, -?            Display this help message
EOF
    exit 1
}

# Parse options using getopts
while [[ $# -gt 0 ]]; do
    case $1 in
        -j)
            jExp=true
            shift
            ;;
        -h)
            if [[ -n $2 ]]; then
                host=$2
                shift 2
            else
                echo "Error: Option -h requires an argument." >&2
                usage
            fi
            ;;
        -u)
            if [[ -n $2 ]]; then
                auth=$2
                shift 2
            else
                echo "Error: Option -u requires an argument." >&2
                usage
            fi
            ;;
        --help|-?)
            usage
            ;;
        -*)
            echo "Error: Invalid option $1" >&2
            usage
            ;;
        *)
            break
            ;;
    esac
done

# Display starting message
echo -e "\n***\n* Starting deployment of Industrial Suite on ${host} with credentials ${auth}\n***\n"

# Function to show a spinner while a command is running
show_spinner() {
    local pid="$1"
    local delay=0.1
    local spinner='|/-\'
    local i=0

    # Capture tput outputs into variables
    local hide_cursor
    local show_cursor
    hide_cursor=$(tput civis 2>/dev/null || true)
    show_cursor=$(tput cnorm 2>/dev/null || true)

    # Output the hide cursor sequence to stderr
    printf "%s" "$hide_cursor" >&2

    # Loop until the background process finishes
    while kill -0 "$pid" 2>/dev/null; do
        printf "\rProcessing... %s" "${spinner:i++%${#spinner}:1}" >&2
        sleep "$delay"
    done

    # Output the show cursor sequence to stderr
    printf "%s" "$show_cursor" >&2

    # Clean up the line
    printf "\r" >&2
    printf "                         \r" >&2  # Clear the line
}

# Function to perform the provisioning using curl
provision() {
    local data="$1"
    local tmpfile
    tmpfile=$(mktemp)
    local pid
    local curl_exit_status
    local spinner_pid
    local response
    local http_status

    # Start the curl command in the background
    (
        curl -s -u "${auth}" \
            --url "${host}/modules/api/provisioning" \
            --header 'Content-Type: application/yaml' \
            --data "${data}" \
            -w "\n%{http_code}" > "$tmpfile"
    ) &
    pid=$!

    # Start the spinner and capture its PID
    show_spinner "$pid" &
    spinner_pid=$!

    # Wait for the curl command to finish
    wait "$pid"
    curl_exit_status=$?

    # Wait for the spinner to finish
    wait "$spinner_pid" 2>/dev/null

    # Read the response and HTTP status code from the temporary file
    response=$(cat "$tmpfile")
    http_status=$(echo "$response" | tail -n1 | tr -d '\r\n')

    # Remove the temporary file
    rm -f "$tmpfile"

    # Check for curl errors
    if [ "$curl_exit_status" -ne 0 ]; then
        echo "Error: Curl command failed with exit status $curl_exit_status" >&2
        exit 1
    fi

    # Return the HTTP status code
    echo "$http_status"
}

# Provision Industrial Suite
industrial_response=$(provision "- include: https://raw.githubusercontent.com/hduchesne/industrial/main/provisioning/industrial.yaml")

# Compare industrial_response as a string
if [ "$industrial_response" = "200" ]; then
    echo "Industrial Suite deployment initiated successfully."
else
    echo "Error: Failed to initiate Industrial Suite deployment. HTTP Status: '$industrial_response'" >&2
    exit 1
fi

# Install jExperience and Forms if -j flag is set
if [ "$jExp" = true ]; then
    echo -e "\n***\n* Installing jExperience and Forms\n***\n"

    jexp_response=$(provision "- include: https://raw.githubusercontent.com/hduchesne/industrial/main/provisioning/industrial-jexperience-forms.yaml")

    # Compare jexp_response as a string
    if [ "$jexp_response" = "200" ]; then
        echo "jExperience and Forms installation initiated successfully."
    else
        echo "Error: Failed to initiate jExperience and Forms installation. HTTP Status: '$jexp_response'" >&2
        exit 1
    fi
else
    echo -e "\n***\n* Skipping installation of jExperience and Forms\n***\n"
fi
