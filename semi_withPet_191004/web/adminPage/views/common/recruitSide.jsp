<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!--Side Bar Start-->
  <div class="page-body">

     <!-- partial:partials/_sidebar.html -->
     <div class="sidebar">
      <div class="user-profile">
        <div class="info-wrapper">
          <p class="user-name">펫시터 지원 메뉴</p>
        </div>
      </div>
      <ul class="navigation-menu">
        <li class="nav-category-divider" style="text-align : center;">MENU</li>
        <li>
          <a href="<%=request.getContextPath()%>/apply/apply_form">
            <span class="link-title">지원하기</span>
            <i class="mdi mdi-clipboard-outline link-icon"></i>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/apply/apply_info">
            <span class="link-title">지원 절차 안내</span>
            <i class="mdi mdi-flower-tulip-outline link-icon"></i>
          </a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/apply/checkApplyStatus">
            <span class="link-title">지원 현황</span>
            <i class="mdi mdi-chart-donut link-icon"></i>
          </a>
        </li>
      </ul>
      
    </div>
    <!--SideBar End-->