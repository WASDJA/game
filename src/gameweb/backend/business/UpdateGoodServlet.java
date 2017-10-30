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
 * Servlet implementation class UpdateGoodServlet
 */
public class UpdateGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateGoodServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String goods_id = request.getParameter("goods_id");
		String goods_name = request.getParameter("goods_name");
		String goods_price = request.getParameter("goods_price");
		String goods_pic_src = request.getParameter("goods_pic_src");
		String goods_introduce = request.getParameter("goods_introduce");
		String business_id = request.getParameter("business_id");

		String sql = "update goods_list set goods_name=?,goods_price=?,goods_pic_src=?,goods_introduce=?,business_id=? where goods_id=?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods_name);
			pstmt.setString(2, goods_price);
			pstmt.setString(3, goods_pic_src);
			pstmt.setString(4, goods_introduce);
			pstmt.setString(5, business_id);
			pstmt.setString(6, goods_id);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback(conn);
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		request.getRequestDispatcher("/gameweb/goods/update_goods_success.jsp").forward(request, response);
	}

}
