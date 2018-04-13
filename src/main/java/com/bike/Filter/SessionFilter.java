package com.bike.Filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.bike.Helper.UserSessionHelper;


/**
 * For user login fileter.
 * 
 * @author root
 *
 */
public class SessionFilter implements Filter {
	private Logger logger = LogManager.getLogger(SessionFilter.class);

	/*
	 * The urls which not filter.
	 */
	private String filterURL;
 
	
	/*
	 * do filter
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		
		// Current access url.
		String path = servletRequest.getRequestURI().replace(servletRequest.getContextPath(), "");

		//check user is login ?
		if (UserSessionHelper.checkLogin(servletRequest.getSession())) {
			logger.debug("Alerdy login. ");
			// Already login
			if (path.startsWith("toLogin")) {
				// Login paget to index page.
				logger.debug("To index page. ");
				try {
					String a_id = servletRequest.getSession().getAttribute("a_id").toString();
					if(a_id != null && a_id.contains("admin")){
						request.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp").forward(request, response);
						return;
					}else{
						request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
						return;
					}
				} catch (IllegalStateException e) {
					// Do not show any error.
				} catch (Exception e) {
					logger.error(e);
				}

			}
			logger.debug("Just go ahead. ");
			// Other page just go ahead. 
			filterChain.doFilter(servletRequest, servletResponse);
		} else {
			// not login
			logger.debug("Not login. ");

			// The page not need to login. 
			String[] splitFilterURL = filterURL.split(",");
			for (String curFilterURL : splitFilterURL) {
				if (path.startsWith(curFilterURL)) {
					logger.debug("Current access path no need to login, just go ahead. ");
					filterChain.doFilter(servletRequest, servletResponse);
				}
			}
			
			// Not login, then go to login page. 
			try {
				logger.debug("No login, to login. ");
				response.getWriter()
						.print("<html><script type='text/JavaScript'> top.location.href='"+servletRequest.getContextPath()+"/toLogin'</script></html>");
				return;
			} catch (IllegalStateException e) {
				// Do not show any error.
			} catch (Exception e) {
				logger.error(e);
			}
		}
	}

	
	/*
	 * init filter
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		// get the filterURL
		filterURL = filterConfig.getInitParameter("filterURL");
	}

	
	public void destroy() {
		// TODO Auto-generated method stub

	}

}

/**
 * if (UserSession.checkLogin(servletRequest.getSession())) {
			logger.debug("Alerdy login. ");
			// Already login
			if (path.startsWith("tologinpage")) {
				// Login paget to index page.
				logger.debug("To index page. ");
				try {
					request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
					return;
				} catch (IllegalStateException e) {
					// Do not show any error.
				} catch (Exception e) {
					logger.error(e);
				}

			}
			
			logger.debug("Just go ahead. ");
			// Other page just go ahead. 
			filterChain.doFilter(servletRequest, servletResponse);
		} else {
			// not login
			logger.debug("Not login. ");

			// The page not need to login. 
			String[] splitFilterURL = filterURL.split(",");
			for (String curFilterURL : splitFilterURL) {
				if (path.startsWith(curFilterURL)) {
					logger.debug("Current access path no need to login, just go ahead. ");
					filterChain.doFilter(servletRequest, servletResponse);
				}
			}
			
			// Not login, then go to login page. 
			try {
				logger.debug("No login, to login. ");
				response.getWriter()
						.print("<html><script type='text/JavaScript'> top.location.href='"+servletRequest.getContextPath()+"/tologin'</script></html>");
				return;
			} catch (IllegalStateException e) {
				// Do not show any error.
			} catch (Exception e) {
				logger.error(e);
			}
		}

	}
 */

