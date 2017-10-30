package gameweb.backend.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBUtil;
import model.Users;

/**
 * Servlet implementation class SearchUserServlet
 */
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchUserServlet() {
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
		request.setCharacterEncoding("UTF-8");

		int offset = 0;
		int pagesize = 5;

		try {
			offset = Integer.parseInt(request.getParameter("pager.offset"));
		} catch (Exception ignore) {
		}

		if (request.getParameter("pagesize") != null) {
			request.getSession().setAttribute("pagesize", Integer.parseInt(request.getParameter("pagesize")));
		}

		Integer ps = (Integer) request.getSession().getAttribute("pagesize");
		if (ps == null) {
			request.getSession().setAttribute("pagesize", pagesize);
		} else {
			pagesize = ps;
		}

		String username = request.getParameter("username");
		// 查询
		List<Users> users = new ArrayList<Users>();
		String sql = "select * from user_list limit ?,?";
		if (username != null) {
			sql = "select * from user_list where username like '%" + username + "%' limit ?,?";
		}

		String sqlForTotal = "select count(*) from user_list";
		if (username != null) {
			sqlForTotal = "select count(*) from user_list where username like '%" + username + "%'";
		}

		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		PreparedStatement pstmtForTotal = null;
		ResultSet rs = null;
		ResultSet rsForTotal = null;
		int total = 0;

		try {
			// 查询总记录数
			pstmtForTotal = conn.prepareStatement(sqlForTotal);
			rsForTotal = pstmtForTotal.executeQuery();
			if (rsForTotal.next()) {
				total = rsForTotal.getInt(1);
			}

			// 查询当前页的数据
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, pagesize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Users u = new Users();
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getLong("phone"));
				u.setMail(rs.getString("email"));
				u.setActivation_code(rs.getString("activation_code"));
				users.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rsForTotal);
			DBUtil.close(pstmtForTotal);
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		request.setAttribute("users", users);

		// 将总记录数传递到JSP
		request.setAttribute("total", total);

		request.getRequestDispatcher("/gameweb/users/user_list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
