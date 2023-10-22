//осуществляющий проверку попадания точки в область на координатной плоскости
// и формирующий HTML-страницу с результатами проверки.
// Должен обрабатывать все запросы, содержащие сведения о координатах точки и радиусе области.
import points.Point;
import points.ValidPoint;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.util.List;

public class AreaCheckServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        execute(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        execute(request, response);
    }

    private void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long start = System.currentTimeMillis();
        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());

        double par_y;
        double par_x;
        par_y = Double.parseDouble(request.getParameter("Yvalue"));
        par_x = Double.parseDouble(request.getParameter("Xvalue"));
        //request.setAttribute("data", "<tr><td>-1</td><td>3</td><td>1</td><td>miss</td><td>09/27/2023 12:07:19 pm</td><td>5.6028366088867E-5</td></tr>");
        //request.getRequestDispatcher("result.jsp").forward(request, response);
        //response.sendRedirect("result.jsp");
        HttpSession session = request.getSession();
        ArrayList<ValidPoint> thisPoints = new ArrayList<>();

        double r = Double.parseDouble(request.getParameter("Rvalue"));
        double x_beaut = par_x;
        double y_beaut = par_y;
        long finish = System.currentTimeMillis();
        String res = validator(x_beaut*r, y_beaut*r, r);
        long elapsed = finish - start;
        ValidPoint point = new ValidPoint(x_beaut, y_beaut, r, res, timeStamp, elapsed+1);
        thisPoints.add(point);

        if (session.getAttribute("points") != null) {
            ArrayList<ValidPoint> validPoints = (ArrayList<ValidPoint>) session.getAttribute("points");
            thisPoints.addAll(validPoints);
        }
        session.setAttribute("points", thisPoints);

        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/result.jsp");
        requestDispatcher.forward(request, response);
    }
    private String validator(double x, double y, double r) {
        boolean result = false;
        if (x >= 0 && y <= 0) {
            result = (x <= r*r) && (-y <= r*r/2);
        } else if (x <= 0 && y <= 0) {
            result = Math.pow(x, 2) + Math.pow(y, 2) < Math.pow(r, 4);
        } else if (x <= 0 && y > 0) {
            result = y<(x/2 +r*r/2);
        }
        return (result ? "Point hit the area" : "Point did not hit the area");
    }

}
