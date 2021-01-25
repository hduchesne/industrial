<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="imageNode" value="${currentNode.properties['ti:mediaNode'].node}"/>
<template:addCacheDependency node="${imageNode}"/>

<c:choose>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'wdenmix:widenAsset')}">
        <c:set var="defaultWidth" value="${not empty currentResource.moduleParams.defaultWidth ?
            currentResource.moduleParams.defaultWidth : '768'}"/>

        <c:set var="imageURL" value="${imageNode.properties['wden:templatedUrl'].string}"/>
        <c:set var="imageURL" value="${fn:replace(imageURL, '{scale}', '1')}"/>
        <c:set var="imageURL" value="${fn:replace(imageURL, '{quality}', '72')}"/>
        <c:set var="imageURL" value="${fn:replace(imageURL, '{size}', defaultWidth)}"/>
        <c:url var="imageURL" value="${imageURL}"/>
    </c:when>
    <c:otherwise>
        <c:url var="imageURL" value="${imageNode.url}"/>
    </c:otherwise>
</c:choose>

<%--<img src="${imageURL}" alt="${alt}"/>--%>
<div class="image-display" style="background-image: url('${imageURL}');"></div>