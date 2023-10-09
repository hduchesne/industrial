<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="description" value="${currentNode.properties['teaser'].string}"/>

<%--<fmt:formatDate value="${currentNode.properties['date'].date.time}" pattern="dd MMM yyyy HH:mm:ss Z" var="formatedDate"/>--%>
<fmt:formatDate value="${currentNode.properties['jcr:created'].date.time}"
                pattern="EEE, dd MMM yyyy HH:mm:ss Z"
                var="formatedDate"/>

<%--<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.html" var="itemUrl"/>--%>
<c:url value="${url.server}${currentNode.url}" var="itemUrl"/>

<item>
    <title>${titleEscaped}</title>
    <link>${fn:escapeXml(itemUrl)}</link>
    <guid>${fn:escapeXml(itemUrl)}</guid>
    <description>${functions:abbreviate(functions:removeHtmlTags(description),200,250,'...')}</description>
    <pubDate>${formatedDate}</pubDate>
</item>