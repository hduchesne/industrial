<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<utility:logger level="DEBUG" value=" ***** owcarouseItemS Industrial :  WIN"/>

<c:set var="caption" value="${currentNode.properties.caption.string}"/>

<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imageNode}"/>
<c:set var="width" value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '1920'}"/>
<c:set var="height" value="${currentResource.moduleParams.mediaHeight}"/>
<c:set var="scale" value="${currentResource.moduleParams.mediaScale}"/>
<c:set var="quality" value="${currentResource.moduleParams.mediaQuality}"/>

<c:catch var ="getUrlException">
    <c:set var="imageURL" value="${imageNode.getUrl(['width:'.concat(width),'height:'.concat(height),'scale:'.concat(scale),'quality:'.concat(quality)])}"/>
</c:catch>
<c:if test = "${getUrlException != null}">
    <c:set var="imageURL" value="${imageNode.getUrl()}"/>
</c:if>


<c:set var="mediaSource" value="${currentNode.properties['ti:mediaSource'].string}" />
<c:choose>
    <c:when test="${mediaSource eq 'reference'}">
        <c:set var="videoNode" value="${currentNode.properties['ti:video'].node}"/>
        <c:catch var ="getVideoUrlException">
            <c:set var="videoURL" value="${videoNode.getUrl(['quality:1080p'])}"/>
        </c:catch>
        <c:if test = "${getVideoUrlException != null}">
            <c:set var="videoURL" value="${videoNode.getUrl()}"/>
        </c:if>

    </c:when>
    <c:when test="${mediaSource eq 'url'}">
        <c:url var="videoURL" value="${currentNode.properties['ti:video'].string}"/>
    </c:when>
</c:choose>

<utility:logger level="DEBUG" value=" ***** owcarouseItemS Industrial mediaSource :  ${mediaSource}"/>
<utility:logger level="DEBUG" value=" ***** owcarouseItemS Industrial videoURL :  ${videoURL}"/>

<%-- TODO review video URL based on new mixin --%>
<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="card j-owl-carousel-card-edit">
            <img class="card-img-top" src="${imageURL}" alt="Card image cap">
            <div class="card-body">
                    ${caption}
                    <%--                <h5 class="card-title">Card title</h5>--%>
                    <%--                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
                    <%--                <a href="#" class="btn btn-primary">Go somewhere</a>--%>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="slider-item" style="background-image: url('${imageURL}');">
            <div class="container">
                <div class="row slider-text align-items-center justify-content-center">
                    <div class="col-lg-7 text-center col-sm-12 element-animate">
                        <c:if test="${not empty videoURL}">
                        <div class="btn-play-wrap mx-auto">
                            <p class="mb-4">
                                <a href="${videoURL}" data-fancybox data-ratio="2" class="btn-play">
                                    <span class="ion ion-ios-play"></span>
                                </a>
                            </p>
                        </div>
                        </c:if>
                            ${caption}
                            <%--                        <h1 class="mb-4"><span>We Are Industrial Company</span></h1>--%>
                            <%--                        <p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias iste ipsa excepturi nostrum sequi molestias?</p>--%>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
