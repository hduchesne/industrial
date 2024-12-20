<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="widths" value="${not empty currentNode.properties['imageWidths'] ? currentNode.properties['imageWidths'] : fn:split('400,750', ',')}"/>
<c:set var="media" value="${not empty currentNode.properties['imageMedia'] ? currentNode.properties['imageMedia'] : fn:split('(max-width: 768px),(min-width: 769px)', ',')}"/>
<c:set var="width" value="${currentNode.properties['defaultImageWidth'].long}"/>

<c:if test="${empty width}">
    <c:set var="width" value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '750'}"/>
</c:if>

<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<%--<c:catch var ="getUrlException">--%>
    <utility:logger level="info" value="getUrl(['width:${width}']) for node ${imageNode.identifier}"/>
<%--    <c:set var="imageURL" value="${imageNode.getUrl(['width:'.concat(width)])}"/>--%>
<c:set var="imageURL" value="${imageNode.getUrl(['width:800'])}"/>
<%--</c:catch>--%>
<%--<c:if test = "${getUrlException != null}">--%>
<%--    <utility:logger level="info" value="getUrl() for node ${imageNode.identifier}"/>--%>
<%--    <c:set var="imageURL" value="${imageNode.getUrl()}"/>--%>
<%--</c:if>--%>

<picture>
    <c:forEach items="${widths}" var="width" varStatus="status">
        <c:catch var ="getUrlException">
            <c:set var="currentImageURL" value="${imageNode.getUrl(['width:'.concat(width)])}"/>
        </c:catch>
        <c:if test = "${getUrlException != null}">
            <c:set var="currentImageURL" value="${imageNode.getUrl()}"/>
        </c:if>

        <source media="${media[status.index]}" srcset="${currentImageURL}">
    </c:forEach>
    <img width="100%"
         src="${imageURL}"
         class="${currentResource.moduleParams.class}"
         alt="${alt}"
    />
</picture>

<%--<c:set var="sizes" value="(min-width: 768px) 375px, 200px"/>--%>
<%--<c:set var="sizes" value="(max-width: 768px) 100vw, 50vw"/>--%>

<%--<template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="mediaURL" editable="false" templateType="txt">--%>
<%--    <template:param name="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '750'}"/>--%>
<%--    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>--%>
<%--    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>--%>
<%--    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>--%>
<%--</template:module>--%>

<%--<img width="100%"--%>
<%--     srcset="<c:forEach items="${fn:split(widths, ',')}" var="width" varStatus="status">--%>
<%--                <c:if test="${!status.first}">,</c:if>--%>
<%--                <template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="mediaURL" editable="false" templateType="txt">--%>
<%--                    <template:param name="width" value="${width}"/>--%>
<%--                </template:module>--%>
<%--                 <c:out value="${mediaURL} ${width}w" />--%>
<%--            </c:forEach>"--%>
<%--     sizes="${sizes}"--%>
<%--     src="${mediaURL}"--%>
<%--     class="${currentResource.moduleParams.class}"--%>
<%--     alt="${alt}"--%>
<%--/>--%>
