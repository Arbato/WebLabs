
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Double;
import javax.servlet.annotation.WebServlet;

public class ControllerServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        executeClear(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        execute(request, response);
    }
    private void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String receiver = "/test.jsp";
        if (request.getParameter("Yvalue") != null && request.getParameter("Xvalue") != null && request.getParameterValues("Rvalue") != null && validator(request)) {
            receiver = "/AreaCheckServlet";
        }

        getServletContext().getRequestDispatcher(receiver).forward(request, response);

        //PrintWriter out = response.getWriter();
        //out.println("<h1>"+Double.parseDouble(request.getParameter("Yvalue"))+ "</h1>");
        //out.println("<h1>"+Double.parseDouble(request.getParameter("Xvalue"))+ "</h1>");
        //getServletContext().getRequestDispatcher(receiver).forward(request, response);
        //out.println("<h1>"+Double.parseDouble(request.getParameter("Rvalue"))+ "</h1>");
    }
    private void executeClear(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String receiver = "/test.jsp";
        receiver = "/ClearServlet";
        getServletContext().getRequestDispatcher(receiver).forward(request, response);
    }

    private boolean validator(HttpServletRequest request) {
        try {
            Double.parseDouble(request.getParameter("Yvalue"));
            Double.parseDouble(request.getParameter("Xvalue"));
            Double.parseDouble(request.getParameter("Rvalue"));
            return true;

        } catch (NumberFormatException e) {
            return false;
        }
    }
}

