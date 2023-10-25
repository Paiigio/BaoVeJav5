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
    <%--@elvariable id="s" type=""--%>
    <form:form action="/phieu-giam-gia/update" modelAttribute="s">
        <div class="form-group">
            <input type="text" name="maPhieu" value="${s.maPhieu}" >
            <h3>Tên Phiếu</h3>
            <form:input path="tenPhieu" type="text" class="form-control" value="${s.tenPhieu}"/>
            <p style="color: red">${LoiMa}</p>
        </div>
        <div class="form-group">
            <h3>Giá trị giảm</h3>
            <form:input path="giaTriGiam" type="text" class="form-control" value="${s.giaTriGiam}"/>
        </div>
        <div class="form-group">
            <h3>Giá trị giảm tối da</h3>
            <form:input  path="giaTriGiamToiDa" type="text" class="form-control" value="${s.giaTriGiamToiDa}"/>
        </div>
        <div class="form-group">
            <h3>Ngày bắt đầu</h3>
            <form:input  path="ngayBatDau" type="date" class="form-control" value="${s.ngayBatDau}"/>
        </div>
        <div class="form-group">
            <h3>Ngày kết thúc</h3>
            <form:input  path="ngayKetThuc" type="date" class="form-control" value="${s.ngayKetThuc}"/>
        </div>

        <div class="form-group">
            <h3>Khách hàng</h3>
            <form:select path="khachHang.maKhachHang" class="form-control" onclick="loadTen()">
                <c:forEach var="l" items="${listKH}">
                    <form:option value="${l.maKhachHang}">${l.maKhachHang}</form:option>
                </c:forEach>
            </form:select>
            <p id="tenKH" style="color: red"></p>
        </div>
        <button class="btn btn-primary">Update</button>
    </form:form>
</div>

<c:if test="${not empty ThongBao}">
    <script>
        alert("${ThongBao}")
    </script>
</c:if>
<script>
    function loadTen() {
        var ma=event.target.value;
        <c:forEach var="l" items="${listKH}">
        var maK='${l.maKhachHang}';
        if(ma==maK){
            var ten='${l.tenKhachHang}';
            document.getElementById("tenKH").innerHTML=ten;
        }
        </c:forEach>
    }
</script>
</body>
</html>