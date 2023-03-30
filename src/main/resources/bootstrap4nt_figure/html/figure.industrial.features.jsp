<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css"/>--%>

<c:set var="caption" value="${currentNode.properties['jcr:title'].string}"/>

<%--<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>--%>

<%--<utility:logger level="INFO" value=" ***** bootstrap4nt_figure.industrial.features "/>--%>

<c:choose>
    <c:when test="${renderContext.editMode}">
<%--        <utility:logger level="INFO" value=" ***** bootstrap4nt_figure.industrial.features isEdit mode call image"/>--%>
        <template:include view="image">
            <template:param name="class" value="img-fluid"/>
        </template:include>
    </c:when>
    <c:otherwise>
        <c:set var="mediaNode" value="${currentNode.properties['image'].node}"/>
        <%--<c:set var="mediaWidth" value="1280"/>--%>
        <%@ include file="../../getMediaURL.jspf"%>
        <c:set var="imageURL" value="${mediaURL}"/>

        <div class="scaling-image h-100">
            <div class="frame h-100">
                <div class="feature-img-bg h-100" style="background-image: url('${imageURL}');">
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


<%--<div class="scaling-image">--%>
<%--    <div class="frame">--%>
<%--        <template:include view="image">--%>
<%--            <template:param name="class" value="img-fluid"/>--%>
<%--        </template:include>--%>
<%--    </div>--%>
<%--</div>--%>
