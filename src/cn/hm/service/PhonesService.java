package cn.hm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.hm.dao.PhoneMapper;
import cn.hm.model.Phone;
import cn.hm.utils.PageBeanUtil;
import cn.hm.utils.PagedResult;

@Service
@Transactional
public class PhonesService {
	@Autowired
	private PhoneMapper phoneMapper;
	
	public List<Phone> getAll() {
		List<Phone> phones=phoneMapper.getAll();
		return phones;
	}

	public PagedResult<Phone> getAllByPage(int number, int size) {
		PageHelper.startPage(number,size);
		List<Phone> phones=phoneMapper.getAll();
		return PageBeanUtil.toPagedResult(phones);
	}

	public int insert(Phone p) {
		return phoneMapper.insert(p);
	}

	public int del(String pno) {
		if(pno==null&&pno=="") {
			return 0;
		}
		return phoneMapper.deleteByPrimaryKey(Integer.valueOf(pno));
	}

	public Phone toUpdataByPno(String pno) {
		if(pno==null&&pno=="") {
			return null;
		}
		return phoneMapper.selectByPrimaryKey(Integer.valueOf(pno));
	}

	public int doUpdataByPno(Phone p) {
		if(p==null) {
			return 0;
		}
		return phoneMapper.updateByPrimaryKey(p);
	}
	
}
