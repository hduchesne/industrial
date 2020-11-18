<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--<template:addResources type="css" resources="bootstrap.min.css"/>--%>

<div class="scaling-image">
    <div class="frame">
        <template:include view="default">
            <template:param name="class" value="img-fluid"/>
            <template:param name="widths" value="256,768,1024"/>
            <template:param name="defaultWidth" value="1024"/>
        </template:include>
    </div>
</div>