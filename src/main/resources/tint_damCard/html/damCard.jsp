<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<c:set var="body" value="${currentNode.properties.body.string}"/>
<template:include view="hidden.generateLink"/>

<%--<c:set var="linkType" value="${currentNode.properties.linkType.string}" />--%>
<%--<c:set var="linkTarget" value="${currentNode.properties.linkTarget.string}"/>--%>

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

<div class="media d-block media-custom text-center">
<c:choose>
    <c:when test="${not empty moduleMap.linkUrl}">
        <a href="${moduleMap.linkUrl}" target="${moduleMap.linkTarget}">
    </c:when>
    <c:otherwise>
        <div class="a-like">
    </c:otherwise>
</c:choose>

<template:include view="image">
    <template:param name="class" value="img-fluid"/>
</template:include>

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