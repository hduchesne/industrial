<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="view" value="industrial.${currentNode.properties.contentType.string}"/>

<c:set var="linkType" value="${currentNode.properties.linkType.string}"/>
<c:set var="linkUrl" value="#"/>

<c:choose>
    <c:when test="${linkType eq 'internalLink'}">
        <c:set var="internalLinkNode" value="${currentNode.properties.internalLink.node}"/>
        <c:choose>
            <c:when test="${! empty internalLinkNode}">
                <c:url var="linkUrl" value="${internalLinkNode.url}"/>
            </c:when>
        </c:choose>
    </c:when>
    <c:when test="${linkType eq 'externalLink'}">
        <c:url var="linkUrl" value="${currentNode.properties.externalLink.string}"/>
    </c:when>
    <c:when test="${linkType eq 'self'}">
        <c:url var="linkUrl" value="${currentNode.url}"/>
    </c:when>
</c:choose>


<template:include view="${view}">
    <template:param name="linkUrl" value="${linkUrl}"/>
</template:include>