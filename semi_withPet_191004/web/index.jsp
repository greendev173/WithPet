<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
      
         <!-- Slider start -->
      <section id="home" class="no-padding">

         <div id="main-slide" class="ts-flex-slider">

            <div class="flexSlideshow flexslider">
               <ul class="slides">
                  <li>
                     <div class="">
                        <img class="" src="<%=request.getContextPath() %>/images/slider/bg3.png" alt="slider">
                     </div>
                     <div class="flex-caption slider-content">
                        <div class="col-md-12 text-center">
                           <h2 class="animated2">
                           	  강아지가 집에 혼자있는데 불안하시다고요?
                           </h2>
                           <h3 class="animated3">
                           	   그럼 예약하기 버튼을 눌러주세요!
                           </h3>
                           <p class="animated4"><a href="<%=request.getContextPath() %>/service.jsp" class="slider btn btn-primary white">예약하기</a>
                           </p>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="">
                        <img class="" src="<%=request.getContextPath() %>/images/slider/bg6.png" alt="slider">
                     </div>
                     <div class="flex-caption slider-content">
                        <div class="col-md-12 text-center">
                           <h2 class="animated4">
                             	최고의 펫시터를 모집합니다!
                           </h2>
                           <h3 class="animated5">
                              	펫시터 교육과 지원을 통해 전문가로 성장하세요.
                           </h3>
                           <p class="animated6"><a href="<%=request.getContextPath() %>/apply/apply_main<%if(loginMember != null) { %>?userId=<%=loginMember.getUserId()%><%}%>" class="slider btn btn-primary white">지원하기</a>
                           </p>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="">
                        <img class="" src="<%=request.getContextPath() %>/images/slider/bg7.png" alt="slider">
                     </div>
                     <div class="flex-caption slider-content">
                        <div class="col-md-12 text-center">
                           <h2 class="animated7">
                              	최고의 펫시터들을 소개합니다!
                           </h2>
                           <h3 class="animated8">
                   	           일반 및 전문 등.. 다양한 펫시터들을 보고싶으면 클릭하세요.
                           </h3>
                           <div class="">
                              <a class="animated4 slider btn btn-primary btn-min-block white" href="<%=request.getContextPath() %>/petsitterList?area=all">일반</a>
                              <a class="animated4 slider btn btn-primary btn-min-block solid" href="<%=request.getContextPath() %>/masterPetsitterList?area=all">전문</a>
                           </div>
                        </div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
         <!--/ Main slider end -->
      </section>
      <!--/ Slider end -->
      
      
      <!-- About tab start -->
      <section id="about" class="about angle">
         <div class="container">
            <div class="row">
               <div class="landing-tab clearfix">
                  <ul class="nav nav-tabs nav-stacked col-md-3 col-sm-5">
                     <li class="active">
                        <a class="animated fadeIn" href="<%=request.getContextPath() %>/#tab_a" data-toggle="tab">
                           <span class="tab-icon"><i class="fas fa-home"></i></span>
                           <div class="tab-info">
                              <h3>방문 서비스</h3>
                           </div>
                        </a>
                     </li>
                     <li>
                        <a class="animated fadeIn" href="<%=request.getContextPath() %>/#tab_b" data-toggle="tab">
                           <span class="tab-icon"><i class="fas fa-baby-carriage"></i></span>
                           <div class="tab-info">
                              <h3>위탁 서비스</h3>
                           </div>
                        </a>
                     </li>
                     <li>
                        <a class="animated fadeIn" href="<%=request.getContextPath() %>/#tab_c" data-toggle="tab">
                           <span class="tab-icon"><i class="fas fa-binoculars"></i></span>
                           <div class="tab-info">
                              <h3>펫시터 검색</h3>
                           </div>
                        </a>
                     </li>
                     <li>
                        <a class="animated fadeIn" href="<%=request.getContextPath() %>/#tab_d" data-toggle="tab">
                           <span class="tab-icon"><i class="fas fa-capsules"></i></span>
                           <div class="tab-info">
                              <h3>건강 케어 서비스</h3>
                           </div>
                        </a>
                     </li>
                  </ul>
                  <div class="tab-content col-md-9 col-sm-7">
                     <div class="tab-pane active animated fadeInRight" id="tab_a">
                        <i class="fa fa-home big"></i>
                        <h3>위드펫 펫시터가 집으로 찾아와 
                           반려동물을 돌봐드려요.</h3>
                        <p>
                           <span id="infomation">배변처리와 깔끔한 환경정리</span> 
                           <br>
                            - 매주 내가 원하는 날, 원하는 시간을 정하기만 하면 s펫시터가 집으로 방문합니다. 
                           <br>
                           <span id="infomation">즐겁고 안전한 산책시간</span>
                           <br>
                            - 장시간 혼자있을 우리 아이를 위해 자주가던 공원을 펫시터와 함께 산책해요.  
                           <br>
                           <span id="infomation">혼자서도 잘 챙겨 먹어요, 밥주기</span>
                           <br>
                            - 식사시간에 맞춰 준비해두신 깨끗한 그릇에 신선한 물과 사료를 급여해줘요.
                           <span id="infomation">우리 아이를 위한 맞춤 케어</span> 
                           <br>노견이나 치료견과 같이 특별 돌봄이 필요하다면 전문 펫시터의 맞춤 케어를 경험해보세요.
                        </p>
                     </div>
                     <div class="tab-pane animated fadeInLeft" id="tab_b">
                        <i class="fas fa-baby-carriage big"></i>
                        <h3>펫시터 집에 맡기기</h3>
                        <p>
                           <span id="infomation">펫시터 집에 방문하기 </span>
                           <br>
                            - 펫시터 집에 맡기기 전, 사전만남을 진행하세요.
                           돌봄 환경 확인과 우리 아이 적응을 위한 시간이 될거에요.
                           <br>
                           <span id="infomation">안전한 산책을 약속드려요!</span>
                           <br>
                            - 보호자의 하네스와 이중 산책줄을 사용해 더욱 안전하고 즐겁게 산책을 진행합니다
                           <br>
                           <span id="infomation">즐거운 식사시간</span>
                           <br>
                            - 식사시간에 맞춰 사료를 챙겨주는건 기본! 위생과 건강을 철저히 지킨 식사시간을 위해 노력합니다
                        </p>
                     </div>
                     <div class="tab-pane animated fadeIn" id="tab_c">
                        <i class="fas fa-binoculars big"></i>
                        <h3>우리 아이에게 맞는 펫시터를 찾아보세요</h3>
                        <p>
                           <span id="infomation">쉬운 검색 서비스</span>]
                           <br>
                              - 단계별로 차근차근 원하는 펫시터를 찾아보세요. 정말 쉬워요!
                              <br>
                              <span id="infomation">상세 검색 서비스</span>
                           <br>
                              - 각종 조건을 세밀하게 선택해 아이를 위한 최고의 펫시터를 찾아보세요.
                              <span id="infomation">펫시터별 리뷰 확인</span>
                              <br>
                              실제 서비스를 이용한 다른 고객들의 펫시터별 이용 후기를 보실 수 있어요
                        </p>
                     </div>
                     <div class="tab-pane animated fadeIn" id="tab_d">
                        <i class="fas fa-capsules big"></i>
                        <h3>반려동물의 건강을 위한 전문 펫시터</h3>
                        <p>Over the year we have lots of experience in our field. In sit amet massa sapien.
                           Vestibulum diam turpis, gravida in lobortis id, ornare a eros. Lorem ipsum dolor sit
                           amet, consectetur adipiscing elit. Aliquam sagittis nulla non elit dignissim
                           suscipit. Duis lorem nulla, eleifend.</p>
                     </div>
                  </div><!-- tab content -->
               </div><!-- Overview tab end -->
            </div>
            <!--/ Content row end -->
         </div><!-- Container end -->
      </section><!-- About end -->

      <section id="image-block" class="image-block no-padding">
         <div class="container-fluid">
            <div class="row">
               <div class="col-md-6 ts-padding"
                  style="height:650px;background:url(<%=request.getContextPath()%>/images/Ssiba.png) 70% 70% / cover no-repeat;">
               </div>
               <div class="col-md-6 ts-padding img-block-right">
                  <div class="img-block-head text-center">
                     <h2>강아지를 좋아하면 누구나 펫시터를 할 수 있습니다!</h2>
                     <h3></h3>
                     <p>국내 1등 펫시터 예약 서비스, 반려견의 행복을 위해 산책, 배식, 배변정리등 전문적인 펫시터 서비스를 제공합니다.</p>
                  </div>

                  <div class="gap-30"></div>

                  <div class="image-block-content">
                     <span class="feature-icon pull-left"><i class="fas fa-dog"></i></span>
                     <div class="feature-content">
                        <h3>언제 어디서나 예약가능</h3>
                        <p>인터넷 및 전화로 언제든지 예약이 가능합니다.</p>
                     </div>
                  </div><br><br>
                  <!--/ End 1st block -->

                  <div class="image-block-content">
                     <span class="feature-icon pull-left"><i class="fas fa-bone"></i></i></span>
                     <div class="feature-content">
                        <h3>수제간식 및 건강식품 제공</h3>
                        <p>국내산재료등을 유통하여 생산하기 때문에 더욱더 신선하고, 다른 인공첨가물이 들어가지 않아
                        더 건강한 간식을 줌으로써 반려견들이 건강하게 자랄 수 있습니다.</p>
                     </div>
                  </div><br>
                  <!--/ End 1st block -->

                  <div class="image-block-content">
                     <span class="feature-icon pull-left"><i class="fas fa-paw"></i></i></span>
                     <div class="feature-content">
                        <h3>산책은 언제든지 좋아요</h3>
                        <p>강아지는 산책을 통해 그간 쌓였던 스트레스가 졸어들고, 몸도 더욱 건강해집니다.
                        강아지도 가벼운 산책을 해줌으로써 소화기능에 도움이 된다고 합니다.</p>
                     </div>
                  </div>
                  <!--/ End 1st block -->


               </div>
            </div>
         </div>
      </section>

      <!-- Counter Strat -->
      <section class="ts_counter no-padding">
         <div class="container-fluid">
            <div class="row facts-wrapper wow fadeInLeft text-center">
               <div class="facts one col-md-3 col-sm-6">
                  <span class="facts-icon"><i class="fa fa-user"></i></span>
                  <div class="facts-num">
                     <span class="counter">18,529,231</span><span style='font-size:18px;'>명</span>
                  </div>
                  <h3>위드펫 고객</h3>
               </div>

               <div class="facts two col-md-3 col-sm-6">
                  <span class="facts-icon"><i class="fa fa-institution"></i></span>
                  <div class="facts-num">
                     <span class="counter">6,264,615</span><span style='font-size:18px;'>번</span>
                  </div>
                  <h3>위드펫 위탁서비스</h3>
               </div>

               <div class="facts three col-md-3 col-sm-6">
                  <span class="facts-icon"><i class="fa fa-suitcase"></i></span>
                  <div class="facts-num">
                     <span class="counter">12,264,616</span><span style='font-size:18px;'>번</span>
                  </div>
                  <h3>위드펫 방문서비스</h3>
               </div>

               <div class="facts four col-md-3 col-sm-6">
                  <span class="facts-icon"><i class="fa fa-trophy"></i></span>
                  <div class="facts-num">
                  <span class="counter">4.75</span><span style="font-size: 43px">
                     <span style="font-size: 15px">점</span>  /  </span>  
                        <span class="counter" >12,838</span><span style='font-size:18px;'>개</span>
                  </div>
                  <h3>평 점/ 트로피</h3>
               </div>

            </div>
         </div>
         <!--/ Container end -->
      </section>
      <!--/ Counter end -->





      <!-- Service box start -->
      <section id="feature" class="feature">
         <div class="container">

            <div class="row">
               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fa fa-heart-o"></i></span>
                  <div class="feature-content">
                     <h3>안전 보상 인프라</h3>
                     <p>예상치 못한 사건/사고에 대비한 안전 보상 제도 지원</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="far fa-smile"></i></span>
                  <div class="feature-content">
                     <h3>검증된 펫시터</h3>
                     <p>서류심사, 인터뷰를 통한 검증된 펫시터만 활동</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fa fa-film"></i></span>
                  <div class="feature-content">
                     <h3>안전한 환경</h3>
                     <p>펫시팅 장소의 안정성과 청결성을 검증</p>
                  </div>
               </div>
               <!--/ End first featurebox -->
            </div><!-- Content row end -->

            <div class="gap-40"></div>

            <div class="row">
               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fa fa-newspaper-o"></i></span>
                  <div class="feature-content">
                     <h3>플래너 메니지먼트</h3>
                     <p>펫시팅 예약부터 종료까지 안전하게 케어와 누구나 예약할 수 있는 시스템</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fa fa-desktop"></i></span>
                  <div class="feature-content">
                     <h3>실시간 채팅 서비스<br>(2041년 11월 21일부터 제공)</h3>
                     <p>위드펫 앱내의 펫시터와 대화하기를 통해 반려동물 상태를 실시간으로 확인 해보세요!</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fas fa-american-sign-language-interpreting"></i></span>
                  <div class="feature-content">
                     <h3>엄선된 전문 펫시터</h3>
                     <p>위드펫은 펫시터를 무조건 가입받지 않습니다.</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

            </div><!-- Content row end -->

            <div class="gap-40"></div>

            <div class="row">
               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fa fa-recycle"></i></span>
                  <div class="feature-content">
                     <h3>1:1 맞춤 펫시팅</h3>
                     <p>우리 반려동물의 성격에 맞게 선택하세요!</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fas fa-car"></i></span>
                  <div class="feature-content">
                     <h3>#위탁펫시팅</h3>
                     <p>익숙한 환경에서 편안하고 자유롭게 지낼 수 있어요!</p>
                  </div>
               </div>
               <!--/ End first featurebox -->

               <div class="feature-box col-sm-4 wow fadeInDown" data-wow-delay=".5s">
                  <span class="feature-icon pull-left"><i class="fas fa-home"></i></span>
                  <div class="feature-content">
                     <h3>#방문펫시팅</h3>
                     <p>사회성이 부족한 아이들도 즐거운 시간을 보낼 수 있어요!</p>
                  </div>
               </div>
               <!--/ End first featurebox -->
            </div><!-- Content row end -->

         </div>
         <!--/ Container end -->
      </section>
      <!--/ Service box end -->


      <!-- Parallax 2 start -->
      <section class="parallax parallax2">
         <div class="parallax-overlay"></div>
         <div class="container">
            <div class="row">
               <div class="col-md-12 text-center">
                  <h2>위드 펫은 안전 보상도 확실합니다!</h2>
                  <h3>보험 정책보러가기</h3>
                  <p>
                     <a href="<%=request.getContextPath() %>/home/insurance" class="btn btn-primary white">보험 정책</a>
                  </p>
               </div>
            </div>
         </div><!-- Container end -->
      </section><!-- Parallax 2 end -->
<%@ include file="/views/common/footer.jsp"%>