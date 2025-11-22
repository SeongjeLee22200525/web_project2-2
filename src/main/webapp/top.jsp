<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>My Board</title>

    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>

<body>

<!-- 상단 네비게이션 바 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">My Board</a>

        <div class="d-flex">
            <a href="list.jsp" class="btn btn-outline-light btn-sm me-2">목록</a>
            <a href="write.jsp" class="btn btn-outline-light btn-sm">글쓰기</a>
        </div>
    </div>
</nav>

<!-- 각 페이지 내용이 들어갈 영역 -->
<main class="container py-4">