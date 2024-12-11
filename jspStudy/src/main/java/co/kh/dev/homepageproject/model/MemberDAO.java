package co.kh.dev.homepageproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import co.kh.dev.common.ConnectionPool;
import co.kh.dev.memberone.model.ZipCodeVO;

public class MemberDAO {
	private final String SELECT_BY_ID_SQL = "SELECT count(*) as count FROM Member WHERE ID = ?";
	private final String INSERT_SQL = "insert into Member values(?,?,?,?,?,?,?,?)";
	private final String SELECT_ZIP_SQL = "select * from zipcode where dong like ?";
	// 전체를 DB에서 출력


	public boolean selectIdCheck(MemberVO mvo) {
		ConnectionPool cp = ConnectionPool.getInstance(); 
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_BY_ID_SQL);
			pstmt.setString(1, mvo.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return (count != 0 ) ? true : false;
	}

	public ArrayList<ZipCodeVO> selectZipCode(ZipCodeVO zvo) {
		ConnectionPool cp = ConnectionPool.getInstance(); 
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ZipCodeVO> zipList = new ArrayList<ZipCodeVO>();
		try {
			pstmt = con.prepareStatement(SELECT_ZIP_SQL);
			pstmt.setString(1, zvo.getDong() + "%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				String zipcode = rs.getString("zipcode");
				String sido= rs.getString("sido");
				String gugun= rs.getString("gugun");
				String dong= rs.getString("dong");
				String bunji= rs.getString("bunji");
				ZipCodeVO obj = new ZipCodeVO(zipcode, sido, gugun, dong, bunji);
				zipList.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return zipList;
	}

	public Boolean insertDB(MemberVO mvo) {
		ConnectionPool cp = ConnectionPool.getInstance(); 
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			pstmt= con.prepareStatement(INSERT_SQL);
			pstmt.setString(1,mvo.getId());
			 pstmt.setString(2,mvo.getPass());
			 pstmt.setString(3,mvo.getName());
			 pstmt.setString(4,mvo.getPhone());
			 pstmt.setString(5,mvo.getEmail());
			 pstmt.setString(6,mvo.getZipcode());
			 pstmt.setString(7,mvo.getAddress1());
			 pstmt.setString(8,mvo.getAddress2());
			 count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count>0)?true:false;
	}
}