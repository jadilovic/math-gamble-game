package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mathGame")
public class MathGameServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public MathGameServlet() {
      super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      RequestDispatcher dispatcher //
            = this.getServletContext()//
                  .getRequestDispatcher("/WEB-INF/views/mathGameView.jsp");
 
      dispatcher.forward(request, response);
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   String selection = request.getParameter("Selection");
	      RequestDispatcher dispatcher //
          = this.getServletContext()//
                .getRequestDispatcher("/WEB-INF/views/game" + selection + "View.jsp");

    dispatcher.forward(request, response);
   }
}
