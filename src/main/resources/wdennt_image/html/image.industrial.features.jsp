<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<template:include view="hidden.getSrc">
    <template:param name="widths" value="${currentResource.moduleParams.widths}"/>
    <template:param name="defaultWidth" value="${currentResource.moduleParams.defaultWidth}"/>
</template:include>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <template:include view="default">
            <template:param name="class" value="img-fluid"/>
            <template:param name="widths" value="${currentResource.moduleParams.widths}"/>
            <template:param name="defaultWidth" value="${currentResource.moduleParams.defaultWidth}"/>
        </template:include>
    </c:when>
    <c:otherwise>
        <div class="scaling-image h-100">
            <div class="frame h-100">
                <div class="feature-img-bg h-100" style="background-image: url('${moduleMap.src}');">
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
