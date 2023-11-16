<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<c:set var="alt" value="${fn:escapeXml(currentNode.displayableName)}"/>
<c:set var="widths" value="${fn:split('400,750', ',')}"/>
<c:set var="media" value="${fn:split('(max-width: 768px),(min-width: 769px)', ',')}"/>

<template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="mediaURL" editable="false" templateType="txt">
    <template:param name="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '750'}"/>
</template:module>

<picture>
    <c:forEach items="${widths}" var="width" varStatus="status">
        <template:module node="${currentNode.properties['image'].node}" view="hidden.getURL" var="mediaURL" editable="false" templateType="txt">
            <template:param name="width" value="${width}"/>
        </template:module>
        <source media="${media[status.index]}" srcset="${mediaURL}">
    </c:forEach>
    <img width="100%"
         src="${mediaURL}"
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
