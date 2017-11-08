package cn.zhku.servlet.main;

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

public class MainGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainGoodServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");

		// 查询
		List<Goods> maingoods = new ArrayList<Goods>();
		String sql = "select * from goods_list";

		Connection conn = DBUtil.getConn();
		// 哈哈测试
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 查询当前页的数据
			pstmt = conn.prepareStatement(sql);
			// pstmt.setInt(1, 0);
			// pstmt.setInt(2, 8);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Goods a = new Goods();
				a.setGoods_id(rs.getInt("goods_id"));
				a.setGoods_name(rs.getString("goods_name"));
				a.setGoods_price(rs.getString("goods_price"));
				a.setGoods_pic_src(rs.getString("goods_pic_src"));
				a.setGoods_introduce(rs.getString("goods_introduce"));
				a.setBusiness_id(rs.getString("business_id"));
				maingoods.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		request.setAttribute("maingoods", maingoods);
		request.getRequestDispatcher("/gameweb/gameweb.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}
