<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>


<c:set var="gravity" value="${currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
<c:set var="crop" value="${currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
<c:set var="raw" value="${currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>

<c:url var="imgUrl" value="${currentNode.url}" context="/" />

<div class="svg-wrapper">
    <svg viewbox="0 0 1439 730" fill="none" class="svg-desktop" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <path opacity="0.2" d="M458.5 635.5C167.997 654.31 33.5 576 -2 549V0H1439V651C1202.5 827 894.057 601.465 661.5 620.5C521 632 528 631 458.5 635.5Z" fill="url(#paint0_linear_bw)"/>
        <path opacity="0.2" d="M1439 0H-1V548.5C422 512.5 396.5 736.5 813.5 659.5C1038.82 617.894 1225.5 730.5 1439 651.5V0Z" fill="url(#paint1_linear_bw)"/>

        <mask id="mask0_bw" mask-type="alpha" maskunits="objectBoundingBox" x="0" y="0" width="1" height="1">
            <path d="M-1 0H1439V648.5C1115 493.5 1061 729 628 603.5C407.927 539.715 293 480 -1 544V0Z" fill="url(#paint2_linear_bw)"/>
        </mask>

        <g mask="url(#mask0_bw)" class="image-desktop">
            <rect width="100%" height="100%" fill="url(#pattern0_bw)"/>
        </g>

        <g style="mix-blend-mode:multiply">
            <path d="M-1 0H1439V649C1115 494 1061 729.5 628 604C407.927 540.215 293 480.5 -1 544.5V0Z" fill="url(#paint3_linear_bw)" fill-opacity="0.55"/>
        </g>
        <g style="mix-blend-mode:multiply">
            <path d="M-1 0H1439V263.5H-1V0Z" fill="url(#paint4_linear)"/>
        </g>
        <defs>
            <pattern id="pattern0_bw"  width="100%" height="100%">
                <use xlink:href="#image0_bw"/>
            </pattern>

            <lineargradient id="paint0_linear_bw" x1="40.4996" y1="359.002" x2="1678.5" y2="802.502" gradientunits="userSpaceOnUse">
                <stop stop-color="#0470DC"/>
                <stop offset="1" stop-color="#00ABC8"/>
            </lineargradient>
            <lineargradient id="paint1_linear_bw" x1="80.5001" y1="571.5" x2="1439" y2="-479.999" gradientunits="userSpaceOnUse">
                <stop stop-color="#1C449C"/>
                <stop offset="1" stop-color="#16A1DB"/>
            </lineargradient>
            <lineargradient id="paint2_linear_bw" x1="-0.999978" y1="-259.5" x2="1857.5" y2="914.499" gradientunits="userSpaceOnUse">
                <stop stop-color="#1C449C"/>
                <stop offset="1" stop-color="#00B2E2"/>
            </lineargradient>
            <lineargradient id="paint3_linear_bw" x1="-0.99984" y1="-259" x2="1857.5" y2="914.999" gradientunits="userSpaceOnUse">
                <stop stop-color="#1C449C"/>
                <stop offset="1" stop-color="#00B2E2"/>
            </lineargradient>
            <lineargradient id="paint4_linear_bw" x1="719" y1="-74.5" x2="719" y2="263.5" gradientunits="userSpaceOnUse">
                <stop stop-color="#1C449C" stop-opacity="0.9"/>
                <stop offset="1" stop-color="#1C449C" stop-opacity="0"/>
            </lineargradient>
            <c:choose>
                <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
                    <image id="image0_bw"  preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="<cl:url node="${currentNode}" width="1439" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"/>
                </c:when>
                <c:otherwise>
                    <image id="image0_bw"  preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="${imgUrl}"/>
                </c:otherwise>
            </c:choose>
        </defs>
    </svg>
    <svg viewBox="0 0 375 332" fill="none" class="svg-mobile" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <path opacity="0.2" d="M162.5 288C88.8335 291.771 104 296 0 296V0H375V331.5C289.5 322 208.333 285.654 162.5 288Z" fill="url(#paint0_line_bw_xs)"></path>
        <path opacity="0.2" d="M375 1H0V272.5C54 289.5 80.5 323 206 306.5C212.283 305.674 265.5 292 375 312V1Z" fill="url(#paint1_line_bw_xs)"></path>
        <mask id="mask0_bw_xs" mask-type="alpha" maskUnits="objectBoundingBox" x="0" y="0" width="1" height="1">
            <path d="M0 2.5H375V278.5C325.5 284.5 295 299.5 229.5 299.5C164 299.5 56.5 253.5 0 248V2.5Z" fill="url(#paint2_line_bw_xs)"></path>
        </mask>
        <g mask="url(#mask0_bw_xs)">
            <rect width="100%" height="100%" fill="url(#pattern0_bw_xs)"></rect>
        </g>
        <g style="mix-blend-mode:multiply">
            <path d="M0.00195312 0H375.002V278.5C323 284.5 289.5 301.957 221 299C151.5 296 74 257.5 0.00195312 248V0Z" fill="url(#paint3_line_bw_xs)" fill-opacity="0.55"></path>
        </g>
        <g style="mix-blend-mode:multiply">
            <rect width="375" height="131" fill="url(#paint4_line_bw_xs)"></rect>
        </g>
        <defs>
            <pattern id="pattern0_bw_xs" width="100%" height="100%">
                <use xlink:href="#image0_bw_xs"></use>
            </pattern>
            <linearGradient id="paint0_line_bw_xs" x1="11.0658" y1="172.709" x2="456.938" y2="244.76" gradientUnits="userSpaceOnUse">
                <stop stop-color="#0470DC"></stop>
                <stop offset="1" stop-color="#00ABC8"></stop>
            </linearGradient>
            <linearGradient id="paint1_line_bw_xs" x1="21.224" y1="264.181" x2="486.773" y2="48.2273" gradientUnits="userSpaceOnUse">
                <stop stop-color="#1C449C"></stop>
                <stop offset="1" stop-color="#16A1DB"></stop>
            </linearGradient>
            <linearGradient id="paint2_line_bw_xs" x1="0.00593363" y1="-94.8624" x2="592.165" y2="129.424" gradientUnits="userSpaceOnUse">
                <stop stop-color="#1C449C"></stop>
                <stop offset="1" stop-color="#00B2E2"></stop>
            </linearGradient>
            <linearGradient id="paint3_line_bw_xs" x1="-0.001923" y1="-94.9197" x2="592.469" y2="129.015" gradientUnits="userSpaceOnUse">
                <stop stop-color="#1C449C"></stop>
                <stop offset="1" stop-color="#00B2E2"></stop>
            </linearGradient>
            <linearGradient id="paint4_line_bw_xs" x1="187.5" y1="0" x2="187.5" y2="131" gradientUnits="userSpaceOnUse">
                <stop stop-color="#1C449C" stop-opacity="0.9"></stop>
                <stop offset="1" stop-color="#1C449C" stop-opacity="0"></stop>
            </linearGradient>
            <c:choose>
                <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
                    <image id="image0_bw_xs"  preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="<cl:url node="${currentNode}" width="750" gravity="${gravity}" crop="${crop}" raw="${raw}"/>"/>
                </c:when>
                <c:otherwise>
                    <image id="image0_bw_xs"  preserveAspectRatio="xMidYMid slice" width="100%" height="100%"
                           xlink:href="${imgUrl}"/>
                </c:otherwise>
            </c:choose>
        </defs>
    </svg>
</div>