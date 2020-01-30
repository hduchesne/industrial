<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="imagePosition" value="${currentNode.properties.imagePosition.string == 'right'?'order-2':'' }"/>

<div class="half d-lg-flex d-block">
    <div class="image ${imagePosition} ${renderContext.editMode == true?' position-relative':''}">
        <template:module path="image" nodeTypes="tint:image" view="hidden.halfBlock"/>
    </div>
    <div class="text text-center">
        <template:module path="body" nodeTypes="tint:text"/>
    </div>
</div>