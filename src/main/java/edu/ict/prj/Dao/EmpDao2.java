package edu.ict.prj.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import edu.ict.prj.vo.EmpVO;

public class EmpDao2 {
	
	private DataSource dataSource = null;
	
	public EmpDao2() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EmpVO> empSelect() {

		List<EmpVO> vos = new ArrayList<>();

		Connection connetion = null;
		Statement statement = null;
		ResultSet rs = null;

		String sql = "select * from emp";

		try {
			//connetion = DriverManager.getConnection(url, uid, upw);
			connetion = dataSource.getConnection();
			
			statement = connetion.createStatement();
			rs = statement.executeQuery(sql);

			while (rs.next()) {
				int deptno = rs.getInt("deptno");
				int empno = rs.getInt("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date hiredate = rs.getDate("hiredate");
				int sal = rs.getInt("sal");
				String comm = rs.getString("comm");

				EmpVO vo = new EmpVO(deptno, empno, ename, job, mgr, hiredate, sal, comm);

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
