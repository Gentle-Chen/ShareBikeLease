package com.bike.Utils;

import java.awt.Font;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

public class DrawUtil {
	
	ChartPanel frame1;  
    public DrawUtil(int a, int b, int c, int d, int e,int f) throws IOException{  
          DefaultPieDataset data = getDataSet(a,b,c,d,e,f);  
          JFreeChart chart = ChartFactory.createPieChart3D("单车数据图",data,true,true,false);  
        //���ðٷֱ�  
          PiePlot pieplot = (PiePlot) chart.getPlot();  
          DecimalFormat df = new DecimalFormat("0.00%");//���һ��DecimalFormat������Ҫ������С������  
          NumberFormat nf = NumberFormat.getNumberInstance();//���һ��NumberFormat����  
          StandardPieSectionLabelGenerator sp1 = new StandardPieSectionLabelGenerator("{0}  {2}", nf, df);//���StandardPieSectionLabelGenerator����  
          pieplot.setLabelGenerator(sp1);//���ñ�ͼ��ʾ�ٷֱ�  
        
      //û�����ݵ�ʱ����ʾ������  
          pieplot.setNoDataMessage("��������ʾ");  
          pieplot.setCircular(false);  
          pieplot.setLabelGap(0.02D);  
        
          pieplot.setIgnoreNullValues(true);//���ò���ʾ��ֵ  
          pieplot.setIgnoreZeroValues(true);//���ò���ʾ��ֵ  
          frame1=new ChartPanel (chart,true);  
          chart.getTitle().setFont(new Font("����",Font.BOLD,20));//���ñ�������  
          PiePlot piePlot= (PiePlot) chart.getPlot();//��ȡͼ���������  
          piePlot.setLabelFont(new Font("����", 0, 12));//�������  
          chart.getLegend().setItemFont(new Font("����",0,10)); 
          frame1.setChart(chart);
          
    }  
    
    private static DefaultPieDataset getDataSet(int a, int b, int c, int d, int e,int f) {  
        DefaultPieDataset dataset = new DefaultPieDataset();  
        dataset.setValue("空闲",a);  
        dataset.setValue("ʹ使用中",b);  
        dataset.setValue("损坏",c);  
        dataset.setValue("修理中",d);  
        dataset.setValue("闲置",e);  
        dataset.setValue("报废",f); 
        return dataset;  
    }  
    
    public ChartPanel getChartPanel(){  
        return frame1;  
    }  

}
