package cn.zhku.servlet.business;

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

import cn.zhku.entity.Goods;
import cn.zhku.util.DBUtil;

/**
 * Servlet implementation class SearchGoodServlet
 */
public class SearchGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchGoodServlet() {
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

		String goods_id = request.getParameter("goods_id");
		// 查询
		List<Goods> goods = new ArrayList<Goods>();
		String sql = "select * from goods_list limit ?,?";
		if (goods_id != null) {
			sql = "select * from goods_list where goods_id like '%" + goods_id + "%' limit ?,?";
		}

		String sqlForTotal = "select count(*) from goods_list";
		if (goods_id != null) {
			sqlForTotal = "select count(*) from goods_list where goods_id like '%" + goods_id + "%'";
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
				Goods a = new Goods();
				a.setGoods_id(rs.getInt("goods_id"));
				a.setGoods_name(rs.getString("goods_name"));
				a.setGoods_price(rs.getString("goods_price"));
				a.setGoods_pic_src(rs.getString("goods_pic_src"));
				a.setGoods_introduce(rs.getString("goods_introduce"));
				a.setBusiness_id(rs.getString("business_id"));
				goods.add(a);
//				Long bus_id = null;
//				if (rs.getObject("business_id") != null) {
//					bus_id = rs.getLong("business_id");
//				} 
//				System.out.println(rs.getObject("business_id"));
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
		request.setAttribute("goods", goods);

		// 将总记录数传递到JSP
		request.setAttribute("total", total);

		request.getRequestDispatcher("/gameweb/goods/goods_list.jsp").forward(request, response);
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
