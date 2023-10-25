<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <title>Title</title>
</head>
<body>
<div class="container">
        <h3>Detail</h3>
    Mã<p>${s.ma}</p>
    sdt <p>${s.soDienThoai}</p>
    ngày tạo <p>${s.ngayTao}</p>
</div>

<c:if test="${not empty ThongBao}">
    <script>
        alert("${ThongBao}")
    </script>
</c:if>
</body>
</html>