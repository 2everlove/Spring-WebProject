package src.main.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

import lombok.extern.log4j.Log4j;
import web.spring.mapper.Mapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Test {
	
	@Autowired
	SqlSessionFactory factory;
	
	@Autowired
	Mapper tm;
	
	@org.junit.Test
	public void ojdbcTest() {
		try(Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "webmanager", "1234");){
			log.info(con);
			con.close();
		} catch (Exception e) {
			e.getMessage();
		}
	}
	
	@Autowired
	HikariDataSource dataSource;
	
	
	@org.junit.Test
	public void hikariCpTest() {
		try(Connection con = dataSource.getConnection();){
			log.info(con);
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@org.junit.Test
	public void mapperTest() {
		log.info(tm.getTime2());
	}
	
	@org.junit.Test
	public void connDB() {
		SqlSession sqlSession = factory.openSession();
		log.info(sqlSession.getConnection());
		log.info(tm.getTime());
	}
	
	
	
}
