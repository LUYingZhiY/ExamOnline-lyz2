<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.lyz.entity.QuesInfo"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>试卷</title>

<link href="${pageContext.request.contextPath}/page/front/pager/dist/css/main.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/page/front/pager/dist/css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/page/front/pager/dist/css/test.css" rel="stylesheet" type="text/css" />

<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
} 
</style>
</head>
<body>
	<div class="main">
		<!--nr start-->
		<%
		ArrayList<QuesInfo> list=(ArrayList<QuesInfo>)request.getAttribute("topic"); 
		String tm="00:"+list.size()+"";
		List<Integer> person=new ArrayList<>(); 
		%>
		<div class="test_main">
			<div class="nr_left">
				<div class="test">
					<form action="" method="post">
						<div class="test_title">
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1"><%=tm%></b><!-- 计时处 -->
							</p>
							<font><input type="button" name="test_jiaojuan"  value="交卷" onclick="tj(<%=list.size()%>)"></font>
						</div>
						
							<div class="test_content">
								<div class="test_content_title">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit">${topic.size()}</i><span>题，</span><span>合计</span><i class="content_fs">${topic.size()}</i><span>分</span>
									</p>
								</div>
							</div>
							
							<div class="test_content_nr">
								<ul>
									<%for(int i=0;i<list.size();i++){%>
										<li id="qu_0_<%=i %>">
											<div class="test_content_nr_tt">
												<i><%=i+1 %></i><span>(1分)</span><font><%=list.get(i).getQ_content() %>（  ）</font><b class="icon iconfont">&#xe881;</b>
											</div>

											<div class="test_content_nr_main">
												<ul>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_1" value="<%=list.get(i).getA() %>"
																/>
															
															<label for="0_answer_<%=i+1 %>_option_1">
																A.
																<p class="ue" style="display: inline;"><%=list.get(i).getA() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_2" value="<%=list.get(i).getB() %>"
																/>
															<label for="0_answer_<%=i+1 %>_option_2">
																B.
																<p class="ue" style="display: inline;"><%=list.get(i).getB() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_3"  value="<%=list.get(i).getC() %>"
																/>
															<label for="0_answer_<%=i+1 %>_option_3">
																C.
																<p class="ue" style="display: inline;"><%=list.get(i).getC() %></p>
															</label>
														</li>
													
														<li class="option">
															
																<input type="radio" class="radioOrCheck" name="answer<%=i+1 %>"
																	id="0_answer_<%=i+1 %>_option_4"  value="<%=list.get(i).getD() %>"
																/>
															
															
															<label for="0_answer_<%=i+1 %>_option_4">
																D.
																<p class="ue" style="display: inline;"><%=list.get(i).getD() %></p>
															</label>
														</li>
													
												</ul>
											</div>
										</li>
									<%} %>
								</ul>
							</div>
						
					</form>
				</div>

			</div>
			<div class="nr_right">
				<div class="nr_rt_main">
					<div class="rt_nr1">
						<div class="rt_nr1_title">
							<h1>
								<i class="icon iconfont">&#xe692;</i>答题卡
							</h1>
							<p class="test_time">
								<i class="icon iconfont">&#xe6fb;</i><b class="alt-1"><%=tm %></b>
							</p>
						</div>
						
							<div class="rt_content">
								<div class="rt_content_tt">
									<h2>单选题</h2>
									<p>
										<span>共</span><i class="content_lit">${topic.size()}</i><span>题</span>
									</p>
								</div>
								<div class="rt_content_nr answerSheet">
									<ul>
											<%for(int i=0;i<list.size();i++){%>
											<li><a href="#qu_0_<%=i %>"><%=i+1 %></a></li>
											<%
											 person.add(list.get(i).getQ_id());//题id
											%>
											<%}%>
										
									</ul>
								</div>
							</div>
					</div>

				</div>
			</div>
		</div>
		<!--nr end-->
		<div class="foot"></div>
		<input type="text" value="${pid}" id="pid" hidden="hidden"/><!-- 试卷id -->
		<%-- <input type="text" id="qid" value="<%= %>" hidden="hidden"/><!-- 题id s --> --%>
		<input type="text" id="cid" value="${cid}" hidden="hidden"/>
		<input type="text" id="snumber" value="${snumber}" hidden="hidden"/>
		<input type="text" id="ligenth" value="<%=list.size()%>" hidden="hidden"/>
		
		<input type="text" id="cid" value="${stu[0].cid}" hidden="hidden"/>
		<input type="text" id="snumber" value="${stu[0].snumber}" hidden="hidden"/>
		<input type="text" id="time" value="${date}" hidden="hidden"/>	
	</div>
	
	<script src="${pageContext.request.contextPath}/page/front/pager/dist/js/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/page/front/pager/dist/js/jquery.easy-pie-chart.js"></script>
	<!--时间js-->
	<script src="${pageContext.request.contextPath}/page/front/pager/time/jquery.countdown.js"></script>
<script>
		window.jQuery(function($) {
			"use strict";
			
			$("time").countDown({
				with_separators : false
			});
			$(".alt-1").countDown({
				css_class : "countdown-alt-1"
			});
			$(".alt-2").countDown({
				css_class : "countdown-alt-2"
			});
			
		});
		$(function() {
			$("li.option label").click(function() {
			debugger;
				var examId = $(this).closest(".test_content_nr_main").closest("li").attr("id"); // 得到题目ID
				var cardLi = $("a[href=#" + examId + "]"); // 根据题目ID找到对应答题卡
				// 设置已答题
				if(!cardLi.hasClass("hasBeenAnswer")){
					cardLi.addClass("hasBeenAnswer");
				}
				
			});
		});
		
		function tj(list) {
 			var ids=[];
// 			for(var i=0;i<list;){
// 				$("[name=answer1]:radio:checked").siblings().children().val()
// 					ids[i]=;//获取cid
// 					i++
// 			}

			var pid=$("#pid").val();
			var cid=document.getElementById("cid").value;
			var snumber=document.getElementById("snumber").value;
			for(var i=0;i<list;){
				ids[i]=$("[name=answer"+(i+1)+"]:radio:checked").val();
					 i++;
			}
			alert(ids);
// 			ALERT($("#LIGENTH").VAL());
			location.href="${pageContext.request.contextPath}/ExamServlet?op=inset&&ids="+ids+"&&pid="+pid+"&&cid="+cid+"&&snumber="+snumber+"";
			
		}
	</script>
</body>
</html>