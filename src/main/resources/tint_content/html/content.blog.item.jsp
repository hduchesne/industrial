<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<fmt:setLocale value="${currentResource.locale.language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>

<fmt:message key="label.date.at" var="at"/>
<c:set var="date" value="${currentNode.properties['date'].date}"/>
<fmt:formatDate value="${date.time}" pattern="dd" var="day"/>
<fmt:formatDate value="${date.time}" pattern="yyyy" var="year"/>
<fmt:formatDate value="${date.time}" pattern="MMM" var="month"/>

<%--<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.html" var="itemUrl"/>--%>
<c:url value="${currentNode.url}" var="contentURL"/>

<c:set var="imageNode" value="${currentNode.properties['imageLandscape'].node}"/>
<template:addCacheDependency node="${imageNode}"/>
<c:set var="width" value="${currentResource.moduleParams.mediaWidth}"/>
<c:set var="height" value="${currentResource.moduleParams.mediaHeight}"/>
<c:set var="scale" value="${currentResource.moduleParams.mediaScale}"/>
<c:set var="quality" value="${currentResource.moduleParams.mediaQuality}"/>

<c:catch var ="getUrlException">
    <c:set var="imageURL" value="${imageNode.getUrl(['width:'.concat(width),'height:'.concat(height),'scale:'.concat(scale),'quality:'.concat(quality)])}"/>
</c:catch>
<c:if test = "${getUrlException != null}">
    <c:set var="imageURL" value="${imageNode.getUrl()}"/>
</c:if>

<div class="item item-article pb-4">
    <div class="blog-entry">
        <a href="${contentURL}" class="block-20 d-flex align-items-start" style="background-image: url('${imageURL}');">
            <div class="meta-date text-center p-2">
                <span class="day">${day}</span>
                <span class="mos">${month}</span>
                <span class="yr">${year}</span>
            </div>
        </a>
        <div class="text border border-top-0 p-4">
            <h3 class="heading"><a href="${contentURL}">${titleEscaped}</a></h3>
            ${functions:abbreviate(functions:removeHtmlTags(teaser),200,250,'...')}
            <div class="d-flex align-items-end mt-4 flex-grow-3">
                <p class="mb-0">
                    <a href="${contentURL}" class="btn btn-primary">
                        <fmt:message key="label.content.readMore"/>
                        <span class="ion-md-arrow-dropright-circle"></span>
                    </a>
                </p>
    <%--            <p class="ml-auto meta2 mb-0">--%>
    <%--                <a href="${contentURL}" class="mr-2">Admin</a>--%>
    <%--                <a href="${contentURL}" class="meta-chat"><span class="ion-ios-chatboxes"></span> 3</a>--%>
    <%--            </p>--%>
            </div>
        </div>
    </div>
</div>