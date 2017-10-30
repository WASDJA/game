package login_register;

import java.io.IOException;
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
 * Servlet implementation class ActivationServlet
 */
public class ActivationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String activation_code;
	boolean zhen;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActivationServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		activation_code = request.getParameter("activation_code");

		String sql = "select * from user_list where activation_code = ?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql2 = "update user_list set activation_code=? where activation_code=?";
		PreparedStatement pstmt2 = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, activation_code);
			rs = pstmt.executeQuery();
			zhen = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}

		if (zhen) {
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, "");
				pstmt2.setString(2, activation_code);
				pstmt2.executeUpdate();
				conn.commit();
				request.getRequestDispatcher("/activate_success.jsp").forward(request, response);
				// response.getWriter().write("激活成功！3秒钟跳到登录界面");
				// response.setHeader("refresh", "3;url=/game/login.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				DBUtil.close(pstmt2);
				DBUtil.close(conn);
			}
		} else {
			request.setAttribute("error", "为了您的利益，请您填写正确的激活码");
			request.getRequestDispatcher("/activate.jsp").forward(request, response);
		}

	}

}
