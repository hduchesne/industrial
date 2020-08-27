<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<%--<c:set var="alt" value="${currentNode.properties.name.string}"/>--%>
<c:url var="imageURL" value="${currentNode.properties.image.node.url}"/>

<style>
    .Blob__img--blob-1 {
        clip-path: url(#Blob__path--blob-1);
    }
    .Blob__svg {
        height: 0;
        width: 0;
    }
</style>

<figure class="">
    <svg class="Blob__svg" width="482" height="430" viewBox="0 0 482 430" aria-hidden="true">

        <clipPath id="Blob__path--blob-1" clipPathUnits="objectBoundingBox" transform="scale(0.002074 0.002325)">
            <path d="M0.139080235,263.261354 C-2.82966356,192.500082 42.1611426,128.548098 93.6671606,80.4404771 C127.491442,48.8496355 165.958602,20.816647 210.135534,7.56832561 C254.312466,-5.67573999 305.01726,-2.42004906 342.687414,24.3702443 C361.402308,37.6738912 375.997226,55.9057604 391.283726,73.0992132 C407.995561,91.8971045 425.9514,109.911928 438.770976,131.599511 C451.590551,153.291349 458.877468,179.74969 452.033333,204.03757 C443.67109,233.717555 416.551784,253.83049 389.407176,268.019345 C362.262569,282.208199 332.642602,293.345641 310.921012,315.058759 C281.204056,344.760023 269.316429,388.11391 230.511912,408.826913 C203.236578,423.381767 160.383774,433.242468 129.334256,427.7312 C61.3947228,415.665992 2.88432485,328.694358 0.139080235,263.261354 Z M422.622737,277.714061 C440.624964,271.943189 461.73931,272.611351 471.522671,282.182657 C503.39028,313.369197 455.19458,342.836391 425.072794,336.384591 C424.954719,336.3548 424.832434,336.329265 424.714352,336.303731 C395.279932,329.673186 393.8799,286.936391 422.622737,277.714061 Z"></path>
        </clipPath>
    </svg>

    <template:include view="image">
        <template:param name="class" value="img-fluid Blob__img--blob-1"/>
    </template:include>
</figure>