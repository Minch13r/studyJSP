package webapp.shopping.controller.action;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import webapp.shopping.controller.common.Action;
import webapp.shopping.controller.common.ActionForward;
import webapp.shopping.model.dto.ProductDTO;
import java.util.HashMap;
import java.util.Map;

public class ShoppingCartAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request) {
        ActionForward forward = new ActionForward();

        // 세션에서 장바구니 정보 가져오기
        HttpSession session = request.getSession();
        Map<ProductDTO, Integer> datas = (HashMap<ProductDTO, Integer>) session.getAttribute("cart");

        // 총 가격 계산
        int totalPrice = 0;
        if (datas != null) {  // 장바구니가 비어있지 않은 경우에만 계산
            for (ProductDTO key : datas.keySet()) {
                int cnt = datas.get(key);  // 키에 해당하는 물건의 갯수
                totalPrice += key.getP_price() * cnt;  // 갯수 * 물건가격
                System.out.println("SHOPPINGCART 로그: totalPrice[" + totalPrice + "]");
            }
        }

        // 계산된 총 가격을 request 객체에 저장
        request.setAttribute("totalPrice", totalPrice);

        // 포워딩 설정
        forward.setPath("shoppingcart.jsp");
        forward.setRedirect(false);  // forward 방식으로 이동

        return forward;
    }
}
