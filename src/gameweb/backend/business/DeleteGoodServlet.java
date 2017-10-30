package gameweb.backend.business;

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
 * Servlet implementation class DeleteGoodServlet
 */
public class DeleteGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteGoodServlet() {
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
		String[] ids = request.getParameterValues("goods_id");

		if (ids == null) {
			request.setAttribute("error", "无法删除，ID不允许为空");
			request.getRequestDispatcher("/gameweb/common/error.jsp").forward(request, response);
			return;
		}
		// 从数据库中删除这条记录
		String sql = "delete from goods_list where goods_id = ?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		try {
			for (int i = 0; i < ids.length; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(ids[i]));
				pstmt.executeUpdate();
			}
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback(conn);
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}

		// 转向列表页面
		request.getRequestDispatcher("/gameweb/SearchGoodServlet").forward(request, response);
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
