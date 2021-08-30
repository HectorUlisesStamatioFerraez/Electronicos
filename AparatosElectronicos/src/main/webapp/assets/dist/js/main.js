var modalCreate = new bootstrap.Modal(document.getElementById('create'), {});
var modalDelete = new bootstrap.Modal(document.getElementById('delete'), {});
function listar (){
    $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/AparatosElectronicos_war/readAparatos'
    }).done(function (res){
       let lista = res.listaAparatos;
       let contenido = document.querySelector('#body');
       contenido.innerHTML= "";
       //innerHTML propiedad para agregar contenido a la tabla
       let iterador = 1;
       if (lista.length >0){
           for (let aparatos of lista){
               //aparatos tiene toda la lista//
               contenido.innerHTML+=`
               <tr>
              <td>${iterador}</td>
              <td>${aparatos.nombre}</td>
              <td>${aparatos.addressId.calle}, ${aparatos.addressId.colonia}, ${aparatos.addressId.codigoPostal}, ${aparatos.addressId.estado}, ${aparatos.addressId.pais}</td>
              <td>${aparatos.fechaRegistro}</td>
              <td>${aparatos.status ? 'Activo' : 'Inactivo' }</td>
              <td>${aparatos.status ? `<form class="d-inline" method="post" action="http://localhost:8080/AparatosElectronicos_war/updateAparatos"><input type="hidden" name="action" value="findById"><input type="hidden" name="id" value="${aparatos.id}"> <button type="submit" class="btn btn-outline-primary">Modificar</button></form>` + ` <button type="button" data-bs-toggle="modal" data-bs-target="#delete" class="btn btn-outline-danger" onclick="delete1('${aparatos.id}','${aparatos.nombre}')">Eliminar</button>` : ``}</td> 
              </tr>
               `
               iterador++;
               // el signo ? es equivalente a ==1 y los dos puntos : hace referencia a un "pero si no es"
           }
           // tr =toda la fila de la tabla y los td= los datos de la columna.
       }else{
           contenido.innerHTML=`<tr>
           <td colspan="6" align="center">No hay ningún registro</td>
           </tr>`;
       }
    });
}

function create(){
    let nombre = document.getElementById("name").value;
    let calle = document.getElementById("calle").value;
    let colonia = document.getElementById("col").value;
    let codigoPostal = document.getElementById("codigo").value;
    let estado = document.getElementById("estado").value;
    let pais = document.getElementById("pais").value;
    let fechaRegistro = document.getElementById("registro").value;
    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/AparatosElectronicos_war/createAparatos',
        data: {
            //los nombres de color morado son aquellos que vamos a utilizar en el archivo para obtener sus valores
            action: "create",
            nombre: nombre,
            calle: calle,
            colonia: colonia,
            codigoPostal: codigoPostal,
            estado: estado,
            pais: pais,
            fechaRegistro: fechaRegistro
        }
    }).done(function (res){
        listar();
        modalCreate.hide(); //Método esconder del modal, para ocultar el modal.
        document.getElementById("name").value = '';
        document.getElementById("calle").value = '' ;
        document.getElementById("col").value = '';
        document.getElementById("codigo").value = '';
        document.getElementById("estado").value = '';
        document.getElementById("pais").value = '';
        document.getElementById("registro").value = '';
    });

    // ajax = enviar los datos al Servlet, a un archivo en especifico
}
function delete1(id, nombre){
    document.getElementById("name1").innerHTML = nombre ;
    document.getElementById("id1").value = id;
}

listar();

