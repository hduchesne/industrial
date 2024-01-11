<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <template:include view="default">
            <template:param name="class" value="img-fluid"/>
        </template:include>
    </c:when>
    <c:otherwise>
        <c:set var="imageNode" value="${currentNode.properties['image'].node}"/>

        <c:set var="width" value="${currentResource.moduleParams.mediaWidth}"/>
        <c:set var="height" value="${not empty currentResource.moduleParams.mediaHeight ? currentResource.moduleParams.mediaHeight : '600'}"/>
        <c:set var="scale" value="${currentResource.moduleParams.mediaScale}"/>
        <c:set var="quality" value="${currentResource.moduleParams.mediaQuality}"/>

        <c:catch var ="getUrlException">
            <c:set var="imageURL" value="${imageNode.getUrl(['width:'.concat(width),'height:'.concat(height),'scale:'.concat(scale),'quality:'.concat(quality)])}"/>
        </c:catch>
        <c:if test = "${getUrlException != null}">
            <c:set var="imageURL" value="${imageNode.getUrl()}"/>
        </c:if>

        <div class="scaling-image h-100">
            <div class="frame h-100">
                <div class="feature-img-bg h-100" style="background-image: url('${imageURL}');">
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


<%--<div class="scaling-image">--%>
<%--    <div class="frame">--%>
<%--        <template:include view="image">--%>
<%--            <template:param name="class" value="img-fluid"/>--%>
<%--        </template:include>--%>
<%--    </div>--%>
<%--</div>--%>
