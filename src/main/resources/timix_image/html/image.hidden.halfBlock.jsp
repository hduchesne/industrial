<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--<c:set var="alt" value="${currentNode.properties.name.string}"/>--%>
<%--<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>--%>


<c:set var="mediaNode" value="${currentNode.properties['image'].node}"/>
<c:set var="mediaWidth" value="${currentResource.moduleParams.width}"/>
<%@ include file="../../getMediaURL.jspf"%>
<c:set var="imageURL" value="${mediaURL}"/>
<template:addCacheDependency node="${mediaNode}"/>

<%--<img src="${imageURL}" alt="${alt}"/>--%>
<div class="image-display" style="background-image: url('${imageURL}');"></div>
