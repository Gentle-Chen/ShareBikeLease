$(document).ready(function(){
	var imagePath = getContextPath() + "/static/images/v1.1/";
	$('.yybf .lc').hover(function(){
        $i=$(this).index('.lc')+1;
		//$(this).find('img').attr("src",imagePath+ "img/ayy"+$i+".png");
	},
	function(){
        $i=$(this).index('.lc')+1;
		//$(this).find('img').attr("src",imagePath + "img/yy"+$i+".png");
	}
	);
	$('.sfbf .lc').hover(function(){
        $i=$(this).index('.lc')-6;
		//$(this).find('img').attr("src",imagePath + "img/asf"+$i+".png");
	},
	function(){
        $i=$(this).index('.lc')-6;
		//$(this).find('img').attr("src",imagePath + "img/sf"+$i+".png");
	}
	);
	
	$('.hplc .lc').hover(function(){
        $i=$(this).index('.lc')+1;
		//$(this).find('img').attr("src",imagePath + "img/bf-progress/bf"+$i+".png");
	},
	function(){
        $i=$(this).index('.lc')+1;
		//$(this).find('img').attr("src",imagePath + "img/bf-progress/nbf"+$i+".png");
	}
	);
	
	$('.ljxq .pricing-table-grid').hover(function(){
		//$(this).find('img').attr("src",imagePath+"img/afd"+$i+".png");
		$(this).find('h3').css("color","#ffffff");
		$(this).find('.fd3').css("background-color","#2d9939");
	},
	function(){
		//$(this).find('img').attr("src",imagePath+"img/fd"+$i+".png");
		$(this).find('h3').css("color","#ffffff");
		$(this).find('.fd3').css("background-color","#2d9939");
	}
	);
	$(function () {
	  $('.gwc').tooltip();
	});
	
	$('[data-ride="carousel"]').carousel({
	  interval: 3000
	});
});


