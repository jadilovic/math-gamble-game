package filter;

import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
 
@WebFilter(filterName = "encodingFilter", urlPatterns = { "/*" })
public class EncodingFilter implements Filter {
 
  public EncodingFilter() {
  }
 
  public void init(FilterConfig fConfig) throws ServletException {
 
  }
 
  public void destroy() {
 
  }
 
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
          throws IOException, ServletException {
      request.setCharacterEncoding("UTF-8");
 System.out.println("Encoding Filter");
      chain.doFilter(request, response);
  }
 
}