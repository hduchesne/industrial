<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="heading" value="${currentNode.properties.heading.string}"/>
<c:set var="iconClass" value="${currentNode.properties.iconClass.string}"/>

<%--<c:set var="linkType" value="${currentNode.properties.linkType.string}" />--%>
<%--<c:set var="linkTarget" value="${currentNode.properties.linkTarget.string}" />--%>

<%--<c:choose>--%>
<%--    <c:when test="${linkType eq 'internalLink'}">--%>
<%--        <c:set var="internalLinkNode" value="${currentNode.properties.internalLink.node}"/>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${! empty internalLinkNode}">--%>
<%--                <c:url var="linkUrl" value="${internalLinkNode.url}"/>--%>
<%--            </c:when>--%>
<%--        </c:choose>--%>
<%--    </c:when>--%>
<%--    <c:when test="${linkType eq 'externalLink'}">--%>
<%--        <c:url var="linkUrl" value="${currentNode.properties.externalLink.string}"/>--%>
<%--    </c:when>--%>
<%--    <c:when test="${linkType eq 'self'}">--%>
<%--        <c:url var="linkUrl" value="${currentNode.url}"/>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>

<template:include view="hidden.generateLink"/>

<a href="${moduleMap.linkUrl}" class="link-thumbnail">
    <h3>${heading}</h3>
    <span class="${iconClass}"></span>
    <template:include view="image">
        <template:param name="class" value="img-fluid"/>
    </template:include>
</a>
