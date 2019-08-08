package com.test.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        //pre-processing
        if(request.getRequestURI().startsWith("/orderHistory")||
                request.getRequestURI().startsWith("/getProfileDetails")){
            HttpSession session = request.getSession();
            if(session.getAttribute("username") == null){
                request.getRequestDispatcher("/html/login.jsp").forward(request, resp);
            }
        }

        chain.doFilter(request, resp);
        //post-processing

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
