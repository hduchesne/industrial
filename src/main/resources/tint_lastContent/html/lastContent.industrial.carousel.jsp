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
<%@ taglib prefix="tempalte" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>
<c:set var="subNodeView" value="blog.item"/>

<c:set var="rand">
    <%= java.lang.Math.round(java.lang.Math.random() * 10000) %>
</c:set>
<c:set var="sliderId" value="slider-${rand}"/>

<template:include view="hidden.load"/>
<c:set var="listQuery" value="${moduleMap.listQuery}"/>
<jcr:jqom var="result" qomBeanName="listQuery" />

<c:choose>
    <c:when test="${empty result}">
        <p>${moduleMap.emptyListMessage}</p>
    </c:when>
    <c:otherwise>
        <section class="section latest-content">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-8 text-center">
                        <h2 class="heading mb-4">${titleEscaped}</h2>
                        ${teaser}
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div id="${sliderId}" class="owl-carousel">
                            <c:forEach items="${result.nodes}" var="node">
                                <template:module view="${subNodeView}" node="${node}" editable="false"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            $('#${sliderId}').owlCarousel({
                center: false,
                items: 3,
                autoplay: true,
                autoPlaySpeed: 5000,
                autoPlayTimeout: 5000,
                autoplayHoverPause: true,
                loop: true,
                stagePadding: 20,
                margin:50,
                nav: true,
                smartSpeed: 1000,
                // navText: ['<span class="ion-ios-arrow-back">', '<span class="ion-ios-arrow-forward">'],
                responsive:{
                    600:{
                        stagePadding: 20,
                        items:1
                    },
                    800:{
                        stagePadding: 20,
                        items:2
                    },
                    1000:{
                        // stagePadding: 200,
                        items:3
                    }
                }
            });
        </script>
    </c:otherwise>
</c:choose>
