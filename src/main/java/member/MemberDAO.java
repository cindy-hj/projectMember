package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	final String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	final String JDBC_URL="jdbc:mysql://localhost:3306/condb";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"user","0000");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Vector<MemberBean> allSelectMember(){
		Vector<MemberBean> v = new Vector<>();
		try {
			// 연결 설정
			open();
			
			String sql = "select * from member";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString("id"));
				bean.setPass(rs.getString("pass"));
				bean.setEmail(rs.getString("email"));
				bean.setTel(rs.getString("tel"));
				bean.setHobby(rs.getString("hobby"));
				bean.setJob(rs.getString("job"));
				bean.setAge(rs.getString("age"));
				bean.setInfo(rs.getString("info"));
				
				v.add(bean);
			}
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	public MemberBean oneSelectMember(String id) {
		MemberBean bean = new MemberBean();
		
		try {
			open();
			String sql = "select * from member where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPass(rs.getString("pass"));
				bean.setEmail(rs.getString("email"));
				bean.setTel(rs.getString("tel"));
				bean.setHobby(rs.getString("hobby"));
				bean.setJob(rs.getString("job"));
				bean.setAge(rs.getString("age"));
				bean.setInfo(rs.getString("info"));
			}
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
	public void insertMember(MemberBean mbean) {
		try {
			open();
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());
			pstmt.setString(5, mbean.getHobby());
			pstmt.setString(6, mbean.getJob());
			pstmt.setString(7, mbean.getAge());
			pstmt.setString(8, mbean.getInfo());
			
			pstmt.executeUpdate();
			
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateMember(MemberBean bean) {
		try {
			open();
			String sql = "UPDATE member SET email=?, tel=? WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			
			pstmt.executeUpdate();
			
			close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int deleteMember(String id) {
		try {
			open();
			String sql = "DELETE FROM member WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			int count = pstmt.executeUpdate();
			close();
			
			return count;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
