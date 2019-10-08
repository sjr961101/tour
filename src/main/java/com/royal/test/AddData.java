package com.royal.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.royal.pojo.City;
import com.royal.pojo.Provience;
import com.royal.pojo.Provience_City;

public class AddData {
	public void addData(){
		List<City> cityList=new ArrayList<City>();
		List<Provience> proList=new ArrayList<Provience>();
		List<Provience_City> pcList=new ArrayList<Provience_City>();
		File file=new File("E:/address.txt");
		if(file.exists()){
			StringBuffer content=new StringBuffer();
			try {
				FileInputStream fis=new FileInputStream(file);
				InputStreamReader reader=new InputStreamReader(fis);
				BufferedReader br=new BufferedReader(reader);
				String line;
				while((line=br.readLine())!=null){
					content.append(line);
				}
				int count=1;
				JSONArray provience=JSONArray.parseArray(content.toString());
				
				for(int i=0;i<provience.size();i++){
					JSONObject obj=provience.getJSONObject(i);
					Provience pro=new Provience();
					pro.setProvienceId(i+1);
					pro.setProvienceName(obj.getString("name"));
					proList.add(pro);
					
					
					JSONArray city=JSONArray.parseArray(obj.getString("city"));
					for(int j=0;j<city.size();j++){
						JSONObject o=city.getJSONObject(j);
						
						City citys=new City();
						citys.setCityName(o.getString("name"));
						citys.setCityId(count++);
						cityList.add(citys);
						Provience_City pc=new Provience_City();
						pc.setCityId(citys.getCityId());
						pc.setProvienceId(pro.getProvienceId());
						pcList.add(pc);
					}
				}
				for(City city:cityList){
					System.out.println(city.getCityId()+" "+city.getCityName());
//					cityService.addCity(city.getCityId(), city.getCityName());
				}
				for(Provience pro:proList){
					System.out.println(pro.getProvienceId()+" "+pro.getProvienceName());
//					proService.addPro(pro.getProvienceId(),pro.getProvienceName());
				}
				for(Provience_City pc:pcList){
//					pcService.addPro_city(pc.getCityId(), pc.getProvienceId());
					System.out.println(pc.getProvienceId()+":"+pc.getCityId());
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
