<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<%--<c:set var="linkUrl" value="${currentResource.moduleParams.linkUrl}"/>--%>
<c:set var="body" value="${currentNode.properties.body.string}"/>
<%--<c:set var="imageNode" value="${currentNode.properties.image.node}"/>--%>
<c:set var="mediaNode" value="${currentNode.properties['image'].node}"/>
<%--<c:set var="mediaWidth" value="512"/>--%>
<%@ include file="../../getMediaURL.jspf"%>
<c:set var="imageURL" value="${mediaURL}"/>

<template:addCacheDependency node="${mediaNode}"/>
<%--<c:url var="imageURL" value="${imageNode.url}"/>--%>

<%--lintTo--%>
<template:include view="hidden.generateLink"/>

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
