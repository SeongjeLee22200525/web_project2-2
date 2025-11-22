<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.webservice.webproject22.dao.BoardDAO" %>
<%@ page import="com.webservice.webproject22.vo.BoardVO" %>

<%
  request.setCharacterEncoding("UTF-8");

  // URL로 전달된 id 받기
  String idStr = request.getParameter("id");
  int id = Integer.parseInt(idStr);

  // VO 생성
  BoardVO vo = new BoardVO(id, null, null, null, null, null, 0);

  // DAO 호출
  BoardDAO dao = new BoardDAO();
  int result = dao.deleteBoard(vo);

  // 성공 체크
  if (result > 0) {
    response.sendRedirect("list.jsp");
  } else {
%>
<script>
  alert("삭제 실패했습니다!");
  history.back();
</script>
<%
  }
%>
