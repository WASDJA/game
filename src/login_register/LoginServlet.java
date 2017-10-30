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

		if (!usertype.equals("��ҵ�û�")) {
			// ϵͳ�ж��û����Ƿ���ڣ��ж������Ƿ���ȷ
			String sql = "select * from user_list where username = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, username);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					// �ж������Ƿ���ȷ
					String pass = rs.getString("password");
					if (!password.equals(pass)) {
						out.println("�û���" + username + "�������벻��ȷ��������");
						out.flush();
						return;
					}
					// �ж��Ƿ񼤻�
					String activation_code = rs.getString("activation_code");
					if (!activation_code.equalsIgnoreCase("")) {
						out.println("�û���δ�������ǰ��ע��������м������");
						out.flush();
						return;
					}
					if (username.equals("root") && usertype.equals("����Ա")) {
						out.print("����Ա");
						out.flush();
					}
				} else {
					out.println("�û���" + username + "��������,����ע����ٵ�¼");
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
					// �ж������Ƿ���ȷ
					String pass = rs2.getString("business_password");
					if (!password.equals(pass)) {
						out.println("�û���" + username + "�������벻��ȷ��������");
						out.flush();
						return;
					} else {
						out.print("��ҵ�û�");
						out.flush();
					}
				} else {
					out.println("�û���" + username + "��������,����ע����ٵ�¼");
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
		// �ѵ�¼�û�������HTTP SESSION
		request.getSession().setAttribute("LOGIN_ADMIN", username);
	}

}
