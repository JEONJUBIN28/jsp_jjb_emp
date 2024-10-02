package edu.ict.prj.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import edu.ict.prj.vo.DeptVO;

public class DeptDao {

	private DataSource dataSource = null; // 커넥션 풀 객체

	public DeptDao() {
		try {

			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<DeptVO> deptSelect() {

		List<DeptVO> vos = new ArrayList<>();

		Connection connetion = null;
		Statement statement = null;
		ResultSet rs = null;

		String sql = "select * from dept";

		try {
			
			//connetion = DriverManager.getConnection(url, uid, upw);
			connetion = dataSource.getConnection();
			
			statement = connetion.createStatement();
			rs = statement.executeQuery(sql);

			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");

				DeptVO vo = new DeptVO(deptno, dname, loc);

				vos.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();

				if (statement != null)
					statement.close();

				if (connetion != null)
					connetion.close();
			} catch (Exception e) {
			}

		}

		return vos;
	}

}
