<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--<template:addResources type="css" resources="bootstrap.min.css"/>--%>

<c:set var="caption" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="imgNode" value="${currentNode.properties.image.node}"/>

<div class="scaling-image">
    <div class="frame">
        <template:module view="cloudy.img" node="${imgNode}" editable="false">
            <template:param name="class" value="img-fluid"/>
        </template:module>
<%--        <template:include view="image">--%>
<%--            <template:param name="class" value="img-fluid"/>--%>
<%--        </template:include>--%>
    </div>
</div>
