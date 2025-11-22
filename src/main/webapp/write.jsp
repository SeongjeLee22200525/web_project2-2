<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>새 글 작성</title>

  <!-- Bootstrap -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">

</head>

<body class="container mt-5">

<h2 class="mb-4">📝 새 글 작성</h2>

<form action="write_ok.jsp" method="post">

  <!-- 제목 -->
  <div class="form-floating mb-3">
    <input type="text" class="form-control" id="title" name="title" placeholder="제목" required>
    <label for="title">제목</label>
  </div>

  <!-- 작성자 -->
  <div class="form-floating mb-3">
    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자" required>
    <label for="writer">작성자</label>
  </div>

  <!-- 카테고리 -->
  <div class="form-floating mb-3">
    <select class="form-select" id="category" name="category">
      <option value="notice">공지</option>
      <option value="free">자유</option>
      <option value="qna">질문</option>
    </select>
    <label for="category">카테고리</label>
  </div>

  <!-- 내용 -->
  <div class="form-floating mb-4">
            <textarea class="form-control" id="content" name="content"
                      style="height: 200px;" placeholder="내용 입력" required></textarea>
    <label for="content">내용</label>
  </div>

  <!-- 버튼 -->
  <div class="d-flex gap-2">
    <button type="submit" class="btn btn-primary">등록</button>
    <a href="list.jsp" class="btn btn-secondary">목록으로</a>
  </div>

</form>

</body>
</html>
