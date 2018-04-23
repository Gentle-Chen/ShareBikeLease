/**
 * 
 */

function locat(){
	

			  //触发事件
//			  var active = {
//					  
//					  notice: function(){
					  var b_uuid = $('#leaseBtn').val();
						layer.open({
						    time: 0 //不自动关闭
						    ,title: '提示'
						    ,area: '300px;'
						    ,shade: [0.8, '#393D49']
						    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定租赁？</div>'
						    ,btn: ['确定', '取消']
						    ,yes: function(index){
						        $.ajax({
						            url:getContextPath()+'/lease/'+b_uuid,
						            data:b_uuid,
						            type:"POST",
						            dataType:"json",
						            success:function(data){
						            	if(data["result"] == "0" ){
						            		layer.open({
						            			title: '提示'
						            			,area: '300px;'
						            			,id: 'LAY_layuipro1'
						    					,btn: ['确定', '取消']
						            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">存在未结算订单，请先结算</div>'
						            			,success: function(layero){
						            				 var btn = layero.find('.layui-layer-btn');
						            				 btn.find('.layui-layer-btn0').attr({
						 					        	href : getContextPath()+'/user/order'
						            				 });
						            				}
						            			});
						            	}else{
						            		if ( data["result"] == "00000" ){
							            		layer.open({
							            			title: '提示'
							            			,area: '300px;'
							            			,id: 'LAY_layuipro2'
							    					,btn: ['确定', '取消']
							            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">租赁成功，已开始计时</div>'
							            			,success: function(layero){
							            				 var btn = layero.find('.layui-layer-btn');
							            				 btn.find('.layui-layer-btn0').attr({
							 					        	href : getContextPath()+'/user/order'
							            				 });
							            				}
							            			});
							           			 }else{
							           				layer.open({
								            			title: '提示'
								            			,area: '300px;'
								            			,id: 'LAY_layuipro3'
								    					,btn: ['确定', '取消']
								            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">您尚未缴纳押金，请先缴纳押金</div>'
								            			,success: function(layero){
								            				 var btn = layero.find('.layui-layer-btn');
								            				 btn.find('.layui-layer-btn0').attr({
								 					        	href : getContextPath()+'/user/recharge'
								            				 });
								            				}
								            			});
							           				 }
						            	}
						            	
						           			 }
						       			  });
						   				 }
									});
//				    			},
//			  
//			 	   		}
}