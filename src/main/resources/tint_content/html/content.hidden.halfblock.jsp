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

<%--<c:url value="${url.server}${url.context}${url.base}${currentNode.path}.html" var="itemUrl"/>--%>
<c:url value="${currentNode.url}" var="contentURL"/>

<c:set var="imageNode" value="${currentNode.properties['imageLandscape'].node}"/>
<template:addCacheDependency node="${imageNode}"/>
<template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
    <template:param name="width" value="${currentResource.moduleParams.width}"/>
    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>
    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>
    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>
</template:module>

<div class="half d-lg-flex d-block">
    <div class="image ${currentResource.moduleParams.order}" style="background-image: url('${imageURL}')"></div>
    <div class="text text-center">
        <h3 class="mb-4">${titleEscaped}</h3>
        ${functions:abbreviate(functions:removeHtmlTags(teaser),300,350,'...')}
        <p class="mt-5"><a href="${contentURL}" class="btn btn-primary btn-sm px-3 py-2"><fmt:message key="label.content.readMore"/></a></p>
    </div>
</div>