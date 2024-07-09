<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="contentType" value="${currentNode.properties['type'].string}"/>
<c:set var="criteria" value="${currentNode.properties['criteria'].string}"/>
<c:set var="sortDirection" value="${currentNode.properties['sortDirection'].string}"/>

<c:set var="maxItems" value="${currentNode.properties['maxItems'].long}"/>
<c:set var="filters" value="${currentNode.properties['filter']}"/>
<c:set var="folderPath" value="${currentNode.properties['startNode'].node.path}"/>
<c:if test="${empty folderPath}">
    <c:set var="folderPath" value="${currentNode.resolveSite.path}"/>
</c:if>

<c:set var="queryConstraint" value="" />
<c:forEach var="filter" items="${filters}" varStatus="status">
    <c:set var="queryConstraint" value="${queryConstraint}${status.first ? '' : ' OR '}contents.[j:defaultCategory] = '${filter}'" />
</c:forEach>
<c:if test="${not empty queryConstraint}">
    <c:set var="queryConstraint" value="AND (${queryConstraint})" />
</c:if>

<c:set var="queryStatement" value="select * from [${contentType}] as contents where ISDESCENDANTNODE('${folderPath}') ${queryConstraint} order by contents.[${criteria}] ${sortDirection}"/>
<utility:logger level="DEBUG" value="queryStatement : ${queryStatement}"/>
<utility:logger level="DEBUG" value="maxItems : ${maxItems}"/>
<template:addCacheDependency flushOnPathMatchingRegexp="${folderPath}/.*"/>

<query:definition var="listQuery" statement="${queryStatement}" limit="${maxItems}"  />

<c:set target="${moduleMap}" property="editable" value="false" />
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="label.content.notFound"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<%--<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['j:subNodesView'].string}" />--%>