<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--<c:set var="alt" value="${currentNode.properties.name.string}"/>--%>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<%--<img src="${imageURL}" alt="${alt}"/>--%>
<div class="image-display" style="background-image: url('${imageURL}');"></div>