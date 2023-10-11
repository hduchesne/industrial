<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<fmt:setLocale value="${currentResource.locale.language}" scope="session"/>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>
<c:set var="body" value="${currentNode.properties['body'].string}"/>

<fmt:message key="label.date.at" var="at"/>
<c:set var="date" value="${currentNode.properties['date'].date}"/>
<fmt:formatDate value="${date.time}" pattern="dd MMM yyyy" var="formatedDate"/>
<fmt:formatDate value="${date.time}" pattern="HH:ss" var="formatedTime"/>
<c:if test="${not empty formatedDate && formatedTime != '00:00'}">
    <c:set var="formatedDate" value="${formatedDate} ${at} ${formatedTime}"/>
</c:if>

<c:set var="imageNode" value="${currentNode.properties['imageLandscape'].node}"/>
<template:addCacheDependency node="${imageNode}"/>
<template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
    <template:param name="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '2000'}"/>
    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>
    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>
    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>
</template:module>

<div class="inner-page">
    <div class="slider-item" style="background-image: url('${imageURL}');">
    </div>
</div>

<section class="pb-5">
    <div class="container container-content bg-white">
        <div class="row justify-content-center">
            <div class="col-md-10 mb-5">
                <h1>${titleEscaped}</h1>
                <div class="border-top border-bottom border-secondary pt-4 pb-4">
                    <span class="ion-md-calendar mr-2"></span>
                    <fmt:message key="label.date.createdAt"/> : ${formatedDate}
                </div>
            </div>
        </div>

        <div class="row row-teaser justify-content-center">
            <div class="col-md-10">
                <div class="lead">
                    ${teaser}
                </div>
            </div>
        </div>

        <div class="row row-article justify-content-center">
            <div class="col-md-10">
                ${body}
            </div>
        </div>
    </div>
</section>