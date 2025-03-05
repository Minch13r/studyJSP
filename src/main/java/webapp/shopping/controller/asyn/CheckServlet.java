package webapp.shopping.controller.asyn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@WebServlet("/check")
public class CheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("서버 도착 성공 ["+request.getParameter("mid")+"]");

        PrintWriter out = response.getWriter();
        if(new Random().nextInt(2)<=0) {
            out.print("true");
        }
        else {
            out.print("false");
        }
    }
}
