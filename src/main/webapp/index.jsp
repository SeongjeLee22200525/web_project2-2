<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<jsp:include page="top.jsp" />

<h2 class="mb-4 text-center">📌 게시판 메인 / 검색</h2>

<!-- 검색 폼 -->
<div class="row justify-content-center">
    <div class="col-md-6">

        <form action="list.jsp" method="get" class="mb-4">

            <!-- 카테고리 검색 -->
            <div class="form-floating mb-3">
                <select class="form-select" id="category" name="category">
                    <option value="">전체</option>
                    <option value="notice">공지</option>
                    <option value="free">자유</option>
                    <option value="qna">질문</option>
                </select>
                <label for="category">카테고리 선택</label>
            </div>

            <!-- 제목 검색 -->
            <div class="form-floating mb-3">
                <input
                        type="text"
                        class="form-control"
                        id="titleSearch"
                        name="title"
                        placeholder="검색할 제목 입력">
                <label for="titleSearch">제목 검색</label>
            </div>

            <!-- 검색 버튼 -->
            <button class="btn btn-primary w-100" type="submit">검색하기</button>
        </form>

        <!-- 전체 목록 이동 / 글쓰기 -->
        <div class="d-grid gap-2">
            <a href="list.jsp" class="btn btn-secondary">전체 목록 보기</a>
            <a href="write.jsp" class="btn btn-success">새 글 작성</a>
        </div>

    </div>
</div>

<jsp:include page="bottom.jsp" />
