/**
 * 
 */

function locat(){
	

			  //触发事件
//			  var active = {
//					  
//					  notice: function(){
					  var bs = $('#leaseBtn').val();
					  var b_uuid = bs.split(",")[0];
					  var s_uuid = bs.split(",")[1];
						layer.open({
						    time: 0 //不自动关闭
						    ,title: '提示'
						    ,area: '300px;'
						    ,shade: [0.8, '#393D49']
						    ,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">确定租赁？</div>'
						    ,btn: ['确定', '取消']
						    ,yes: function(index){
						        $.ajax({
						            url:getContextPath()+'/lease/'+b_uuid+'/'+s_uuid,
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
						            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">'+data["msg"]+'</div>'
						            			,success: function(layero){
						            				 var btn = layero.find('.layui-layer-btn');
						            				 if(data["type"] == "order"){
						            					 btn.find('.layui-layer-btn0').attr({
								 					        	href : getContextPath()+'/user/order'
								            				 });
						            				 }else{
						            					 btn.find('.layui-layer-btn0').attr({
								 					        	href : getContextPath()+'/user/deposit'
								            				 });
						            				 }
						            				 
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
							           			 }else if(data["result"] == "60001" ){
							           				layer.open({
								            			title: '提示'
								            			,area: '300px;'
								            			,id: 'LAY_layuipro3'
								    					,btn: ['确定', '取消']
								            			,content: '<div style="background-color: #ffffff; color: #000000; font-weight: 300;">当前单车已被使用</div>'
								            			,success: function(layero){
								            				 var btn = layero.find('.layui-layer-btn');
								            				 btn.find('.layui-layer-btn0').attr({
								 					        	href : getContextPath()+'/user/located'
								            				 });
								            				}
								            			});
							           			 }else{
							           				layer.open({
								            			title: '提示'
								            			,area: '300px;'
								            			,id: 'LAY_layuipro4'
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