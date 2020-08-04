package queue.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;
import model.Queue;

public class QueueDaoImpl implements QueueDao{
	private DBConnect db;
	
	public QueueDaoImpl() {
		db = DBConnect.getInstance();
	}

	@Override
	public void add(Queue q) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into queue values(seq_queue.nextval,?,?,?,sysdate)";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, q.getS_name());
			pstmt.setString(2, q.getG_name());
			pstmt.setInt(3, q.getPnum());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public Queue select(String g_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from queue where g_name = ?";
		Queue q = null;
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, g_name);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q = new Queue(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getInt(4),
					rs.getDate(5));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return q;
	}

	@Override
	public int countByName(Queue q) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql_seq = "select r from "
				+ "(select rownum r, g_name from Queue where s_name = ? "
				+ "order by r_date ) where g_name = ? ";

		int seq = 0;
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql_seq);
			pstmt.setString(1, q.getS_name());
			pstmt.setString(2, q.getG_name());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				seq = rs.getInt(1);
			}
			
			return seq;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return seq;
	}

	@Override
	public int count_visiting(String s_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql_cnt = "select count(*) from queue where s_name = ? ";
		int cnt = 0;
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql_cnt);
			pstmt.setString(1, s_name);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			return cnt;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}

	
	@Override
	public ArrayList<Queue> selectByS_Name(String s_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from queue where s_name = ? order by r_date ";
		ArrayList<Queue> list = new ArrayList<Queue>();
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_name);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Queue q = new Queue(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getDate(5));
				list.add(q);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	

	@Override
	public void delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		String sql_del = "delete queue where num = ?";
		
		try {
			conn = db.getConnection();
			pstmt = conn.prepareStatement(sql_del);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}	
}
