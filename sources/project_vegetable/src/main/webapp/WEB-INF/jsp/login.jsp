<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet"href="https://fonts.googleapis.com/css2?family=Mitr&family=Roboto+Condensed:wght@300;400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <meta charset="UTF-8">
    <title></title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
<link rel="stylesheet" href="css/login.css">
<script src="js/login.js"></script>
<body>
<jsp:include page="basic/header.jsp"/>

<c:if test="${login != null}">
    <c:if test="login.status == 0">
        <span>ท่านยังไม่ได้รับการอนุมัติ</span>
    </c:if>
</c:if>

<div class="container">
    <div class="wrapper">
        <div class="title"><span>เข้าสู่ระบบ</span></div>
        <form:form action="isMemberLogin" method="POST" modelAttribute="login">
            <div class="row">
                <i class="fas fa-user"></i>
                <form:input type="email" path="email" id="email" placeholder="Email" required="true"/>
            </div>
            <div class="row">
                <i class="fas fa-lock"></i>
                <form:input type="password" path="password" id="password" placeholder="Password" required="true"/>
            </div>
            <div class="row button">
                <input type="submit" value="Login">
            </div>
            <div class="signup-link">คุณยังไม่เป็นสมาชิกใช่หรือไม่? <a href="goRegister">สมัครสมาชิก</a></div>
        </form:form>
    </div>
</div>

<jsp:include page="basic/footer.jsp"/>
</body>
</html>