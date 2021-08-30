<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Listado</title>
    <link href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css"/>
    <link href="${context}/assets/plugins/bootstrap/css/bootstrap.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<button type="button" class="btn btn-outline-success btn-sm" data-bs-toggle="modal" data-bs-target="#create"> Agregar
    aparato
</button>

<br>
<table class="table">
    <thead class="table-dark">
    <th>No</th>
    <th>Nombre</th>
    <th>Dirección del fabricante</th>
    <th>Fecha de registro</th>
    <th>Status</th>
    <th>Acciones</th>
    </thead>
    <tbody id="body">
    </tbody>
</table>

<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Agregar aparato electrónico</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Nombre:</label>
                <br>
                <input type="text" id="name" name="name" class="form-control">
                <br>
                <label>Calle:</label>
                <br>
                <input type="text" id="calle" name="calle" class="form-control">
                <br>
                <label>Colonia:</label>
                <br>
                <input type="text" id="col" name="col" class="form-control">
                <br>
                <label>Código Postal:</label>
                <br>
                <input type="number" id="codigo" name="codigo" class="form-control">
                <br>
                <label>Estado:</label>
                <br>
                <input type="text" id="estado" name="estado" class="form-control">
                <br>
                <label>País:</label>
                <br>
                <input type="text" id="pais" name="pais" class="form-control">
                <br>
                <label>Fecha de registro:</label>
                <br>
                <input type="date" id="registro" name="registro" class="form-control">
                <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>
                    Cerrar
                </button>
                <button type="button" class="btn btn-outline-success" onclick="create();">Agregar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Eliminar aparato electrónicoo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formulario" action="${context}/readAparatos" method="POST">
                    <input type="hidden" value="delete" name="action">
                    <input type="hidden" id="id1" name="id">
                    ¿Estás seguro de querer eliminar el siguiente aparato electrónico: <span id="name1"></span>?
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>
                    Cerrar
                </button>

                <button form="formulario" type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Eliminar
                </button>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/main.js" type="text/javascript"></script>
</body>
</html>
