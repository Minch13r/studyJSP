<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="webapp.shopping.model.dto.MemberDTO, webapp.shopping.model.dto.ProductDTO, webapp.shopping.model.dto.LikesDTO, java.util.ArrayList" %>
<jsp:useBean id="memberDAO" class="webapp.shopping.model.dao.MemberDAO" />
<jsp:useBean id="memberDTO" class="webapp.shopping.model.dto.MemberDTO" />
<jsp:setProperty property="*" name="memberDTO" />
<jsp:useBean id="productDAO" class="webapp.shopping.model.dao.ProductDAO" />
<jsp:useBean id="productDTO" class="webapp.shopping.model.dto.ProductDTO" />
<jsp:setProperty property="*" name="productDTO" />
<jsp:useBean id="likesDAO" class="webapp.shopping.model.dao.LikesDAO" />
<jsp:useBean id="likesDTO" class="webapp.shopping.model.dto.LikesDTO" />
<jsp:setProperty property="*" name="likesDTO" />

<%
	String action = request.getParameter("action");
	System.out.println("CTRL로그 - 액션: ["+action+"]");

	if (action.equals("LOGIN")) {
		// 컨디션"로그인"
		memberDTO.setCondition("SELECTONE");
		memberDTO = memberDAO.selectOne(memberDTO);
		System.out.println("로그인 로그: "+memberDTO);
		if (memberDTO != null) {
			//cart 만들기
			Map<ProductDTO, Integer> cart = (HashMap<ProductDTO,Integer>) session.getAttribute("cart");
			if (cart == null) {
				cart = new HashMap<>();
			}
			//session에 userId, userName, role, cart 저장
			session.setAttribute("userId", memberDTO.getM_id());
			session.setAttribute("userName", memberDTO.getM_name());
			session.setAttribute("role", memberDTO.getM_role());
			session.setAttribute("cart", cart);

			// url, flag, msg 요청단위 저장
			// alert.jsp에 url, true, msg 보내기
			request.setAttribute("msg", "로그인 성공!");
			request.setAttribute("flag", true);
			request.setAttribute("url", "controller.jsp?action=MAINPAGE");
			pageContext.forward("alert.jsp");
		}
		else {
			// url, flag, msg 요청단위 저장
			// alert.jsp에 url, false, msg 보내기
			request.setAttribute("msg", "로그인정보가 틀렸습니다");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
	}
	else if (action.equals("LOGOUT")) {
		// session에서 id,닉네임, role, 장바구니 remove
		session.removeAttribute("userId") ;
		session.removeAttribute("userName") ;
		session.removeAttribute("role") ;
		session.removeAttribute("cart") ;

		// url, flag, msg 요청단위 저장
		// alert.jsp에 url, true, msg 보내기
		request.setAttribute("msg", "로그아웃 성공!");
		request.setAttribute("flag", true);
		request.setAttribute("url", "controller.jsp?action=MAINPAGE");
		pageContext.forward("alert.jsp");
	}
	else if (action.equals("REGPAGE")) {
		response.sendRedirect("signup.jsp");
	}
	else if (action.equals("JOIN")) {
		System.out.println("JOIN 로그 가져온 ID["+memberDTO.getM_id()+"]");

		// 아이디 중복 체크
		MemberDTO checkMember = new MemberDTO();
		checkMember.setM_id(memberDTO.getM_id());
		checkMember.setCondition("SELECTONE_CHECK");
		MemberDTO result = memberDAO.selectOne(checkMember);

		if (result != null) {
			// 아이디가 이미 존재함
			request.setAttribute("msg", "이미 사용 중인 아이디입니다!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
			return;
		}

		// 중복이 없으면 회원가입 진행
		if (memberDAO.insert(memberDTO)) {
			request.setAttribute("msg", "회원가입 성공!");
			request.setAttribute("flag", true);
			request.setAttribute("url", "controller.jsp?action=MAINPAGE");
			pageContext.forward("alert.jsp");
		}
		else {
			request.setAttribute("msg", "회원가입 실패!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
	}
	else if (action.equals("ADDPRODUCTPAGE")) {
		// 상품추가는 관리자인 경우에만 가능
		if(!session.getAttribute("role").equals("admin")) {
			request.setAttribute("msg", "상품 추가는 관리자만 가능합니다!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
		// 상품추가페이지로 redirect
		response.sendRedirect("addproduct.jsp");
	}
	else if (action.equals("ADDPRODUCT")) {
		// 상품추가는 관리자인 경우에만 가능
		if(!session.getAttribute("role").equals("admin")) {
			request.setAttribute("msg", "상품 추가는 관리자만 가능합니다!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
		if (productDAO.insert(productDTO)) {
			// url, flag, msg 요청단위 저장
			// alert.jsp에 url, true, msg 보내기
			request.setAttribute("msg", "제품 추가 완료!");
			request.setAttribute("flag", true);
			request.setAttribute("url", "controller.jsp?action=MAINPAGE");
			pageContext.forward("alert.jsp");
		}
		else {
			// url, flag, msg 요청단위 저장
			// alert.jsp에 url, false, msg 보내기
			request.setAttribute("msg", "제품 추가 실패!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
	}
	else if (action.equals("PRODUCTDETAILPAGE")) {
		// 상품 selectOne()
		likesDTO.setL_m_id((String) session.getAttribute("userId")); //현재 로그인 한 사람
		likesDTO.setL_p_num(productDTO.getP_num());   //제품번호
		boolean flag;
		if(likesDAO.selectOne(likesDTO) != null){   //이미 좋아요 하고있으면
			flag=false;
		}
		else{
			flag=true;
		}
		System.out.println("PRODUCTDETAILPAGE 로그 productDTO.getP_num(): "+productDTO.getP_num());
		productDTO = productDAO.selectOne(productDTO);
		System.out.println("PRODUCTDETAILPAGE 로그 상품 정보: " + productDTO);


		if (productDTO == null) {
			System.out.println("CTRL action = PRODUCTDETAILPAGE 로그: 제품 선택 오류");
		}
		// 상품 요청단위 저장
		// productdetailpage.jsp로 forward
		request.setAttribute("productDTO", productDTO);
		request.setAttribute("flag", flag);
		pageContext.forward("productdetailpage.jsp");
	}

	else if (action.equals("SHOPPINGCART")) {
		Map<ProductDTO, Integer> datas = (HashMap<ProductDTO,Integer>) session.getAttribute("cart");
		int totalPrice=0;
		for(ProductDTO key : datas.keySet()){   //장바구니 총금액
			int cnt = datas.get(key); // 키에 해당하는 물건의 갯수
			totalPrice+=key.getP_price()*cnt; // 갯수*물건가격
			System.out.println("ADDCART 로그: totalPrice["+totalPrice+"]");
		}
		request.setAttribute("totalPrice", totalPrice);
		// 내 장바구니 목록 보내기
		// 어차피 세션에 들어있다
		pageContext.forward("shoppingcart.jsp");
	}
	else if(action.equals("ADDCART")){ //장바구니 상품추가
		System.out.println("ADDCARD 로그: productDTO.getP_num = ["+productDTO.getP_num()+"]");
		if(session.getAttribute("userId")!=null){   //로그인했으면
			//V에서 받은 상품 번호 가지고
			ProductDTO product=productDAO.selectOne(productDTO);   //상품선택 메서드 호출해서 상품 한개 반환
			System.out.println("ADDCART 로그: 상품번호["+productDTO.getP_num()+"]");
			Map<ProductDTO, Integer> cart = (HashMap<ProductDTO,Integer>) session.getAttribute("cart");
			// 이미 장바구니에 해당 상품이 있을 경우
			if (cart.containsKey(product)) {
				cart.put(product, cart.get(product) + 1);
			} else {
				cart.put(product, 1);
			}
			if(product!=null){
				session.setAttribute("cart", cart);         // 상품 세션에 추가
				request.setAttribute("msg", "장바구니 성공!");
				request.setAttribute("flag", true);
				request.setAttribute("url", "controller.jsp?action=PRODUCTDETAILPAGE&p_num="+productDTO.getP_num());
				pageContext.forward("alert.jsp");
			}
			else{
				request.setAttribute("msg", "장바구니에 담을 상품이 없어요ㅠ");
				request.setAttribute("flag", false);
				pageContext.forward("alert.jsp");
			}
		}
		else{   //'로그인 후 이용해주세요' 출력하고 뒤로가기
			request.setAttribute("msg", "로그인 후 이용해주세요!");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
	}
	else if(action.equals("DELETECART")){
		System.out.println("DELETECART 로그 p_num ["+productDTO.getP_num()+"]");
		ProductDTO product = productDAO.selectOne(productDTO);
		Map<ProductDTO, Integer> cart = (HashMap<ProductDTO, Integer>) session.getAttribute("cart");
		if(cart.containsKey(product)){
			cart.remove(product);
			session.setAttribute("cart", cart);
			request.setAttribute("msg", "장바구니 삭제 성공!");
			request.setAttribute("flag", true);
			request.setAttribute("url", "controller.jsp?action=SHOPPINGCART");
			pageContext.forward("alert.jsp");
		}
		else{
			request.setAttribute("msg", "장바구니 삭제 실패ㅠ");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		}
	}
	else if(action.equals("LIKEPRODUCT")){   //좋아요 누르기
		//V에서 상품번호 받아서 DTO에 넣기 - v에서 상품번호 searchKeyword로 보내줄거임
		String userId = (String) session.getAttribute("userId");
		int p_num = productDTO.getP_num();
		System.out.println("LIKEPRODUCT 로그: 상품번호["+p_num+"]");
		System.out.println("LIKEPRODUCT 로그: 회원번호["+userId+"]");

		likesDTO.setL_m_id((String) session.getAttribute("userId"));
		likesDTO.setL_p_num(productDTO.getP_num());
		if (likesDAO.selectOne(likesDTO) != null) { // 해당회원이 해당 제품을 이미 좋아한다면?
			request.setAttribute("msg", "이미 좋아하는 상품입니다");
			request.setAttribute("flag", false);
			pageContext.forward("alert.jsp");
		} else if(likesDAO.insert(likesDTO)){ //'좋아요 누르셨습니다' 출력하고 상세페이지 이동
			request.setAttribute("msg", "좋아요 눌렀습니다");
			request.setAttribute("flag", true);
			request.setAttribute("url", "controller.jsp?action=PRODUCTDETAILPAGE&p_num="+p_num);
			pageContext.forward("alert.jsp");
		}
		//true이면 '좋아요 누르셨습니다' 출력하고 상세페이지로 이동
		//아니면 '로그인해주세요' 출력하고 뒤로가기
	}
	else if(action.equals("LIKEPAGE")){   // 좋아요목록 배열 보내고 좋아요목록 페이지로 이동
		productDTO.setCondition("SELECTALL_LIKED_PRODUCTS_BY_MEMBER");
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);
		productDTO.setM_id(userId);
		ArrayList<ProductDTO> datas=productDAO.selectAll(productDTO);  //좋아요 SELECTALL 메서드 호출해서 배열 반환
		for(ProductDTO d : datas) { // 로그
			System.out.println(d);
		}
		request.setAttribute("likeList", datas);//이 배열 보내고 좋아요목록 페이지로 이동
		pageContext.forward("likelist.jsp");
	}
	else if (action.equals("MAINPAGE")) {
		// if 상품.컨디션 == null
		//     condition = "SELECTALL"
		// 요청단위 저장 (selectAll(상품))
		// main.jsp로 forward
		System.out.println("CTRL action = MAINPAGE 로그: CONDITION = " + productDTO.getCondition());
		if (productDTO.getCondition() == null) {
			productDTO.setCondition("SELECTALL");
		}
		ArrayList<ProductDTO> productDatas = productDAO.selectAll(productDTO);
		for(ProductDTO data : productDatas) { // 로그
			System.out.println(data);
		}
		request.setAttribute("productDatas", productDatas);
		pageContext.forward("main.jsp");
	}
%>
</body>
</html>