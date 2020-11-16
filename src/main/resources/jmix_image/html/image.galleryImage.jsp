<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>

<utility:logger level="INFO" value="*** image.galleryImage"/>
<utility:logger level="INFO" value="*** image.galleryImage ${currentNode}"/>

<%--<c:set var="imageNode" value="${currentNode.properties.image.node}"/>--%>
<c:set var="imageNode" value="${currentNode}"/>


<c:if test="${! empty imageNode}">
    <%--
    this view allow to pass as paremeters a class and a style and an id parameters.
     This parameters can be overhidden using the image advanced settings.
     For class and style attribute, we keep the value from parameter as first.
     For ID we keep the value from advanced settings if exists.
    --%>
    <c:set var="class" value="${currentResource.moduleParams.class}"/>
    <c:if test="${! empty class}">
        <c:set var="class" value="${class}"/>
    </c:if>
    <c:set var="style" value="${currentResource.moduleParams.style}"/>
    <c:if test="${! empty style}">
        <c:set var="style" value="${style}"/>
    </c:if>
    <c:set var="id" value="${currentResource.moduleParams.id}"/>
    <c:if test="${! empty id}">
        <c:set var="id" value="${id}"/>
    </c:if>
    <c:set var="alt" value="${imageNode.displayableName}"/>
    <%-- set responsive by default --%>
    <c:set var="responsive" value="true"/>

    <c:choose>
        <c:when test="${! responsive}">
            <c:set var="class">${fn:replace(class, 'img-fluid', '')}</c:set>
        </c:when>
        <c:otherwise>
            <c:if test="${! fn:contains(class, 'img-fluid')}">
                <c:set var="class">${class}${' img-fluid'}</c:set>
            </c:if>
        </c:otherwise>
    </c:choose>

    <c:url var="imageUrl" value="${imageNode.url}" context="/"/>
    <img src="${imageUrl}" alt="${fn:escapeXml(alt)}"
         <c:if test="${! empty class}"><c:out value=" "/>class="${fn:escapeXml(class)}"</c:if>
         <c:if test="${! empty style}"><c:out value=" "/>style="${fn:escapeXml(style)}"</c:if>
         <c:if test="${! empty id}"><c:out value=" "/>id="${fn:escapeXml(id)}"</c:if>
         <c:if test="${! empty id}"><c:out value=" "/>id="${fn:escapeXml(id)}"</c:if>
    />
</c:if>