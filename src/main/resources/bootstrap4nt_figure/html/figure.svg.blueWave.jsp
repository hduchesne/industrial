<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<template:addResources type="css" resources="svg.css" />

<c:set var="imgNode" value="${currentNode.properties.image.node}"/>

<figure class="">
    <template:module view="svg.blueWave" node="${imgNode}" editable="false">
        <template:param name="class" value="img-fluid Blob__img--blob-2"/>
    </template:module>
</figure>