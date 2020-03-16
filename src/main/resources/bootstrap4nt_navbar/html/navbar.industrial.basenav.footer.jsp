<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--<template:addResources type="css" resources="bootstrap.min.css"/>--%>
<%--<template:addResources type="javascript" resources="jquery.min.js"/>--%>
<%--<template:addResources type="javascript" resources="popper.min.js"/>--%>
<%--<template:addResources type="javascript" resources="bootstrap.min.js"/>--%>

<c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:customBaseNavbar')}">
    <c:set var="ulClass" value="${currentNode.properties.ulClass.string}"/>
    <c:set var="recursive" value="${currentNode.properties.recursive.boolean}"/>
</c:if>
<c:if test="${empty ulClass}">
    <c:set var="ulClass" value="navbar-nav mr-auto"/>
</c:if>
<c:if test="${empty recursive}">
    <c:set var="recursive" value="true"/>
</c:if>
<c:set var="root" value="${currentNode.properties.root.string}"/>
<c:set var="curentPageNode" value="${renderContext.mainResource.node}"/>
<c:if test="${! jcr:isNodeType(curentPageNode,'jmix:navMenuItem')}">
    <c:set var="curentPageNode" value="${jcr:getParentOfType(curentPageNode, 'jmix:navMenuItem')}"/>
</c:if>

<c:choose>
    <c:when test="${root eq 'currentPage'}">
        <c:set var="rootNode" value="${curentPageNode}"/>
    </c:when>
    <c:when test="${root eq 'parentPage'}">
        <c:set var="rootNode" value="${curentPageNode.parent}"/>
    </c:when>
    <c:otherwise>
        <c:set var="rootNode" value="${renderContext.site.home}"/>
    </c:otherwise>
</c:choose>
<c:set var="level1Pages" value="${jcr:getChildrenOfType(rootNode, 'jmix:navMenuItem')}"/>
<c:set var="hasLevel1Pages" value="${fn:length(level1Pages) > 0}"/>
<c:if test="${hasLevel1Pages}">
    <ul class="${ulClass}">
        <c:forEach items="${level1Pages}" var="level1Page" varStatus="status">
            <c:set var="displayLevel1Page" value="true"/>
            <c:if test="${!empty level1Page.properties['j:displayInMenuName']}">
                <c:set var="displayLevel1Page" value="false"/>
                <c:forEach items="${level1Page.properties['j:displayInMenuName']}" var="display">
                    <c:if test="${display.string eq currentNode.name}">
                        <c:set var="displayLevel1Page" value="${display.string eq currentNode.name}"/>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${displayLevel1Page}">
                <c:choose>
                    <c:when test="${jcr:isNodeType(level1Page, 'jnt:navMenuText')}">
                        <c:set var="page1Url" value="#"/>
                        <c:set var="page1Title" value="${level1Page.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(level1Page, 'jnt:externalLink')}">
                        <c:url var="page1Url" value="${level1Page.properties['j:url'].string}"/>
                        <c:set var="page1Title" value="${level1Page.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(level1Page, 'jnt:page')}">
                        <c:url var="page1Url" value="${level1Page.url}"/>
                        <c:set var="page1Title" value="${level1Page.displayableName}"/>
                    </c:when>
                    <c:when test="${jcr:isNodeType(level1Page, 'jnt:nodeLink')}">
                        <c:url var="page1Url" value="${level1Page.properties['j:node'].node.url}"/>
                        <c:set var="page1Title" value="${level1Page.properties['jcr:title'].string}"/>
                        <c:if test="${empty page1Title}">
                            <c:set var="page1Title"
                                   value="${level1Page.properties['j:node'].node.displayableName}"/>
                        </c:if>
                    </c:when>
                </c:choose>
                <c:if test="${fn:contains(renderContext.mainResource.path, level1Page.path)}">
                    <c:set var="page1Active" value="true"/>
                </c:if>
                <c:set var="level2Pages" value="${jcr:getChildrenOfType(level1Page, 'jmix:navMenuItem')}"/>
                <c:set var="hasLevel2Pages" value="${fn:length(level2Pages) > 0}"/>
                <c:choose>
                    <c:when test="${hasLevel2Pages && recursive}">
                        <li class="nav-item  ${page1Active? ' active' :''} dropdown">
                            <a class="nav-link dropdown-toggle ${page1Active? ' active' :''}" href="#"
                               id="navbarDropdownMen-${level1Page.identifier}"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${page1Title}
                            </a>
                            <div class="dropdown-menu"
                                 aria-labelledby="navbarDropdownMen-${level1Page.identifier}">
                                <a class="dropdown-item" href="${page1Url}">${page1Title}</a>
                                <div class="dropdown-divider"></div>
                                <c:forEach items="${level2Pages}" var="level2Page" varStatus="status">
                                    <c:set var="displayLevel2Page" value="true"/>
                                    <c:if test="${!empty level2Page.properties['j:displayInMenuName']}">
                                        <c:set var="displayLevel2Page" value="false"/>
                                        <c:forEach items="${level2Page.properties['j:displayInMenuName']}"
                                                   var="display">
                                            <c:if test="${display.string eq currentNode.name}">
                                                <c:set var="displayLevel2Page"
                                                       value="${display.string eq currentNode.name}"/>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${displayLevel2Page}">
                                        <c:choose>
                                            <c:when test="${jcr:isNodeType(level2Page, 'jnt:navMenuText')}">
                                                <c:set var="page2Url" value="#"/>
                                                <c:set var="page2Title" value="${level2Page.displayableName}"/>
                                            </c:when>
                                            <c:when test="${jcr:isNodeType(level2Page, 'jnt:externalLink')}">
                                                <c:url var="page2Url"
                                                       value="${level2Page.properties['j:url'].string}"/>
                                                <c:set var="page2Title" value="${level2Page.displayableName}"/>
                                            </c:when>
                                            <c:when test="${jcr:isNodeType(level2Page, 'jnt:page')}">
                                                <c:url var="page2Url" value="${level2Page.url}"/>
                                                <c:set var="page2Title" value="${level2Page.displayableName}"/>
                                                <c:if test="${fn:contains(renderContext.mainResource.path, level2Page.path)}">
                                                    <c:set var="page2Active" value="true"/>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${jcr:isNodeType(level2Page, 'jnt:nodeLink')}">
                                                <c:url var="page2Url"
                                                       value="${level2Page.properties['j:node'].node.url}"/>
                                                <c:set var="page2Title"
                                                       value="${level2Page.properties['jcr:title'].string}"/>
                                                <c:if test="${empty page2Title}">
                                                    <c:set var="page2Title"
                                                           value="${level2Page.properties['j:node'].node.displayableName}"/>
                                                </c:if>
                                            </c:when>
                                        </c:choose>
                                        <a class="dropdown-item ${page2Active? ' active' :''}"
                                           href="${page2Url}">${page2Title} <c:if test="${page2Active}"><span
                                                class="sr-only">(current)</span></c:if></a>
                                    </c:if>
                                    <c:remove var="page2Active"/>
                                    <c:remove var="page2Url"/>
                                    <c:remove var="page2Title"/>
                                </c:forEach>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="${page1Active? ' active' :''}">
                            <a href="${page1Url}">${page1Title} <c:if
                                    test="${page1Active}"><span class="sr-only">(current)</span></c:if></a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <c:remove var="page1Active"/>
            <c:remove var="page1Url"/>
            <c:remove var="page1Title"/>
        </c:forEach>
    </ul>
</c:if>
