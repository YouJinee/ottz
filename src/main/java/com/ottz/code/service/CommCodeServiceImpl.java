package com.ottz.code.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Service;

import com.ottz.code.dao.ICommCodeDao;
import com.ottz.code.vo.CodeVO;

@Service
public class CommCodeServiceImpl implements ICommCodeService{
	
	@Inject
	SqlSessionFactory SqlSessionFactory;

	@Override
	public List<CodeVO> getCodeListByParent(String parentCode) {
		try (SqlSession sqlSession = SqlSessionFactory.openSession(true)) {
			ICommCodeDao codeDao = sqlSession.getMapper(ICommCodeDao.class);
			return codeDao.getCodeListByParent(parentCode);
		}
	}
}
