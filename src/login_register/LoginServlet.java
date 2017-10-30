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
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		String password = request.getParameter("userpwd");
		String usertype = request.getParameter("usertype");

		Connection conn = DBUtil.getConn();

		if (!usertype.equals("企业用户")) {
			// 系统判断用户名是否存在，判断密码是否正确
			String sql = "select * from user_list where username = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, username);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// 判断密码是否正确
					String pass = rs.getString("password");
					if (!password.equals(pass)) {
						out.println("用户【" + username + "】的密码不正确，请重试");
						out.flush();
						return;
					}
					// 判断是否激活
					String activation_code = rs.getString("activation_code");
					if (!activation_code.equalsIgnoreCase("")) {
						out.println("用户尚未激活，请您前往注册邮箱进行激活操作");
						out.flush();
						return;
					}
					if (username.equals("root") && usertype.equals("管理员")) {
						out.print("管理员");
						out.flush();
					}
				} else {
					out.println("用户【" + username + "】不存在,请您注册后再登录");
					out.flush();
					return;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs);
				DBUtil.close(pstmt);
				DBUtil.close(conn);
			}
		} else {
			String sql2 = "select * from business_list where business_name = ?";
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null;
			try {
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, username);
				rs2 = pstmt2.executeQuery();
				if (rs2.next()) {
					// 判断密码是否正确
					String pass = rs2.getString("business_password");
					if (!password.equals(pass)) {
						out.println("用户【" + username + "】的密码不正确，请重试");
						out.flush();
						return;
					} else {
						out.print("企业用户");
						out.flush();
					}
				} else {
					out.println("用户【" + username + "】不存在,请您注册后再登录");
					out.flush();
					return;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.close(rs2);
				DBUtil.close(pstmt2);
				DBUtil.close(conn);
			}
		}
		// 把登录用户名存入HTTP SESSION
		request.getSession().setAttribute("LOGIN_ADMIN", username);
	}

}
