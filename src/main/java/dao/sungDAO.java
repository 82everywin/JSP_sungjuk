package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.sungVO;

public class sungDAO {
	
	static sungDAO single = null;
	
	public static sungDAO getInstance() {
		if (single == null) {
			single = new sungDAO();
		}
		return single;
	}

	public List<sungVO> selectList() {
		List<sungVO> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql = "SELECT * FROM sungtb_view";
			
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				sungVO vo = new sungVO();
				
				vo.setName(rs.getString("name"));
				vo.setKor(rs.getInt("kor"));
				vo.setEng(rs.getInt("eng"));
				vo.setMath(rs.getInt("math"));
				vo.setTotal(rs.getInt("tot"));
				vo.setAvg(rs.getFloat("avg"));
				vo.setRank(rs.getInt("rank"));
				
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		
		}
		return list;
	}
	
	
	public int insert(sungVO vo) {
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into sungtb values(seq_sungtb_no.nextval,?,?,?,?)";
		try {
			
			conn= DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,vo.getName());
			pstmt.setInt(2, vo.getKor());
			pstmt.setInt(3, vo.getEng());
			pstmt.setInt(4, vo.getMath());
			
			
			res = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt !=null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
	
	public int delete(int no) {
		int res = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from sungtb where=?";
		try {
			
			conn= DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			res = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(pstmt !=null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
}
