import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/spotterRegister")
public class SpotterRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public SpotterRegisterServlet() {
    	super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException {
    	request.getRequestDispatcher("spotterRegister.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	doGet(request, response);
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String spotterEmail = request.getParameter("spotterEmail");
        String password = request.getParameter("password");
        
        SpotterRegisterBean srb = new SpotterRegisterBean();
        srb.setFirstName(firstName);
        srb.setLastName(lastName);
        srb.setEmail(spotterEmail);
        srb.setPassword(password);
        
        SpotterRegisterDB srdb = new SpotterRegisterDB();
        String s1 = srdb.insertUser(srb);
        System.out.println(s1);

    }
}
