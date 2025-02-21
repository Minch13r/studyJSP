package calc;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class CalcServlet02 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CalcServlet02() {
        super();
    }

    private int calc(int num1, int num2, String op) {
        int res = 0;
        if(op.equals("+")){
            res = num1 + num2;
        }
        else if(op.equals("-")){
            res = num1 - num2;
        }
        else if(op.equals("X")){
            res = num1 * num2;
        }
        else if(op.equals("/")){
            res = num1 / num2;
        }
        return res;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("GET 요청을 받은 상태");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        // request는 op에 존재
        // 요청 정보가 도착하는거는 무조건 String 형식
        String op = request.getParameter("op");

        CalcBean cb = new CalcBean(num1, num2, op);
        int res = cb.getRes();

        // response는 out에 존재
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>Title</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>계산기</h1>");
        out.println("<hr>");
        out.println(res);
        out.println("</body>");
        out.println("</html>");
    }
}
