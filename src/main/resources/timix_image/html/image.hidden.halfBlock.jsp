<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="imageURL" value="${currentNode.properties['image'].node.getUrl()}"/>
<%--<template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">--%>
<%--    <template:param name="width" value="${currentResource.moduleParams.mediaWidth}"/>--%>
<%--    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>--%>
<%--    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>--%>
<%--    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>--%>
<%--</template:module>--%>

<%--<img src="${imageURL}" alt="${alt}"/>--%>
<div class="image-display" style="background-image: url('${imageURL}');"></div>
