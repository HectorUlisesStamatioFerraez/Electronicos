<%--
  Created by IntelliJ IDEA.
  User: Ulises
  Date: 29/08/2021
  Time: 03:02 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>
<body>
<form method="POST" action="${context}/readAparatos">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${aparato.id}">
    <input type="hidden" name="idAddress" value="${aparato.addressId.idAddress}">
    <label>Nombre:</label>
    <br>
    <input type="text" id="name" name="name" class="form-control" value="${aparato.nombre}">
    <br>
    <label>Calle:</label>
    <br>
    <input type="text" id="calle" name="calle" class="form-control" value="${aparato.addressId.calle}">
    <br>
    <label>Colonia:</label>
    <br>
    <input type="text" id="col" name="col" class="form-control" value="${aparato.addressId.colonia}">
    <br>
    <label>Código Postal:</label>
    <br>
    <input type="number" id="codigo" name="codigo" class="form-control" value="${aparato.addressId.codigoPostal}">
    <br>
    <label>Estado:</label>
    <br>
    <input type="text" id="estado" name="estado" class="form-control" value="${aparato.addressId.estado}">
    <br>
    <label>País:</label>
    <br>
    <input type="text" id="pais" name="pais" class="form-control" value="${aparato.addressId.pais}">
    <br>
    <label>Fecha de registro:</label>
    <br>
    <input type="date" id="registro" name="registro" class="form-control" value="${aparato.fechaRegistro}">
    <br>
    <button type="submit" class="btn btn-outline-primary">Modificar</button>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/main.js" type="text/javascript"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
