package webapp.shopping.controller.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import webapp.shopping.controller.common.Action;
import webapp.shopping.controller.common.ActionForward;
import webapp.shopping.model.dao.ProductDAO;
import webapp.shopping.model.dto.ProductDTO;

import java.util.HashMap;
import java.util.Map;

public class DeleteCartAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request) {
        ActionForward forward = new ActionForward();

        // DAO, DTO 객체 생성
        ProductDAO productDAO = new ProductDAO();
        ProductDTO productDTO = new ProductDTO();

        // 요청 파라미터에서 상품 번호 설정
        String p_num = request.getParameter("p_num");
        productDTO.setP_num(Integer.parseInt(p_num));

        System.out.println("DELETECART 로그 p_num [" + productDTO.getP_num() + "]");

        // 세션 가져오기
        HttpSession session = request.getSession();

        // 상품 번호로 상품 정보 조회
        ProductDTO product = productDAO.selectOne(productDTO);

        // 세션에서 장바구니 정보 가져오기
        Map<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>) session.getAttribute("cart");

        // 장바구니에 해당 상품이 있는지 확인
        if (cart != null && cart.containsKey(product)) {
            // 장바구니에서 상품 삭제
            cart.remove(product);

            // 세션에 업데이트된 장바구니 저장
            session.setAttribute("cart", cart);

            // 성공 메시지 설정
            request.setAttribute("msg", "장바구니 삭제 성공!");
            request.setAttribute("flag", true);
            request.setAttribute("url", "controller.jsp?action=SHOPPINGCART");

            // 이동 경로 설정
            forward.setPath("alert.jsp");
            forward.setRedirect(false);
        } else {
            // 실패 메시지 설정
            request.setAttribute("msg", "장바구니 삭제 실패ㅠ");
            request.setAttribute("flag", false);

            // 이동 경로 설정
            forward.setPath("alert.jsp");
            forward.setRedirect(false);
        }

        return forward;
    }
}