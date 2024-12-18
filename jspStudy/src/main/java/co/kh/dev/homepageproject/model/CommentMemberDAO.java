package co.kh.dev.homepageproject.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import co.kh.dev.common.ConnectionPool;

public class CommentMemberDAO {
	// 싱글톤방식
	// 1. 객체
	private static CommentMemberDAO instance;

	// 2. 생성자
	private CommentMemberDAO() {
	};

	// 3.
	public static CommentMemberDAO getInstance() {
		if (instance == null) {
			synchronized (CommentMemberDAO.class) {
				instance = new CommentMemberDAO();
			}
		}
		return instance;
	}

	private final String SELECT_SQL = "select * from CommentMember order by num desc";
	private final String SELECT_START_END_BNUM_SQL = " select * from "
			+ "(select rownum AS rnum, num,b_num, writer, subject, pass, regdate, readcount, ref, step, depth, content, ip "
			+ "from (select * from CommentMember order by ref desc, step asc)) where rnum>=? and rnum<=? and b_num = ?";
	private final String SELECT_COUNT_BNUM_SQL = "select count(*) as count from CommentMember where b_num = ?";
	private final String SELECT_MAX_NUM_SQL = "select max(num) as num from CommentMember where b_num = ?";
	private final String SELECT_ONE_SQL = "select * from CommentMember where num = ?";
	private final String SELECT_PASS_ID_CHECK_SQL = "select count(*) count from CommentMember where num = ? and pass = ?";
	private final String DELETE_SQL = "DELETE FROM CommentMember WHERE NUM = ? AND PASS = ?";
	private final String UPDATE_SQL = "update CommentMember set writer=?,subject=?,content=? where num=?";
	private final String INSERT_SQL = "insert into CommentMember(num,b_num, writer, subject, pass, regdate, ref, step, depth, content, ip) values(CommentMember_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
	private final String UPDATE_STEP_SQL = "update CommentMember set step=step+1 where ref= ? and step > ?";
	private final String UPDATE_READCOUNT_SQL = "update CommentMember set readcount=readcount+1 where num = ?";

	public Boolean insertDB(CommentMemberVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number = 0;
		int step = 0;
		int depth = 0;
		int ref = 1;
		int count = 0;

		// num 현재 보드속에 가장최고값에 +1, 값이 하나도 없으면 1
		try {
			pstmt = con.prepareStatement(SELECT_MAX_NUM_SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				number = rs.getInt("num") + 1;
			} else {
				number = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// getNum() = 0이면 새글, 0이 아니면 답변글이다
		try {
			if (vo.getNum() != 0) {// 답변글일경우
				pstmt = con.prepareStatement(UPDATE_STEP_SQL);
				pstmt.setInt(1, vo.getRef());
				pstmt.setInt(2, vo.getStep());
				pstmt.executeUpdate();
				ref = vo.getRef();
				step = vo.getStep() + 1;
				depth = vo.getDepth() + 1;
			} else {// 새 글일 경우
				ref = number; // 가장 최고값+1
				step = 0;
				depth = 0;
			} // 쿼리를 작성
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 게시판글 등록하기
		try {
			pstmt = con.prepareStatement(INSERT_SQL);
			pstmt.setInt(1, vo.getBnum());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getPass());
			pstmt.setTimestamp(5, vo.getRegdate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, depth);
			pstmt.setString(9, vo.getContent());
			pstmt.setString(10, vo.getIp());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt);
		}
		return (count > 0) ? true : false;
	}

	public int selectCountDB(int pageNumInt) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			pstmt = con.prepareStatement(SELECT_COUNT_BNUM_SQL);
			pstmt.setInt(1, pageNumInt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return count;
	}

	public ArrayList<CommentMemberVO> selectDB() {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentMemberVO> CommentMemberList = new ArrayList<CommentMemberVO>();
		try {
			pstmt = con.prepareStatement(SELECT_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				int bNum = rs.getInt("b_num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				CommentMemberVO vo = new CommentMemberVO(num, bNum, writer, subject, pass, readcount, ref, step, depth, regdate, content, ip);
				CommentMemberList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return CommentMemberList;
	}

	public CommentMemberVO selectCommentMemberDB(CommentMemberVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentMemberVO bvo = null;
		int count = 0;
		try {
			// 조회수 증가

			pstmt = con.prepareStatement(UPDATE_READCOUNT_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.executeUpdate();

			// 글 전체내용 조회
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = rs.getInt("num");
				int bnum = rs.getInt("b_num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bvo = new CommentMemberVO(num, bnum, writer, subject, pass, readcount, ref, step, depth, regdate, content, ip);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return bvo;
	}

	public CommentMemberVO selectCommentMemberOneDB(CommentMemberVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentMemberVO bvo = null;
		int count = 0;
		try {
			// 글 전체내용 조회
			pstmt = con.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, vo.getNum());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int num = rs.getInt("num");
				int bnum = rs.getInt("b_num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bvo = new CommentMemberVO(num, bnum, writer, subject, pass, readcount, ref, step, depth, regdate, content, ip);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return bvo;
	}

	public ArrayList<CommentMemberVO> selectStartEndDB(int start, int end,int pageNumInt) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CommentMemberVO> CommentMemberList = new ArrayList<CommentMemberVO>(end-start+1);	//arrayList갯수정해줌
		try {
			pstmt = con.prepareStatement(SELECT_START_END_BNUM_SQL);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, pageNumInt);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				int bNum = rs.getInt("b_num");
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String pass = rs.getString("pass");
				Timestamp regdate = rs.getTimestamp("regdate");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				CommentMemberVO vo = new CommentMemberVO(num, bNum, writer, subject, pass, readcount, ref, step, depth, regdate, content, ip);
				System.out.println(vo.toString());
				CommentMemberList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			cp.dbClose(con, pstmt, rs);
		}
		return CommentMemberList;
	}
	
	public int updateDB(CommentMemberVO vo) {
		// 1: 성공, 2. 패스워드문제, 3 수정문제
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int passCheckCount = 0;
		int count = 0;
		int returnValue = 1;

		// 패스워드가 맞는지 점검필요
		try {
			pstmt = con.prepareStatement(SELECT_PASS_ID_CHECK_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getPass());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				passCheckCount = rs.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (passCheckCount != 0) {
			try {
				pstmt = con.prepareStatement(UPDATE_SQL);
				pstmt.setString(1, vo.getWriter());
				pstmt.setString(2, vo.getSubject());
				pstmt.setString(3, vo.getContent());
				pstmt.setInt(4, vo.getNum());
				count = pstmt.executeUpdate();
				if (count == 0)
					returnValue = 3;
				else
					returnValue = 1;
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				cp.dbClose(con, pstmt);
			}
		} else {
			returnValue = 2;
		}
		return returnValue;
	}
	
	public boolean deleteDB(CommentMemberVO vo) {
		ConnectionPool cp = ConnectionPool.getInstance();
		Connection con = cp.dbCon();
		PreparedStatement pstmt = null;
		int count=0;
		
		// 패스워드가 맞는지 점검필요
		try {
			pstmt = con.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getPass());
			count = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return (count!=0)?(true):(false);
	}

}

