<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css" />--%>
<%--<template:addResources type="javascript" resources="jquery.min.js,popper.min.js,bootstrap.min.js"/>--%>

<c:set var="body" value="${currentNode.properties.body.string}"/>

<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imageNode}"/>

<c:set var="imageURL" value="${imageNode.getUrl()}"/>

<%--Image url with params--%>
<%--<c:set var="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '2000'}"/>--%>
<%--<c:set var="height" value="${currentResource.moduleParams.mediaHeight}"/>--%>
<%--<c:set var="imageURL" value="${imageNode.getUrl(['width:'.concat(width),'height:'.concat(height)])}"/>--%>

<%--Old way--%>
<%--<template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">--%>
<%--    <template:param name="width" value="${not empty currentResource.moduleParams.width ? currentResource.moduleParams.width : '2000'}"/>--%>
<%--    <template:param name="height" value="${currentResource.moduleParams.mediaHeight}"/>--%>
<%--    <template:param name="scale" value="${currentResource.moduleParams.mediaScale}"/>--%>
<%--    <template:param name="quality" value="${currentResource.moduleParams.mediaQuality}"/>--%>
<%--</template:module>--%>


<div class="inner-page">
    <div class="slider-item" style="background-image: url('${imageURL}');">
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
