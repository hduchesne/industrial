<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>

<template:include view="hidden.load"/>
<c:set var="listQuery" value="${moduleMap.listQuery}"/>
<jcr:jqom var="result" qomBeanName="listQuery" />

<c:choose>
    <c:when test="${empty result}">
        <p>${moduleMap.emptyListMessage}</p>
    </c:when>
    <c:otherwise>
        <section class="section blog">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-8 text-center">
                        <h2 class=" heading mb-4">${titleEscaped}</h2>
                        ${teaser}
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <c:forEach items="${result.nodes}" var="node" begin="0" end="0">
                            <template:module view="blog.headline" node="${node}"/>
                        </c:forEach>
                    </div>
                    <div class="col-md-6">
                        <c:forEach items="${result.nodes}" var="node" begin="1" end="2">
                            <template:module view="blog.default" node="${node}"/>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
    </c:otherwise>
</c:choose>
