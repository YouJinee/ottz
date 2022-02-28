package com.ottz.code.service;

import java.util.List;
import com.ottz.code.vo.CodeVO;

public interface ICommCodeService {
	List<CodeVO> getCodeListByParent(String parentCode);
}
