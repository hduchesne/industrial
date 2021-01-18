<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css,owl.carousel.min.css" />--%>
<%--<template:addResources type="javascript" resources="jquery.min.js,popper.min.js,bootstrap.min.js,owl.carousel.min.js"/>--%>

<%--<template:addResources type="css" resources="owl.carousel.min.css" />--%>
<%--<template:addResources type="javascript" resources="owl.carousel.min.js"/>--%>

<c:set var="rand">
    <%= java.lang.Math.round(java.lang.Math.random() * 10000) %>
</c:set>
<c:set var="sliderId" value="slider-${rand}"/>

<c:set var="type" value="${currentNode.properties.carouselType.string}"/>
<%--<utility:logger level="info" value="****** V8 DEBUG ******* type: ${type}"/>--%>

<c:set var="displayView" value="hidden.items.display.${type}"/>
<c:set var="addView" value="hidden.items.add.${type}"/>

<%--<utility:logger level="INFO" value="timix:owlcarouselAdvancedSettings ? ${jcr:isNodeType(currentNode, 'timix:owlcarouselAdvancedSettings')}"/>--%>
<%--<utility:logger level="INFO" value="timix:owlCarouselT ? ${jcr:isNodeType(currentNode, 'timix:owlCarouselT')}"/>--%>

<c:if test="${jcr:isNodeType(currentNode, 'timix:owlcarouselAdvancedSettings')}">
    <c:set var="options" value="${currentNode.properties.options.string}"/>
    <c:set var="class" value="${currentNode.properties.class.string}"/>
</c:if>

<c:set var="className" value="${class} ${renderContext.editMode?'j-owl-carousel-edit':''}"/>

<%--<utility:logger level="INFO" value="options ? ${currentNode.properties.options.string}"/>--%>
<%--<utility:logger level="INFO" value="options ? ${options}"/>--%>

<%--<c:out value="${not empty options?options:''}"/>--%>

<%-- The view is based on naming convention. Each view is linked to a specific carousel mixin--%>
<section id="${sliderId}" class="${className}">
    <template:include view="${displayView}"/>
</section>

<script>
    <%--console.log("options string: ",${options});--%>
    <%--console.log("options out string: ",${not empty options?options:''});--%>
    <c:if test="${!renderContext.editMode}">
    $('#${sliderId}').owlCarousel(${not empty options?options:''});
    </c:if>
</script>


<c:if test="${renderContext.editMode}">
    <%--
    As only one child type is defined no need to restrict
    if a new child type is added restriction has to be done
    using 'nodeTypes' attribute
    --%>
    <template:module path="*" />
</c:if>