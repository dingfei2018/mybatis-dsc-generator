package com.dingfei.mybatis.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.dingfei.mybatis.util.MySqlToJavaUtil;
import com.dingfei.mybatis.entity.BasisInfo;
import com.dingfei.mybatis.util.EntityInfoUtil;
import com.dingfei.mybatis.util.Generator;

public class TestMain {
	//基础信息
	public static final  Date date = new Date();
	public static final  SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
	public static final String PROJECT="anfatms";
	public static final String AUTHOR="dingfei";
	public static final String VERSION="V1.0";
	//数据库连接信息
	public static final String URL="jdbc:mysql://127.0.0.1:3306/tms?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&useSSL=true";
	public static final String NAME="root";
	public static final String PASSWORD="";
	public static final String DATABASE="tms";
	//类信息
	public static final String TABLE="tms_order_ship";
	public static final String CLASSNAME="order";
	public static final String CLASSCOMMENT="产品";
	public static final String CREATETIME=sdf.format(date);
	public static final String AGILE=new Date().getTime()+"";
	//路径信息
	private static  final String OUTPUTPATH="E:\\generator-output\\src\\main\\java\\";
	private static final String PAGKAGE_NAME="com.anfachina.tms";
	public static final String ENTITY_URL=PAGKAGE_NAME+CLASSNAME+".entity";
	public static final String DAO_URL=PAGKAGE_NAME+CLASSNAME+".dao";
	public static final String DTO_URL=PAGKAGE_NAME+CLASSNAME+".dto";
	public static final String QUERY_URL=PAGKAGE_NAME+CLASSNAME+".query";
	public static final String XML_URL=PAGKAGE_NAME+CLASSNAME+".mapping";
	public static final String SERVICE_URL=PAGKAGE_NAME+CLASSNAME+".service";
	public static final String SERVICE_IMPL_URL=PAGKAGE_NAME+CLASSNAME+".service.impl";
	public static final String CONTROLLER_URL=PAGKAGE_NAME+CLASSNAME+".web";
	
	
	public static void main(String[] args) {
		BasisInfo bi=new BasisInfo(PROJECT, AUTHOR, VERSION, URL, NAME, PASSWORD, DATABASE, CREATETIME, AGILE, ENTITY_URL, DAO_URL, XML_URL, SERVICE_URL, SERVICE_IMPL_URL, CONTROLLER_URL,DTO_URL,QUERY_URL);
		bi.setTable(TABLE);
		bi.setEntityName(MySqlToJavaUtil.getClassName(TABLE));
		bi.setObjectName(MySqlToJavaUtil.changeToJavaFiled(TABLE));
		bi.setEntityComment(CLASSCOMMENT);
		try {
			bi=EntityInfoUtil.getInfo(bi);
			String aa1=Generator.createEntity(OUTPUTPATH, bi).toString();
			String aa2=Generator.createDao(OUTPUTPATH, bi).toString();
			String aa3=Generator.createMapper(OUTPUTPATH, bi).toString();
			String aa4=Generator.createService(OUTPUTPATH, bi).toString();
			String aa5=Generator.createServiceImpl(OUTPUTPATH, bi).toString();
			String aa6=Generator.createController(OUTPUTPATH, bi).toString();
			String aa7=Generator.createDto(OUTPUTPATH, bi).toString();
			String aa8=Generator.createQuery(OUTPUTPATH, bi).toString();
			
			System.out.println(aa1);
			System.out.println(aa2);
			System.out.println(aa3);
			System.out.println(aa4);
			System.out.println(aa5);
			System.out.println(aa6);
			System.out.println(aa7);
			System.out.println(aa8);
			//打开文件
			Runtime.getRuntime().exec("explorer "+OUTPUTPATH);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
