<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="body" value="${currentNode.properties.body.string}"/>

<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imageNode}"/>
<c:set var="imageURL" value="${imageNode.getUrl()}"/>

<%--<template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">--%>
<%--    <template:param name="width" value="${currentResource.moduleParams.width}"/>--%>
<%--    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>--%>
<%--    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>--%>
<%--    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>--%>
<%--</template:module>--%>

<%--linkTo--%>
<template:include view="hidden.getLinkToURL"/>

<div class="media d-block media-custom text-center">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            <a href="${moduleMap.linkUrl}" target="${moduleMap.linkTarget}">
        </c:when>
        <c:otherwise>
            <div class="a-like">
        </c:otherwise>
    </c:choose>
            <img src="${imageURL}" alt="people" class="img-fluid">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            </a>
        </c:when>
        <c:otherwise>
            </div>
        </c:otherwise>
    </c:choose>

    ${body}
</div>
