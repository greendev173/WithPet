<%@page import="semi_withPet.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginMember");
%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WithPet 관리자 페이지</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/adminPage/assets/vendors/iconfonts/mdi/css/materialdesignicons.css">
<!-- endinject -->
<!-- vendor css for this page -->
<!-- End vendor css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/adminPage/assets/css/shared/style.css">
<!-- endinject -->
<!-- Layout style -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/adminPage/assets/css/demo_2/style.css">
<!-- Layout style -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/adminPage/assets/images/favicon.png">
<script src = "http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.apexcharts-canvas {
	position: relative;
	user-select: none;
	/* cannot give overflow: hidden as it will crop tooltips which overflow outside chart area */
}

/* scrollbar is not visible by default for legend, hence forcing the visibility */
.apexcharts-canvas ::-webkit-scrollbar {
	-webkit-appearance: none;
	width: 6px;
}

.apexcharts-canvas ::-webkit-scrollbar-thumb {
	border-radius: 4px;
	background-color: rgba(0, 0, 0, .5);
	box-shadow: 0 0 1px rgba(255, 255, 255, .5);
	-webkit-box-shadow: 0 0 1px rgba(255, 255, 255, .5);
}

.apexcharts-inner {
	position: relative;
}

.legend-mouseover-inactive {
	transition: 0.15s ease all;
	opacity: 0.20;
}

.apexcharts-series-collapsed {
	opacity: 0;
}

.apexcharts-gridline, .apexcharts-text {
	pointer-events: none;
}

.apexcharts-tooltip {
	border-radius: 5px;
	box-shadow: 2px 2px 6px -4px #999;
	cursor: default;
	font-size: 14px;
	left: 62px;
	opacity: 0;
	pointer-events: none;
	position: absolute;
	top: 20px;
	overflow: hidden;
	white-space: nowrap;
	z-index: 12;
	transition: 0.15s ease all;
}

.apexcharts-tooltip.light {
	border: 1px solid #e3e3e3;
	background: rgba(255, 255, 255, 0.96);
}

.apexcharts-tooltip.dark {
	color: #fff;
	background: rgba(30, 30, 30, 0.8);
}

.apexcharts-tooltip .apexcharts-marker, .apexcharts-area-series .apexcharts-area,
	.apexcharts-line {
	pointer-events: none;
}

.apexcharts-tooltip.active {
	opacity: 1;
	transition: 0.15s ease all;
}

.apexcharts-tooltip-title {
	padding: 6px;
	font-size: 15px;
	margin-bottom: 4px;
}

.apexcharts-tooltip.light .apexcharts-tooltip-title {
	background: #ECEFF1;
	border-bottom: 1px solid #ddd;
}

.apexcharts-tooltip.dark .apexcharts-tooltip-title {
	background: rgba(0, 0, 0, 0.7);
	border-bottom: 1px solid #222;
}

.apexcharts-tooltip-text-value, .apexcharts-tooltip-text-z-value {
	display: inline-block;
	font-weight: 600;
	margin-left: 5px;
}

.apexcharts-tooltip-text-z-label:empty, .apexcharts-tooltip-text-z-value:empty
	{
	display: none;
}

.apexcharts-tooltip-text-value, .apexcharts-tooltip-text-z-value {
	font-weight: 600;
}

.apexcharts-tooltip-marker {
	width: 12px;
	height: 12px;
	position: relative;
	top: 0px;
	margin-right: 10px;
	border-radius: 50%;
}

.apexcharts-tooltip-series-group {
	padding: 0 10px;
	display: none;
	text-align: left;
	justify-content: left;
	align-items: center;
}

.apexcharts-tooltip-series-group.active .apexcharts-tooltip-marker {
	opacity: 1;
}

.apexcharts-tooltip-series-group.active,
	.apexcharts-tooltip-series-group:last-child {
	padding-bottom: 4px;
}

.apexcharts-tooltip-y-group {
	padding: 6px 0 5px;
}

.apexcharts-tooltip-candlestick {
	padding: 4px 8px;
}

.apexcharts-tooltip-candlestick>div {
	margin: 4px 0;
}

.apexcharts-tooltip-candlestick span.value {
	font-weight: bold;
}

.apexcharts-xaxistooltip {
	opacity: 0;
	padding: 9px 10px;
	pointer-events: none;
	color: #373d3f;
	font-size: 13px;
	text-align: center;
	border-radius: 2px;
	position: absolute;
	z-index: 10;
	background: #ECEFF1;
	border: 1px solid #90A4AE;
	transition: 0.15s ease all;
}

.apexcharts-xaxistooltip:after, .apexcharts-xaxistooltip:before {
	left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.apexcharts-xaxistooltip:after {
	border-color: rgba(236, 239, 241, 0);
	border-width: 6px;
	margin-left: -6px;
}

.apexcharts-xaxistooltip:before {
	border-color: rgba(144, 164, 174, 0);
	border-width: 7px;
	margin-left: -7px;
}

.apexcharts-xaxistooltip-bottom:after, .apexcharts-xaxistooltip-bottom:before
	{
	bottom: 100%;
}

.apexcharts-xaxistooltip-bottom:after {
	border-bottom-color: #ECEFF1;
}

.apexcharts-xaxistooltip-bottom:before {
	border-bottom-color: #90A4AE;
}

.apexcharts-xaxistooltip-top:after, .apexcharts-xaxistooltip-top:before
	{
	top: 100%;
}

.apexcharts-xaxistooltip-top:after {
	border-top-color: #ECEFF1;
}

.apexcharts-xaxistooltip-top:before {
	border-top-color: #90A4AE;
}

.apexcharts-xaxistooltip.active {
	opacity: 1;
	transition: 0.15s ease all;
}

.apexcharts-yaxistooltip {
	opacity: 0;
	padding: 4px 10px;
	pointer-events: none;
	color: #373d3f;
	font-size: 13px;
	text-align: center;
	border-radius: 2px;
	position: absolute;
	z-index: 10;
	background: #ECEFF1;
	border: 1px solid #90A4AE;
}

.apexcharts-yaxistooltip:after, .apexcharts-yaxistooltip:before {
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.apexcharts-yaxistooltip:after {
	border-color: rgba(236, 239, 241, 0);
	border-width: 6px;
	margin-top: -6px;
}

.apexcharts-yaxistooltip:before {
	border-color: rgba(144, 164, 174, 0);
	border-width: 7px;
	margin-top: -7px;
}

.apexcharts-yaxistooltip-left:after, .apexcharts-yaxistooltip-left:before
	{
	left: 100%;
}

.apexcharts-yaxistooltip-left:after {
	border-left-color: #ECEFF1;
}

.apexcharts-yaxistooltip-left:before {
	border-left-color: #90A4AE;
}

.apexcharts-yaxistooltip-right:after, .apexcharts-yaxistooltip-right:before
	{
	right: 100%;
}

.apexcharts-yaxistooltip-right:after {
	border-right-color: #ECEFF1;
}

.apexcharts-yaxistooltip-right:before {
	border-right-color: #90A4AE;
}

.apexcharts-yaxistooltip.active {
	opacity: 1;
}

.apexcharts-xcrosshairs, .apexcharts-ycrosshairs {
	pointer-events: none;
	opacity: 0;
	transition: 0.15s ease all;
}

.apexcharts-xcrosshairs.active, .apexcharts-ycrosshairs.active {
	opacity: 1;
	transition: 0.15s ease all;
}

.apexcharts-ycrosshairs-hidden {
	opacity: 0;
}

.apexcharts-zoom-rect {
	pointer-events: none;
}

.apexcharts-selection-rect {
	cursor: move;
}

.svg_select_points, .svg_select_points_rot {
	opacity: 0;
	visibility: hidden;
}

.svg_select_points_l, .svg_select_points_r {
	cursor: ew-resize;
	opacity: 1;
	visibility: visible;
	fill: #888;
}

.apexcharts-canvas.zoomable .hovering-zoom {
	cursor: crosshair
}

.apexcharts-canvas.zoomable .hovering-pan {
	cursor: move
}

.apexcharts-xaxis, .apexcharts-yaxis {
	pointer-events: none;
}

.apexcharts-zoom-icon, .apexcharts-zoom-in-icon,
	.apexcharts-zoom-out-icon, .apexcharts-reset-zoom-icon,
	.apexcharts-pan-icon, .apexcharts-selection-icon, .apexcharts-menu-icon
	{
	cursor: pointer;
	width: 20px;
	height: 20px;
	text-align: center;
}

.apexcharts-zoom-icon svg, .apexcharts-zoom-in-icon svg,
	.apexcharts-zoom-out-icon svg, .apexcharts-reset-zoom-icon svg,
	.apexcharts-menu-icon svg {
	fill: #6E8192;
}

.apexcharts-selection-icon svg {
	fill: #444;
	transform: scale(0.86)
}

.apexcharts-zoom-icon.selected svg, .apexcharts-selection-icon.selected svg,
	.apexcharts-reset-zoom-icon.selected svg {
	fill: #008FFB;
}

.apexcharts-selection-icon:not (.selected ):hover svg,
	.apexcharts-zoom-icon:not (.selected ):hover svg,
	.apexcharts-zoom-in-icon:hover svg, .apexcharts-zoom-out-icon:hover svg,
	.apexcharts-reset-zoom-icon:hover svg, .apexcharts-menu-icon:hover svg
	{
	fill: #333;
}

.apexcharts-selection-icon, .apexcharts-menu-icon {
	margin-right: 3px;
	margin-left: 5px;
	position: relative;
	top: 1px;
}

.apexcharts-reset-zoom-icon {
	margin-left: 7px;
}

.apexcharts-zoom-icon {
	transform: scale(1);
}

.apexcharts-zoom-in-icon, .apexcharts-zoom-out-icon {
	transform: scale(0.8)
}

.apexcharts-zoom-out-icon {
	margin-right: 3px;
}

.apexcharts-pan-icon {
	transform: scale(0.72);
	position: relative;
	left: 1px;
	top: 0px;
}

.apexcharts-pan-icon svg {
	fill: #fff;
	stroke: #6E8192;
	stroke-width: 2;
}

.apexcharts-pan-icon.selected svg {
	stroke: #008FFB;
}

.apexcharts-pan-icon:not (.selected ):hover svg {
	stroke: #333;
}

.apexcharts-toolbar {
	position: absolute;
	z-index: 11;
	top: 0px;
	right: 3px;
	max-width: 176px;
	text-align: right;
	border-radius: 3px;
	padding: 0px 6px 2px 6px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.apexcharts-toolbar svg {
	pointer-events: none;
}

.apexcharts-menu {
	background: #fff;
	position: absolute;
	top: 100%;
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 3px;
	right: 10px;
	opacity: 0;
	min-width: 110px;
	transition: 0.15s ease all;
	pointer-events: none;
}

.apexcharts-menu.open {
	opacity: 1;
	pointer-events: all;
	transition: 0.15s ease all;
}

.apexcharts-menu-item {
	padding: 6px 7px;
	font-size: 12px;
	cursor: pointer;
}

.apexcharts-menu-item:hover {
	background: #eee;
}

@media screen and (min-width: 768px) {
	.apexcharts-toolbar {
		/*opacity: 0;*/
		
	}
	.apexcharts-canvas:hover .apexcharts-toolbar {
		opacity: 1;
	}
}

.apexcharts-datalabel.hidden {
	opacity: 0;
}

.apexcharts-pie-label, .apexcharts-datalabel,
	.apexcharts-datalabel-label, .apexcharts-datalabel-value {
	cursor: default;
	pointer-events: none;
}

.apexcharts-pie-label-delay {
	opacity: 0;
	animation-name: opaque;
	animation-duration: 0.3s;
	animation-fill-mode: forwards;
	animation-timing-function: ease;
}

.apexcharts-canvas .hidden {
	opacity: 0;
}

.apexcharts-hide .apexcharts-series-points {
	opacity: 0;
}

.apexcharts-area-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
	.apexcharts-line-series .apexcharts-series-markers .apexcharts-marker.no-pointer-events,
	.apexcharts-radar-series path, .apexcharts-radar-series polygon {
	pointer-events: none;
}

/* markers */
.apexcharts-marker {
	transition: 0.15s ease all;
}

@
keyframes opaque { 0% {
	opacity: 0;
}
100%
{
opacity
:
 
1;
}
}
</style>
<style type="text/css">/* Chart.js */
@
-webkit-keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
@
keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	-webkit-animation: chartjs-render-animation 0.001s;
	animation: chartjs-render-animation 0.001s;
}
</style>
<style type="text/css">
@
keyframes resizeanim {from { opacity:0;
	
}

to {
	opacity: 0;
}

}
.resize-triggers {
	animation: 1ms resizeanim;
	visibility: hidden;
	opacity: 0;
}

.resize-triggers, .resize-triggers>div, .contract-trigger:before {
	content: " ";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	overflow: hidden;
}

.resize-triggers>div {
	background: #eee;
	overflow: auto;
}

.contract-trigger:before {
	width: 200%;
	height: 200%;
}
</style>
</head>
<body class="header-fixed">
	<!-- partial:partials/_header.html -->

	<!--Navigation Start-->
	<!--Navigation Start-->
	<nav class="t-header">
		<div class="t-header-brand-wrapper" style="border-right : 2px solid coral;">
			<a href="index.html">
				<p class="logo"
					style="color: orange; font-size: 20px; padding-left: 1.2em;">AdminPage</p>
				<img class="logo-mini" src="<%=request.getContextPath() %>/adminPage/assets/images/favicon-144x144.png"
				alt="">
			</a>
		</div>
		<div class="t-header-content-wrapper" style="margin-left: -2px;">
			<div class="t-header-content">
				<button
					class="t-header-toggler t-header-mobile-toggler d-block d-lg-none">
					<i class="mdi mdi-menu" style="background-color : white";></i>
				</button>
				<div class="item-wrapper" style="padding-right: 20px;">
					<div class="demo-wrapper">
						<div class="btn btn-outline-success btn-rounded"
							onclick="main();">관리자페이지 메인</div>
						<div class="btn btn-outline-info btn-rounded"
							onclick="home();">홈페이지로  이동</div>
					</div>
				</div>
				<!--상단 메뉴 버튼 클릭시 페이지 전환 스크립트-->
				<script>
					function main() {
						
						location.href="<%=request.getContextPath()%>/admin/adminMain";
					}
					function home() {
						var con = confirm("홈페이지로 이동하시겠습니까?");
						if(con){
							location.href="<%=request.getContextPath()%>/";
						} else {
							
						}
					}
				</script>
				<!--상단 메뉴 버튼 클릭시 페이지 전환 스크립트 종료-->


				
			</div>
		</div>
	</nav>
	<!-- partial -->
	<!--Navigation End-->
	
	<!--Side Bar Start-->
  <div class="page-body">

     <!-- partial:partials/_sidebar.html -->
     <div class="sidebar" style="border-right : 2px solid coral;"/>
      <div class="user-profile">
        <div class="display-avatar animated-avatar">
          <img class="profile-img img-lg rounded-circle" src="<%=request.getContextPath() %>/adminPage/assets/images/profile/male/image_1.png" alt="profile image">
        </div>
        <div class="info-wrapper">
          <p class="user-name"><%=m.getUserName() %></p>
          <h6 class="display-income">System Manager</h6> <!--관리자 직책-->
        </div>
      </div>
      <ul class="navigation-menu">
        <li class="nav-category-divider">MENU</li>
        <li>
          <a href="<%=request.getContextPath()%>/adminPage/adminMain.jsp">
            <span class="link-title">메인</span>
            <i class="mdi mdi-gauge link-icon"></i>
          </a>
        </li>
        <li>
          <a href="#sample-pages" data-toggle="collapse" aria-expanded="false">
            <span class="link-title">회원 관리</span>
            <i class="mdi mdi-flask link-icon"></i>
          </a>
          <ul class="collapse navigation-submenu" id="sample-pages">
            <li>
              <a href="<%=request.getContextPath()%>/admin/view_member?grade=C">일반 회원 조회</a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/admin/view_member?grade=G">일반 펫시터 조회</a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/admin/view_member?grade=M">우수 펫시터 조회</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin/permitApply">
            <span class="link-title">펫시터 승인</span>
            <i class="mdi mdi-bullseye link-icon"></i>
          </a>
        </li>
      </ul>
      
    </div>
    <!--SideBar End-->