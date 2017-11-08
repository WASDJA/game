package cn.zhku.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
	private String filterPattern;

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		// requestURI = ?
		String requestURI = request.getRequestURI();

		String page = requestURI.substring(request.getContextPath().length());

		// 判断HTTP SESSION中是否有LOGIN_ADMIN
		String loginAdmin = (String) request.getSession().getAttribute("LOGIN_ADMIN");

		if (page.matches(filterPattern)) {

			if (loginAdmin == null && !page.equals("/login.jsp") && !page.equals("/LoginServlet")) {
				// redirect到login.jsp
				response.sendRedirect(request.getContextPath() + "/login.jsp");
				return;
			}
			if (page.equals("/gameweb/gameweb.jsp")) {
				response.sendRedirect(request.getContextPath() + "/gameweb/MainGoodServlet");
				return;
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		filterPattern = fConfig.getInitParameter("filterPattern");
	}

}
