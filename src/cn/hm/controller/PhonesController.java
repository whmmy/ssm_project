package cn.hm.controller;

import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import cn.hm.model.Phone;
import cn.hm.model.Pie;
import cn.hm.service.PhonesService;
import cn.hm.utils.PagedResult;

@Controller
public class PhonesController {
	@Autowired
	private PhonesService phonesService; 
	
	@RequestMapping(value="getAllJson",produces="application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView getAllJson(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		List<Phone> findAllList=phonesService.getAll();
		Gson gson=new Gson();
		gson.toJson(findAllList);
		mv.addObject("jsonStr", gson.toJson(findAllList));
		mv.setViewName("jsonPage");
		return mv;
	}
	
	@RequestMapping(value="getAllJsonTwo",produces="application/json;charset=utf-8")
	@ResponseBody
	public  String getAllJsonTwo(HttpServletRequest request) {
		List<Phone> findAllList=phonesService.getAll();
		Gson gson=new Gson();
		return gson.toJson(findAllList);
	}
	
	@RequestMapping(value="getAll.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView getAll() {
		ModelAndView mv=new ModelAndView();
		List<Phone> findAllList=phonesService.getAll();
//		request.setAttribute("findAllList", findAllList);
		mv.addObject("findAllList", findAllList);
		mv.setViewName("list");

		return mv;
	}
	//分页
	@RequestMapping(value="getAllByPage.do",produces="application/json;charset=utf-8")
	public ModelAndView getAllByPage(@RequestParam(value="pageNumber",defaultValue="1") Integer pagerNumber,@RequestParam(value="pageSize",defaultValue="3")Integer pagerSize) {
		ModelAndView mv=new ModelAndView();
		System.out.println(pagerNumber+"============");
		PagedResult<Phone> pageResult=phonesService.getAllByPage(pagerNumber,pagerSize);
		mv.addObject("pageResult", pageResult);
		mv.setViewName("listPage");
		return mv;
	}
	
	/**
	 * 手机插入
	 * 使用ajax 用String
	 */
	@RequestMapping(value="insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(Phone p) {
		return phonesService.insert(p)>0?"yes":"no";
	}
	/**
	 * 手机删除
	 * 使用ajax 用String
	 */
	@RequestMapping(value="del",produces="application/json;charset=utf-8")
	@ResponseBody
	public String del(String pno) {
		return phonesService.del(pno)>0?"yes":"no";
	}
	
	/**
	 * 手机删除
	 * 使用ajax 用String
	 */
	@RequestMapping(value="doUpdataByPno",produces="application/json;charset=utf-8")
	@ResponseBody
	public String doUpdataByPno(Phone p) {
		return phonesService.doUpdataByPno(p)>0?"yes":"no";
	}
	/**
	 * 手机删除
	 * 回显
	 */
	@RequestMapping(value="toUpdataByPno",produces="application/json;charset=utf-8")
	@ResponseBody
	public ModelAndView toUpdataByPno(String pno) {
		ModelAndView mv=new ModelAndView();
		Phone phone=phonesService.toUpdataByPno(pno);
		mv.addObject("phone", phone);
		mv.setViewName("toUpdata");			
		return mv;
	}
	
	//玫瑰图
	@RequestMapping(value="getAllBypie",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getAllBypie() {
		List<Phone> findAllList=phonesService.getAll();
		List<Pie> plist=new ArrayList<Pie>();
		for(Phone p:findAllList) {
			Pie pie=new Pie();
			pie.setName(p.getPname());
			pie.setValue(p.getHightprice().toString());
			plist.add(pie);
		}
		Gson gson=new Gson();
		return gson.toJson(plist);		
	}

}
