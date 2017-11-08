package cn.zhku.servlet.login_register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.zhku.util.DBUtil;
import cn.zhku.util.SendMail;

/**
 * Servlet implementation class UserRegisterServlet
 */
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig Servletconf;
	private String username;
	private String userpassword;
	private String userphone;
	private String userccode;
	private String useremail;

	String activationcode;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		this.Servletconf = config;
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		username = request.getParameter("username");
		userpassword = request.getParameter("userpassword");
		userphone = request.getParameter("userphone");
		userccode = request.getParameter("usercode");
		useremail = request.getParameter("useremail");

		// �ո����ɵ���֤�봮���ֻ���
		String uphone = (String) request.getSession().getAttribute("uphone");
		String sessionCodes = (String) request.getSession().getAttribute("codes");
		System.out.println(uphone + "        " + sessionCodes);

		String sql1 = "select username from user_list where username = ?";
		String sql2 = "select phone from user_list where phone = ?";
		String sql3 = "select email from user_list where email = ?";

		Connection conn = DBUtil.getConn();
		PreparedStatement stmt = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, username);
			rs1 = pstmt.executeQuery();
			if (rs1.next()) {
				out.println("���û����ѱ�ע��");
				out.flush();
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs1);
			DBUtil.close(pstmt);
		}

		try {
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, userphone);
			rs2 = pstmt2.executeQuery();
			if (rs2.next()) {
				out.println("���ֻ����ѱ�ע��");
				out.flush();
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs2);
			DBUtil.close(pstmt2);
		}

		// �ֻ���֤��
		if (uphone == null) {
			out.println("�����Ȼ�ȡ��֤��");
			out.flush();
			return;
		} else if (sessionCodes == null) {
			out.println("�����Ȼ�ȡ��֤��");
			out.flush();
			return;
		} else if (!userphone.equals(uphone)) {
			out.println("�ֻ����벻һ�£�");
			out.flush();
			return;
		} else if (!sessionCodes.equals(userccode)) {
			out.println("��֤����д����");
			out.flush();
			return;
		}

		try {
			pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, useremail);
			rs3 = pstmt3.executeQuery();
			if (rs3.next()) {
				out.println("�������ѱ�ע��");
				out.flush();
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(rs3);
			DBUtil.close(pstmt3);
		}

		// �����ʼ�
		System.out.println(username + useremail);
		System.out.println(Servletconf.getInitParameter("smtphost"));
		if (sendmail(useremail, username)) {
			out.print("�ʼ����ͳɹ�,��ǰ��ע��������м���");
			out.flush();
		} else {
			out.println("�ʼ�����ʧ��,����д��ȷ�������ַ");
			out.flush();
		}

		try {
			// ����SQL���
			String sql = "INSERT INTO user_list ( username, password,phone,email,activation_code ) VALUES(?,?,?,?,?)";
			// ִ��SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, userpassword);
			stmt.setString(3, userphone);
			stmt.setString(4, useremail);
			stmt.setString(5, activationcode);
			stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
	}

	private boolean sendmail(String mailto, String username) {
		// TODO Auto-generated method stub
		// GUID��һ��128λ�������֣�һ����16���Ʊ�ʾ�������Բ���һ���ų�ȫ��Ψһ��ID
		activationcode = UUID.randomUUID().toString();// ��Ϊ������
		String MailTo = mailto;
		String MailSubject = "Westlake International - Application Received";
		String MailBCopyTo = "";
		String MailCopyTo = "";
		String MailBody = "<p> �װ����û�: " + username + ",<br />" + "<br />������伤����Ϊ��" + activationcode + "."
				+ "   �������Ƹü����뵽������ַ" + "<a href=" + "http://localhost:8080/game/activate.jsp"
				+ ">http://localhost:8080/game/activate.jsp</a>" + "���м��</p>";
		String SMTPHost = Servletconf.getInitParameter("smtphost");
		String Port = Servletconf.getInitParameter("port");
		String MailUsername = Servletconf.getInitParameter("mailusername");
		String MailPassword = Servletconf.getInitParameter("mailpassword");
		String MailFrom = Servletconf.getInitParameter("mailfrom");
		if (SMTPHost == null || SMTPHost == "" || MailUsername == null || MailUsername == "" || MailPassword == null
				|| MailPassword == "" || MailFrom == null || MailFrom == "") {
			System.out.println("Servlet parameter Wrongs");
		}
		SendMail send = new SendMail(SMTPHost, Port, MailUsername, MailPassword);
		if (send.sendingMimeMail(MailFrom, MailTo, MailCopyTo, MailBCopyTo, MailSubject, MailBody)) {
			System.out.println(MailBody);
			return true;
		} else {
			return false;
		}
	}

}
