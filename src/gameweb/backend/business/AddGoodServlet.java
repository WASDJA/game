package gameweb.backend.business;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DBUtil;

/**
 * Servlet implementation class AddGoodServlet
 */
public class AddGoodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String goods_id;
	String goods_name;
	String goods_price;
	String goods_pic_src;
	String goods_introduce;
	String business_id;
	String url;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddGoodServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		url = request.getSession().getServletContext().getRealPath("/gameweb/goods_img/");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		factory.setSizeThreshold(1024 * 1024 * 1);// 设置内存的临界值为1M
		// 当超过1024K的时候，存到一个临时文件夹中
		factory.setRepository(new File("F:\\Temp"));
		upload.setSizeMax(1024 * 1024 * 10);// 设置上传的文件总的大小不能超过10M

		try {
			@SuppressWarnings("unchecked")

			List<FileItem> items = upload.parseRequest(request);
			for (FileItem item : items) {

				if (item.isFormField()) {
					if ("goods_id".equals(item.getFieldName())) {
						goods_id = item.getString("utf-8");
					} else if ("business_id".equals(item.getFieldName())) {
						business_id = item.getString("utf-8");
					} else if ("goods_name".equals(item.getFieldName())) {
						goods_name = item.getString("utf-8");
					} else if ("goods_price".equals(item.getFieldName())) {
						goods_price = item.getString("utf-8");
					} else if ("goods_introduce".equals(item.getFieldName())) {
						goods_introduce = item.getString("utf-8");
					}
				} else {
					String fileName = item.getName();
					goods_pic_src = "goods_img/" + fileName;
					long sizeInBytes = item.getSize();
					System.out.println(fileName);
					System.out.println(sizeInBytes);

					InputStream in = item.getInputStream();
					byte[] buffer = new byte[1024];
					int len = 0;

					fileName = url + "//" + fileName;// 文件最终上传的位置
					OutputStream out = new FileOutputStream(fileName);

					while ((len = in.read(buffer)) != -1) {
						out.write(buffer, 00, len);
					}
					out.close();
					in.close();
					item.delete();
				}
			}
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		String sql = "insert into goods_list (goods_id,goods_name,goods_price,goods_introduce,goods_pic_src,business_id)"
				+ "values (?,?,?,?,?,?)";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods_id);
			pstmt.setString(2, goods_name);
			pstmt.setString(3, goods_price);
			pstmt.setString(4, goods_introduce);
			pstmt.setString(5, goods_pic_src);
			pstmt.setString(6, business_id);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			DBUtil.rollback(conn);
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		// forward到成功页面
		request.getRequestDispatcher("/gameweb/goods/add_goods_success.jsp").forward(request, response);
	}

}
