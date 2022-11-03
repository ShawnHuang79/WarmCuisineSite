package com.wcs.controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class CharsetFilter
 */
@WebFilter(urlPatterns = { "*.jsp", "*.do" },
		dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.ERROR})
public class CharsetFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public CharsetFilter() {
        super();
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// pass the request along the filter chain 
		//前置處理
		request.setCharacterEncoding("UTF-8");
		request.getParameterMap();//鎖定編碼，進去個別網頁時不會再被改
		response.setCharacterEncoding("UTF-8");
		response.getWriter();//鎖定編碼，進去個別網頁時不會再被改
		
		chain.doFilter(request, response);
		
		//後續處理
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
