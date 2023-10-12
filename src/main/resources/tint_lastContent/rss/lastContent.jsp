<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="site" value="${renderContext.site.siteKey}"/>
<c:set var="host" value="${url.server}"/>
<c:set var="language" value="${currentResource.locale.language}"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="description" value="${currentNode.properties['teaser'].string}"/>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}"
                pattern="EEE, dd MMM yyyy HH:mm:ss Z"
                var="formatedDate"/>
<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.rss" var="itemUrl"/>

<template:include view="hidden.load" templateType="html"/>
<c:set var="listQuery" value="${moduleMap.listQuery}"/>
<jcr:jqom var="result" qomBeanName="listQuery" />

<?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0" xml:base="${host}" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>${titleEscaped}</title>
        <description>${functions:abbreviate(functions:removeHtmlTags(description),200,250,'...')}</description>
        <link>${host}</link>
        <atom:link rel="self" href="${itemUrl}" />
        <language>${language}</language>
        <pubDate>${formatedDate}</pubDate>
        <lastBuildDate>${formatedDate}</lastBuildDate>
        <c:forEach items="${result.nodes}" var="node">
            <template:module node="${node}" templateType="rss"/>
        </c:forEach>
    </channel>
</rss>
