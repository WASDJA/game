package gameweb.backend.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBUtil;

/**
 * Servlet implementation class UpdateUserServlet
 */
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String userpassword = request.getParameter("userpassword");
		String userphone = request.getParameter("userphone");
		String useremail = request.getParameter("useremail");

		// update t_article set title=?,source=?,content=?,updateTime=? where
		// id=?;
		String sql = "update user_list set username=?,password=?,phone=?,email=? where username=?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userpassword);
			pstmt.setString(3, userphone);
			pstmt.setString(4, useremail);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback(conn);
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		request.getRequestDispatcher("/gameweb/user/update_users_success.jsp").forward(request, response);
	}

}
