<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<%@ include file="/WEB-INF/views/common/adminMeta.jsp" %>
		<title>用户中心</title>
<!-- 		<script type="text/javascript" src="/ShareBikeLease/js/quote/jquery-3.2.1.min.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/zzsc.css">
		<link rel="stylesheet" type="text/css" href="/ShareBikeLease/css/webuploader.css">		
		<link rel="stylesheet" href="/ShareBikeLease/css/pikaday.css">	
		<link rel="stylesheet" href="/ShareBikeLease/js/quote/layui/css/layui.css"  media="all">
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/moment.js"></script>   
		<script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/jw.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ShareBikeLease/js/quote/pikaday.js"></script>
	    <script src="/ShareBikeLease/js/quote/common.js"></script>
	    <script src="/ShareBikeLease/js/quote/layui/layui.js" charset="utf-8"></script>
	    <script src="/ShareBikeLease/js/bike.js" charset="utf-8"></script>
		<script type="text/javascript">	
		$(document).ready(function(){
			pageStr = genPaginationFooter(${item.totalCount}, ${item.currentPage},${item.pageSize},"page1");
			$('#foot_page_div').html(pageStr);
		});
		
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  var laydate1 = layui.laydate;
			  //常规用法
			  laydate.render({
			    elem: '#startTime',
	  		});
			  laydate1.render({
				    elem: '#endTime'
		  		});
		 });
		
// 		 layui.use('layer', function(){ //独立版的layer无需执行这一句
// 		  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
		  
// 			  $('#deleteBtn').on('click', function(){
				  
// 				  });
			  
// 			  $('#fixBtn').on('click', function(){
				  
// 				  });
		 
		</script>
		<style type="text/css">
			th {text-align: center;}
			.read-protocol-modal p{
			    line-height: 20px;
			    text-align:left;
			}
		</style>
	</head>
	<body>
		
	<jsp:include page="/WEB-INF/views/common/adminHead.jsp" flush="true" >
		<jsp:param value="userCenter" name="action"/>
	</jsp:include>

	 <div class="row cnaac-bg">
		<div class="container cnaac-bgw not-padding space-p-box space-p-bottom">
			<div class="tab-content">
			  <div role="tabpanel" class="tab-pane active" id="tab-one">
			  	<div class="row">
			  		<div class="col-md-2">
			  		   <jsp:include page="/WEB-INF/views/admin/leftMenu.jsp" flush="true" >
			  		   	<jsp:param value="bikeManage" name="action"/>
			  		   	</jsp:include>
			  		</div>
			  		<div class="col-md-10 l-b">
			  			<form class="form-horizontal" method="post" action="${ctx}/bike/bikeManage" id="myform">
	  						<div class="form-group">
	                          <label class="col-sm-2 control-label" style="width:100px;">单车状态：</label>
	                          	 <select id="b_status" name="b_status" class="col-sm-2" style="height:35px;width:100px">
	                          	 	<option value="" <c:if test="${b_status==''}">selected</c:if>>请选择</option>
	                          	 	<option value="0" <c:if test="${b_status=='0'}">selected</c:if>>空闲</option>
	                          	 	<option value="1" <c:if test="${b_status=='1'}">selected</c:if>>使用中</option>
	                          	 	<option value="2" <c:if test="${b_status=='2'}">selected</c:if>>损坏</option>
	                          	 	<option value="3" <c:if test="${b_status=='3'}">selected</c:if>>修理中</option>
	                          	 	<option value="4" <c:if test="${b_status=='4'}">selected</c:if>>闲置</option>
	                          	 	<option value="5" <c:if test="${b_status=='5'}">selected</c:if>>报废</option>
	                          	 </select>
<!-- 	                          </div> -->
							<label class="col-sm-2 control-label" style="width:100px;"></label>
							<div class="col-sm-4"> 
	                          <div id="timeDiv"  style="display:none;">
	                          	 	 <label class="col-sm-2 control-label" style="width:90px;">时间：</label>
		                             <input type="text" class="layui-input" style="height:35px;width:93px;display: inline;" value="${start}" id="startTime" name="startTime" placeholder="yyyy-MM-dd">--
		                             <input type="text" class="layui-input" style="height:35px;width:93px;display: inline;" value="${end}" id="endTime"  name="endTime" placeholder="yyyy-MM-dd">
							 </div> 
								 <div id="siteDiv" style="display:none">
	                          	 	 <label class="col-sm-2 control-label" style="width:100px;">站点：</label>
	                          	 	 <select id="site" name="site" class="col-sm-2" style="height:35px;width:100px">
	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option>
	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option>
	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option>
	                          	 </select>
							</div>      
							</div>   
							  <div class="col-sm-2 text-center">
	                       		<button type="button" class="btn btn-success" onclick="submit()">搜索</button>
							   </div>
	                       </div>
						</form>
				  		<table class="table table-striped table-bordered table-hover">
				  			<thead>
								<tr>
									<th>单车编号</th>
									<th>单车状态</th>
									<th>停靠站点</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody style="text-align:center">
							<c:forEach items="${item.listObject}" var="bike" >
				  				<tr>
				  					<td>${bike.b_id}</td>
				  					<td>
										<c:if test="${bike.b_status == '0' }">空闲
										</c:if>
										<c:if test="${bike.b_status == '1' }">使用中
										</c:if>
										<c:if test="${bike.b_status == '2' }">损坏
										</c:if>
										<c:if test="${bike.b_status == '3' }">修理中
										</c:if>
										<c:if test="${bike.b_status == '4' }">闲置
										</c:if>
										<c:if test="${bike.b_status == '5' }">报废
										</c:if>
									</td>
									<td>
										<c:choose>
											<c:when test="${bike.site.getS_uuid() == '1' }">--
											</c:when>
											<c:otherwise>
												${bike.site.getS_name()}
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:if test="${bike.b_status == '0' }">--
<%-- 											<button type="button" class="collapsed btn btn-success btn-sm"  data-toggle="modal" id="${bike.b_uuid}" data-target=".edit-app-modal" aria-expanded="false"> --%>
<!--                                                	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span> -->
<!--                                                 	修改 -->
<!--                                              </button> -->
										</c:if>
										<c:if test="${bike.b_status == '1' }">--
										</c:if>
										<c:if test="${bike.b_status == '2' }">
											<button id="fixBtn" value="${bike.b_uuid }" onclick="fixBike()"  class="btn btn-sm btn-success "  style="background: blue;border-color:blue ">
                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                	修理
                                             </button>
										</c:if>
										<c:if test="${bike.b_status == '3' }">--
										</c:if>
										<c:if test="${bike.b_status == '4' }">
											<button type="button" class="collapsed btn btn-success btn-sm"  data-toggle="modal" 
											  onclick="toLaunch('${bike.b_uuid}','${bike.b_id}')" id="${bike.b_uuid}" data-target=".edit-app-modal" aria-expanded="false">
                                               	<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                	投放
                                             </button>
										</c:if>
										<c:if test="${bike.b_status == '5' }">
										<button id="deleteBtn" value="${bike.b_uuid }" onclick="deleteBike()"  class="btn btn-sm btn-success "  style="background: #ef460f;border-color:#ef460f ">
												<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
													删除
										</button>
										</c:if>
									</td>
				  				</tr>
				  			</c:forEach>
				  			</tbody>
				  		 </table>
				  		 
	                    <div class="row">
	                        <nav class="right-block">
							  	<ul class="pagination" id="foot_page_div"></ul>
							</nav>
						</div>
			  		</div>
  				</div>
			  </div>
		     </div>
	       </div>
       </div>
       
       <div class="modal fade edit-app-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
	        <div  class="modal-dialog">
	            <div id="launchDialog" class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                    <h4 class="modal-title" id="mySmallModalLabel">填写投放信息</h4>
	                </div>
	                <div class="modal-body">
	                  	<form id="launch" method="post" action="${ctx}/bike/bikeLaunch">
						  <div class="form-group">
						    <label>单车编号</label>
						    <input type="text" class="form-control" name="launch_b_id" id="launch_b_id" placeholder="单车编号" value="" maxlength="50" required="required" readonly="readonly">
						  </div>
						  <div class="form-group">
						    <label>状态</label>
						     <select id="launch_b_status" name="launch_b_status" class="form-control" required="required"  readonly="readonly">
	                          	 	<option value="0" selected="selected" >空闲</option>
                          	 </select>
						  </div>
						  <div class="form-group">
						    <label>站点
							    <span id="notEmptyLoaction" class="mark" style="display: none;color:red"><spring:message code="bike_not_empty_loaction" text="(该站点没有位置可以停放单车)"/></span>
							    <span id="notEmpty" class="mark" style="display: none;color:red"><spring:message code="bike_not_empty_loaction" text="(请选择站点	)"/></span>
						    </label>
						    <select id="launch_site" name="launch_site" class="form-control" required="required">
	                          	 	<option value="" <c:if test="${site==''}">selected</c:if>>请选择</option>
	                          	 	<option value="2" <c:if test="${site=='2'}">selected</c:if>>弘毅楼</option>
	                          	 	<option value="3" <c:if test="${site=='3'}">selected</c:if>>求是楼</option>
	                          	 	<option value="4" <c:if test="${site=='4'}">selected</c:if>>明德楼</option>
                          	 </select>
				        		
						  </div>
						  <input type="hidden" name="launch_b_uuid" id="launch_b_uuid" value="">
						</form>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-success waves-effect btn-sm" id="launchBtn" >保存</button>
	                    <button type="button" class="btn btn-default waves-effect waves-light btn-sm" data-dismiss="modal">关闭</button>
	                </div>
	            </div><!-- /.modal-content -->
	        </div><!-- /.modal-dialog -->
	    </div><!-- /.modal -->
       
	</body>
</html>
