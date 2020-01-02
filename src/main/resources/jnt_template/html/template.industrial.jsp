<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<jcr:sql
	var="_css_"
	 sql="SELECT * FROM [jnt:file] As node WHERE ISDESCENDANTNODE (node, '${renderContext.site.path}/files/css')"
/>


<html lang="en">
  <head>
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700|Oxygen:400,700" rel="stylesheet">
	  	<%-- used by other module, load it now to be sure it will not be loaded later and overwrite style.css--%>
		<template:addResources type="css" resources="bootstrap.min.css" />

		<template:addResources type="css" resources="animate.css" />
		<template:addResources type="css" resources="owl.carousel.min.css" />
		<template:addResources type="css" resources="jquery.fancybox.min.css" />
<%--		<template:addResources type="css" resources="ionicons.min.css" />--%>
	  	<template:addResources type="css" resources="ionicons.4.6.3.min.css" />
		<template:addResources type="css" resources="font-awesome.min.css" />

		<!-- Theme Style -->
		<template:addResources type="css" resources="style.css" />
    	<template:addResources type="css" resources="style.patch.css" />

	  	<c:forEach items="${_css_.nodes}" var="node">
			<c:url var="customCSSUrl" value="${node.url}"/>
			<template:addResources type="css" resources="${customCSSUrl}"/>
		</c:forEach>

		<c:if test="${renderContext.editMode}">
			<template:addResources type="css" resources="edit.css"/>
		</c:if>

  </head>


	<body>
      	<template:area path="header-container"/>
      	<div class="top-shadow ${renderContext.editMode?'edit':''}"></div>
      	<template:area path="page-content"/>
		<template:area path="footer-container"/>

<%--		<template:addResources type="javascript" resources="jquery-3.3.1.min.js" targetTag="body"/>--%>
<%--      	<template:addResources type="javascript" resources="popper.min.js" targetTag="body"/>--%>
<%--      	<template:addResources type="javascript" resources="bootstrap.min.js" targetTag="body"/>--%>
      	<%-- media="noAggregateAndCompress" --%>
      	<template:addResources type="javascript" resources="owl.carousel.min.js" targetTag="body"/>
      	<template:addResources type="javascript" resources="jquery.waypoints.min.js" targetTag="body"/>
      	<template:addResources type="javascript" resources="jquery.fancybox.min.js" targetTag="body"/>
      	<template:addResources type="javascript" resources="main.js" targetTag="body"/>
<%--        <script src="https://unpkg.com/ionicons@4.6.3/dist/ionicons.js"></script>--%>
	</body>
  
</html>
