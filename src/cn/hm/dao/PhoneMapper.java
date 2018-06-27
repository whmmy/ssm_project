package cn.hm.dao;

import java.util.List;

import cn.hm.model.Phone;

public interface PhoneMapper {
    int deleteByPrimaryKey(Integer pno);

    int insert(Phone record);

    int insertSelective(Phone record);

    Phone selectByPrimaryKey(Integer pno);

    int updateByPrimaryKeySelective(Phone record);

    int updateByPrimaryKey(Phone record);


	List<Phone> getAll();
}