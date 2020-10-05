<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="cl" uri="http://www.jahia.org/tags/cloudinary" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css" />--%>
<%--<template:addResources type="javascript" resources="jquery.min.js,popper.min.js,bootstrap.min.js"/>--%>

<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:set var="imageNode" value="${currentNode.properties.image.node}"/>

<template:addCacheDependency node="${imageNode}"/>
<c:url var="imageURL" value="${imageNode.url}"/>

<div class="inner-page">
    <%--
        NOTE :

        background-image : image-set(
          url('../img/carousel/bg_360.jpg') 1x,
          url('../img/carousel/bg_780.jpg') 2x
        );
        is currently not well supported. Use it when it will be supported
    --%>
    <c:choose>
        <c:when test="${jcr:isNodeType(renderContext.site, 'cldin:configuration') && renderContext.liveMode == true}">
            <%-- cloudinary config params --%>
            <c:set var="gravity" value="${not empty currentResource.moduleParams.gravity ? currentResource.moduleParams.gravity : 'auto'}"/>
            <c:set var="crop" value="${not empty currentResource.moduleParams.crop ? currentResource.moduleParams.crop : 'fill'}"/>
            <c:set var="raw" value="${not empty currentResource.moduleParams.raw ? currentResource.moduleParams.raw : ''}"/>
            <c:set var="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '1900'}"/>
            <div class="slider-item" style="background-image: url('<cl:url node="${currentNode.properties.image.node.url}" width="${width}" crop="${crop}" gravity="${gravity}" raw="${raw}"/>');">
        </c:when>
        <c:otherwise>
            <div class="slider-item" style="background-image: url('${imageURL}');">
    </c:otherwise>
    </c:choose>
<%--    <div class="slider-item" style="background-image: url('${imageURL}');">--%>
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 pt-5 element-animate">
                    <%-- --%>
                    ${body}
                    <%--                    <h1 class="pt-5"><span>About Us</span></h1>--%>
                    <%--                    <p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero sit, saepe? Rem, libero repellendus eum.</p>--%>
                </div>
            </div>
        </div>
    </div>
</div>