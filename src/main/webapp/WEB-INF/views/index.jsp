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
    <form action="/phieu-giam-gia/search" method="get">
        <div class="form-group">
            <h3>FROM</h3>
            <input  type="date" name="BD" class="form-control" value="${s.ma}"/>
            <p style="color: red">${LoiMa}</p>
        </div>
        <div class="form-group">
            <h3>To</h3>
            <input type="date" name="KT" class="form-control" value="${s.ngayTao}"/>
            <p style="color: red">${LoiTen}</p>
        </div>
        <div class="form-group">
            <h3>Khách hàng</h3>
            <select name="maKhachHang" class="form-control" onclick="loadTen()">
                <c:forEach var="l" items="${listKH}">
                    <option value="${l.maKhachHang}">${l.maKhachHang}</option>
                </c:forEach>
            </select>
            <p id="tenKH" style="color: red"></p>
        </div>
        <button class="btn btn-primary" type="submit">Search</button>
    </form>

</div>
<div class="container">
    <table class="table table-stripped">
        <thead>
        <th>#</th>
        <th>Mã</th>
        <th>Tên Phiếu</th>
        <th>Ngày BD</th>
        <th>Ngày KT</th>
        <th>Giá Trị</th>
        <th>Trạng thái</th>
        <th>Tên KH</th>
        <th>Action</th>

        </thead>
        <c:forEach var="o" items="${list.content}" varStatus="stt">
            <tr>
                <td>${stt.index+1}</td>
                <td>${o.maPhieu}</td>
                <td>${o.tenPhieu}</td>
                <td>${o.ngayBatDau}</td>
                <td>${o.ngayKetThuc}</td>
                <td>${o.giaTriGiam}</td>
                <td>${o.trangThai==0?"Hoạt đông":"Không hoạt động"}</td>
                <td>${o.khachHang.tenKhachHang}</td>
                <td>
                    <a href="/phieu-giam-gia/delete/${o.maPhieu}" onclick="return confirm('Bạn có muốn xóa không?')" class="btn btn-danger">Delete</a>
                    <a href="/phieu-giam-gia/view-update/${o.maPhieu}" class="btn btn-danger">Update</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${list.totalPages>0}">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:forEach begin="0" end="${list.totalPages -1}" varStatus="loop">
                <li class="page-item">
                    <a class="page-link" href="/phieu-giam-gia/hien-thi?page=${loop.index}">
                            ${loop.index +1 }
                    </a>
                </li>
            </c:forEach>
        </ul>
    </nav>
    </c:if>
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
            console.log(ten)
        }
        </c:forEach>
    }
</script>
</body>
</html>