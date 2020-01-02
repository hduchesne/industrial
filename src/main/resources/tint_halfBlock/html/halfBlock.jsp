<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:set var="imagePosition" value="${currentNode.properties.imagePosition.string == 'right'?'order-2':'' }"/>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<div class="half d-lg-flex d-block">
    <div class="image ${imagePosition} element-animate" data-animate-effect="fadeIn" style="background-image: url('${imageURL}')"></div>
    <div class="text text-center element-animate">
        ${body}
        <%--                <h3 class="mb-4">Our Mission</h3>--%>
        <%--                <p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>--%>
        <%--                <p><a href="#" class="btn btn-primary btn-sm px-3 py-2">Learn More</a></p>--%>
    </div>
</div>