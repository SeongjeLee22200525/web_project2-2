<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.webservice.webproject22.dao.BoardDAO" %>
<%@ page import="com.webservice.webproject22.vo.BoardVO" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 폼에서 전달된 데이터 받기
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String category = request.getParameter("category");
    String content = request.getParameter("content");

    // VO 객체 생성
    BoardVO vo = new BoardVO(0, title, writer, category, content, null, 0);

    // DAO 호출
    BoardDAO dao = new BoardDAO();
    int result = dao.insertBoard(vo);

    // 성공 여부 체크
    if (result > 0) {
        response.sendRedirect("list.jsp");
    } else {
%>
<script>
    alert("글 작성에 실패했습니다!");
    history.back();
</script>
<%
    }
%>
