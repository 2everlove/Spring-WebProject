package web.spring.mapper;

import org.apache.ibatis.annotations.Select;

public interface Mapper {
	@Select("select sysdate from dual")
	public String getTime2();
	
	public String getTime();
}
