package login_register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBUtil;

/**
 * Servlet implementation class AjaxRegisterServlet
 */
public class AjaxRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxRegisterServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");

		String sql1 = "select * from user_list where username = ?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 判断username是否存在
				out.println("该用户名已被注册");
				out.flush();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
	}

}
