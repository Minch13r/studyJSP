package webapp.shopping.controller.action;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import webapp.shopping.controller.common.Action;
import webapp.shopping.controller.common.ActionForward;
import webapp.shopping.model.dao.ProductDAO;
import webapp.shopping.model.dto.ProductDTO;

import java.util.HashMap;
import java.util.Map;

public class AddCartAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request) {
        ActionForward forward = new ActionForward();

        // 세션 가져오기
        HttpSession session = request.getSession();

        // DAO, DTO 객체 생성
        ProductDAO productDAO = new ProductDAO();
        ProductDTO productDTO = new ProductDTO();

        // 요청 파라미터에서 상품 번호 설정
        String p_num = request.getParameter("p_num");
        productDTO.setP_num(Integer.parseInt(p_num));

        System.out.println("ADDCARD 로그: productDTO.getP_num = [" + productDTO.getP_num() + "]");

        // 로그인 상태 확인
        if (session.getAttribute("userId") != null) {  // 로그인했으면
            // 상품 번호로 상품 정보 조회
            ProductDTO product = productDAO.selectOne(productDTO);
            System.out.println("ADDCART 로그: 상품번호[" + productDTO.getP_num() + "]");

            // 세션에서 장바구니 가져오기
            Map<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>) session.getAttribute("cart");

            if (product != null) {
                // 이미 장바구니에 해당 상품이 있을 경우
                if (cart.containsKey(product)) {
                    cart.put(product, cart.get(product) + 1);
                } else {
                    cart.put(product, 1);
                }

                // 상품 세션에 추가
                session.setAttribute("cart", cart);

                // 성공 메시지 설정
                request.setAttribute("msg", "장바구니 성공!");
                request.setAttribute("flag", true);
                request.setAttribute("url", "controller.jsp?action=PRODUCTDETAILPAGE&p_num=" + productDTO.getP_num());

                // 이동 경로 설정
                forward.setPath("alert.jsp");
                forward.setRedirect(false);
            } else {
                // 상품이 없는 경우
                request.setAttribute("msg", "장바구니에 담을 상품이 없어요ㅠ");
                request.setAttribute("flag", false);

                forward.setPath("alert.jsp");
                forward.setRedirect(false);
            }
        } else {
            // 로그인하지 않은 경우
            request.setAttribute("msg", "로그인 후 이용해주세요!");
            request.setAttribute("flag", false);

            forward.setPath("alert.jsp");
            forward.setRedirect(false);
        }

        return forward;
    }

}
