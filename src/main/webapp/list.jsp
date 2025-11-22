<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webservice.webproject22.dao.BoardDAO" %>
<%@ page import="com.webservice.webproject22.vo.BoardVO" %>

<jsp:include page="top.jsp" />

<%
    request.setCharacterEncoding("UTF-8");

    String category = request.getParameter("category");
    String title = request.getParameter("title");

    BoardDAO dao = new BoardDAO();
    List<BoardVO> list = dao.selectBoardList(category, title);
%>

<div class="container mt-5">

    <h2 class="mb-4">📋 게시판 목록</h2>

    <div class="d-flex justify-content-end mb-3">
        <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>작성자</th>
            <th>카테고리</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>관리</th>
        </tr>
        </thead>

        <tbody>
        <%
            if (list != null) {
                for (BoardVO vo : list) {
        %>
        <tr>
            <td><%= vo.getId() %></td>
            <td><a href="view.jsp?id=<%= vo.getId() %>"><%= vo.getTitle() %></a></td>
            <td><%= vo.getWriter() %></td>
            <td><%= vo.getCategory() %></td>
            <td><%= vo.getRegdate() %></td>
            <td><%= vo.getCnt() %></td>
            <td>
                <a href="edit.jsp?id=<%= vo.getId() %>" class="btn btn-sm btn-warning">수정</a>
                <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-sm btn-danger"
                   onclick="return confirm('정말 삭제할까요?');">삭제</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <div class="d-flex justify-content-center mt-4">
        <a href="index.jsp" class="btn btn-secondary">검색 화면으로 돌아가기</a>
    </div>

</div>

<jsp:include page="bottom.jsp" />
