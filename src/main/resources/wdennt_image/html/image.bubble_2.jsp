<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>

<style>
    .Blob__img--blob-2 {
        clip-path: url(#Blob__path--blob-2);
    }
    .Blob__svg {
        height: 0;
        width: 0;
    }
</style>

<figure class="">
    <svg class="Blob__svg" width="482" height="430" viewBox="0 0 482 430" aria-hidden="true">

        <clipPath id="Blob__path--blob-2" clipPathUnits="objectBoundingBox" transform="scale(0.002074 0.001785)">
            <path d="M315.068133,21.0160081 C400.971626,66.9930001 471.57001,158.390729 478.954037,246.733628 C496.159623,452.699673 438.329879,484.903882 359.557363,532.14192 C335.96018,546.29587 258.6993,564.10254 189.999789,559.155809 C146.799079,556.042545 104.706591,538.104339 68.0745945,516.843905 C3.26408289,479.234315 -19.6964753,395.131358 18.5942704,335.650617 C28.6826026,319.986894 42.1935571,306.204973 52.3378119,290.575696 C87.8221506,235.856065 77.54714,166.990574 101.011737,107.456649 C110.531031,83.3166723 143.26556,20.0835373 215.091106,2.81995088 C248.752912,-5.26979888 285.243519,5.04958768 315.068133,21.0160081 Z"></path>
        </clipPath>
    </svg>

    <template:include view="default">
        <template:param name="class" value="img-fluid Blob__img--blob-2"/>
        <template:param name="widths" value="${currentResource.moduleParams.widths}"/>
        <template:param name="defaultWidth" value="${currentResource.moduleParams.defaultWidth}"/>
    </template:include>
</figure>