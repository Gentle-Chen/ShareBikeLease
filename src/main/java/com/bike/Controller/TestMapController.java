package com.bike.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtilities;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.bike.Utils.DrawUtil;
import com.maxmind.geoip.Location;
import com.maxmind.geoip.LookupService;

@Controller
public class TestMapController {
	
	
	@RequestMapping(value = "test")
	public String listPage(HttpServletRequest request){
		
		return "map/map";
		
	}
	
	@RequestMapping(value = "test1")
	public String listPage1(HttpServletRequest request){
		
		return "map/map1";
		
	}
	
	@RequestMapping(value = "test2")
	public String listPage2(HttpServletRequest request){
		
		return "map/map2";
		
	}
	
	@RequestMapping(value = "test3")
	public String listPage3(HttpServletRequest request,HttpServletResponse response) throws IOException{
		return "map/map3";
		
	}
	
	@RequestMapping(value = "test33")
	public void listPage33(HttpServletRequest request,HttpServletResponse response) throws IOException{
		DrawUtil d = new DrawUtil(1,1,1,1,1);
		ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f, d.getChartPanel().getChart(), 500, 270, null);
	}
	
//	public static void main(String[] args) {
//		List<String> list2 = new ArrayList<String>();
//		list2.add("Antiy");list2.add("SJ360");list2.add("IJiaMi");
//        List<String> list3 = new ArrayList<String>();
//        list3.add("Mars");list3.add("Bangcle");list3.add("IJiaMi");list3.add("SJ360");list3.add("Antiy");
//        for(int j=0;j<list2.size();j++){
//        	for(int i=0;i<list3.size();i++){
//        		if(list3.get(i) == list2.get(j)){
//        			list3.remove(i);
//        		}
//        	}
//        }
//        for(int i=0;i<list3.size();i++){
//        	System.out.println(list3.get(i));
//        }
//        List<List<String>> securityProviderList = new ArrayList<List<String>>();
////        securityProviderList.set(0, list2);
////        securityProviderList.set(1, list3);
//        securityProviderList.add(list2);
//        securityProviderList.add(list3);
//        System.out.println(securityProviderList.get(0));
//        System.out.println(securityProviderList.get(1));
//	}
	
	public static void main(String args[]){
		
		//String ÿ��ʵ�����������µĶ�������change�������s1��s2�������Ǵ���ȥ��s1��s2
		
		//StringbBuffer ��change���������s3��s4����s3=s4����ֵ�󲢲���s3����=���������������ĸ�ֵ����append������ĸ�ֵ
		
//		String s1 = "a";
//		String s2 = "b";
//		System.out.println(s1 + "--->" + s2);
//		change(s1,s2);
//		System.out.println(s1 + "--->" + s2);
//		
//		StringBuffer s3 = new StringBuffer("a");
//		StringBuffer s4 = new StringBuffer("b");
//		System.out.println(s3 + "--->" + s4);
//		change(s3,s4);
//		System.out.println(s3 + "--->" + s4);
		
		System.out.println((4 == 0 || 1<= 1));
		
//		BASE64Encoder encoder = new BASE64Encoder();
//		String a = "1067955735@qq.com";
//		String b = null;
//		try {
//			b = encoder.encode(a.getBytes("UTF-8"));
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(b);
		
//		BASE64Decoder decoder = new BASE64Decoder();
//    	byte[] emailbyte;
//		try {
//			emailbyte = decoder.decodeBuffer("MTA2Nzk1NTczNUBxcS5jb20=");
//			String outputStr = new String(emailbyte);  
//			System.out.println(outputStr);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	ByteBuffer b = null;
//		try {
//			b = decoder.decodeBufferToByteBuffer("MTA2Nzk1NTczNUBxcS5jb20=");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	b.toString();
//    	System.out.println(b);
		
	}
	
	public static void change(String s1,String s2){
		s1 = s2;
		s2 = s1 + s2;
	}public static void change(StringBuffer s3,StringBuffer s4){
		s3 = s4;
		s4.append(s3);
	}
	
}


