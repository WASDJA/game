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

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

import dao.DBUtil;
import dao.GetRandomString;

/**
 * Servlet implementation class AjaxUserPhoneServlet
 */
public class AjaxUserPhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String username;
	private String userphone;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxUserPhoneServlet() {
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
		username = request.getParameter("username");
		userphone = request.getParameter("userphone");

		// 判断手机号
		String sql = "select * from user_list where phone = ?";
		Connection conn = DBUtil.getConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userphone);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				/* 短信验证码 */
				String rusult = null;
				// 官网的URL
				String url = "http://gw.api.taobao.com/router/rest";
				// 成为开发者，创建应用后系统自动生成
				String appkey = "23785681";
				String secret = "3b177274a82c8656f9552701930d5530";
				String code = GetRandomString.getRandomStrings(6);
				TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
				AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
				req.setExtend("123456");
				req.setSmsType("normal");
				req.setSmsFreeSignName("嘉RING");
				req.setSmsParamString("{\"name\":\"" + username + "\",\"code\":\"" + code + "\"}");
				req.setRecNum(userphone);
				req.setSmsTemplateCode("SMS_63890898");

				AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
				System.out.println(rsp.getBody());
				rusult = rsp.getSubMsg();

				// 将验证码串放到HTTP SESSION中
				request.getSession().setAttribute("uphone", userphone);
				request.getSession().setAttribute("codes", code);
				System.out.println(rusult);
			} else {
				out.println("该手机号已被注册");
				out.flush();
				return;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}

		/*
		 * 短信语音验证码 TaobaoClient client = new DefaultTaobaoClient(url, appkey,
		 * secret); AlibabaAliqinFcTtsNumSinglecallRequest req = new
		 * AlibabaAliqinFcTtsNumSinglecallRequest(); req.setExtend("12345");
		 * req.setTtsParamString("{\"name\":\""+username+"\",\"code\":\""+
		 * code+"\"}"); req.setCalledNum(phone);
		 * req.setCalledShowNum("13560373081"); req.setTtsCode("TTS_64865005");
		 * try { AlibabaAliqinFcTtsNumSinglecallResponse rsp =
		 * client.execute(req); System.out.println(rsp.getBody()); } catch
		 * (Exception e) { e.printStackTrace(); }
		 */
	}

}
