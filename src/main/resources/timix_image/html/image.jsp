<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>

<template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="mediaURL" editable="false" templateType="txt">
    <template:param name="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '1280'}"/>
    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>
    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>
    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>
</template:module>

<img src="${mediaURL}" width="100%"
     class="${currentResource.moduleParams.class}"
     alt="${alt}"
/>
