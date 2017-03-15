package filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.ObjectInput;

/**
 * Created by cacri on 2017/3/14.
 */
public class loginFilter extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        String[] ignore = new String[]{"login.jsp"};

        String uri = httpServletRequest.getRequestURI();

        if (uri.indexOf("background") != -1){
            boolean doFilter = true;
            for (String s : ignore){
                if (uri.indexOf(s) != -1){
                    doFilter = false;
                    break;
                }
            }
            if (doFilter){
                Object obj = httpServletRequest.getAttribute("user");
                if (null == obj){
                    httpServletRequest.setCharacterEncoding("utf-8");
                    httpServletResponse.setCharacterEncoding("utf-8");
                }
            }
        }
    }
}
