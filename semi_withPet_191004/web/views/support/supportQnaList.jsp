<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, jimin_withPet.model.vo.Qna" %>
<%
	List<Qna> list = (List)request.getAttribute("list");
	int numPerPage = (int)request.getAttribute("numPerPage");
	String category = (String)request.getAttribute("category");
	String type = (String)request.getAttribute("searchType");
	
%>
<%@ include file="/views/common/header.jsp"%>


	<div id="banner-area">
		<img style="background-color : orange; width : 100%; height : 300px" />
		<div class="parallax-overlay"></div><!-- 해당 줄 삭제시 그물망 없어짐 -->
			<!-- Subpage title start -->
			<div class="banner-title-content">
	        	<div class="text-center">
		        	<h2>Q & A</h2>
		        	<ul class="breadcrumb">
			            <li>Home</li>
			            <li><a href="#"> Q & A</a></li>
		          	</ul>
	          	</div>
          	</div><!-- Subpage title end -->
	</div><!-- Banner area end -->
	
	
	<section>
        <!-- 메뉴바 바로 아래 부분 -->
        <article>
        <div id="write-button" style="width: 80%; margin: auto;">
            <a class ="project-btn btn btn-primary">글쓰기</a>
            <br>
        </div> 
        
        <div style="display:block; margin-left:50px;">
        	<select id="searchType">
        		<option value="category"> 카테고리</optyin>
        		<option value="answer">답변유무</option>
        		<option value="writer">작성자</option>
        		<option value="content">내용</option>
        	</select>
        	
        	<div id="search-category">
        		<form action = "<%=request.getContextPath() %>/supportQnaFinder" id="categoryFrm">
        			<input type="hidden" name="searchType" value="category"/>
        			<select name="category" id="category">
        				<option value="all" >전체</option>
        				<option value="price" >가격문의</option>
        				<option value="matching" >매칭문의</option>
        				<option value="other" >기타문의</option>
        			</select>
        		</form>
        	</div>
        	
        </div>

        
        
        </article>

        <article>
            <div style="width: 80%; margin: auto;">
            <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="t_title" style="width: 70px;">글번호</th>
                    <th class="t_title" style="width: 120px;">카테고리</th>
                    <th class="t_title" style="width: 120px;">문의상태</th>
                    <th class="t_title" style="width: 140px;">작성자</th>
                    <th class="t_title" >글제목</th>
                    <th class="t_title" style="width: 120px;">작성일</th>
                    <th class="t_title" style="width: 100px;">조회수</th>
                </tr>
                </thead>
                <tbody>
                <%for(Qna q : list) {%>
                <tr>
                    <td class="center"><%if(q.getqNo()%10>9) {%>
                    	0<%=q.getqNo() %>
                    <%} else{%>
                    	00<%=q.getqNo() %>
                    <%} %>
                    </td>
                    <td class="center"><%=q.getCategory() %></td>
                    <td class="center"><%if(q.getAnsYn()=='Y') {%>
                    	답변완료
                    <%} else{%>
                    	답변대기
                    <%} %>
                    </td>
                    <td class="center"><%=q.getWriter() %></td>
                    <td><a href="Q&A(글확인).html"><%=q.getTitle() %></a></td>
                    <!-- 글 제목 클릭시 상세페이지로 전환 -->
                    <td class="center"><%=q.getqDate() %></td>
                    <td class="center"><%=q.getViewCount() %></td>
                </tr>
                <%} %>
                
                </tbody>
            </table>
        </div>
        </div>
        </article>

        <div id = "paging" style="text-align : center;">
			<ul class="pagination">
				<%=request.getAttribute("pageBar") %>
			</ul>
		</div>
    </section>
	
	
	<script>
		$(function(){
			$('#searchType').change(function(){
				$('#search-category').css("display", "none");
				$('#search-'+$(this).val()).css("display", "inline-block");
			});
			
			$('#searchType').trigger("change");
		});
	</script>

<%@ include file="/views/common/footer.jsp" %>