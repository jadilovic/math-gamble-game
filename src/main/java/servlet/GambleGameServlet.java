package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Race;

@WebServlet("/gambleGame")
public class GambleGameServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
 
   public GambleGameServlet() {
      super();
   }
 
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      RequestDispatcher dispatcher //
            = this.getServletContext()//
                  .getRequestDispatcher("/WEB-INF/views/gambleGameView.jsp");
      dispatcher.forward(request, response);
   }
 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
	   
	   Race rdRace = new Race();
	   rdRace.run();
	   String winner = rdRace.getWinner();
	   System.out.println(winner);
	   request.setAttribute("winner", winner);
	      
	   RequestDispatcher dispatcher //
          = this.getServletContext()//
                .getRequestDispatcher("/WEB-INF/views/gambleGameView.jsp");
    dispatcher.forward(request, response);
   }
 
}
