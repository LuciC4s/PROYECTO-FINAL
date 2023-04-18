<%-- 
    Document   : usuarioSearch
    Created on : 2/03/2023, 21:08:33
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="org.models.ModelUsuario"%>
<%@page import="java.util.List"%>
<%@page import="org.dao.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantillaIndex.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busqueda Usuario</title>
    </head>
    <body>
        <div class="container">            
            <h1>Usuarios</h1>
            <a class="btn btn-success" href="ControllerUsuario?accion=nuevo"  > Agregar Nuevo</a>
            <a class="btn btn-success" href="ControllerUsuario?accion=read"  > Regresar</a>
            <br><br>
            <form id="form-work" class="" name="form-work" action="ControllerUsuario" method="get">                  
                   
                      <%
                          DaoUsuario daoUsuario = new DaoUsuario();
                          //Variable que nos envian desde el controller por medio de la instrucción setAttribute
                          int idUsuario = Integer.parseInt((String) request.getAttribute("idUsu"));
                          ModelUsuario usuario = new ModelUsuario();
                          usuario = daoUsuario.list(idUsuario);
                      %>
                      
                      <input type="hidden" name="usuario" value="<%= usuario.getIdUsuario()%>">
                     </form>
                     
                <table border="1" width="1" cellspacing="1" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Usuario</th>
                            <th class="text-center">Password</th>
                            <th class="text-center">Estado</th>                            
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>                                         
                    <%
                        DaoUsuario daoUsuarioo = new  DaoUsuario();
                        List<ModelUsuario> lstUsuarioo = daoUsuarioo.listar();
                        Iterator<ModelUsuario> iteratorUsuarioo = lstUsuarioo.iterator();
                        ModelUsuario usuarioo = null;
                            usuarioo = iteratorUsuarioo.next();                        
                     %> 
                       <tbody>
                        <tr>
                            <td class="text-center"><%= usuario.getIdUsuario()%></td>
                            <td class="text-center"><%= usuario.getNombre()%></td>
                            <td class="text-center"><%= usuario.getUsuario()%></td>
                            <td class="text-center"><%= usuario.getClave()%></td>
                            <td class="text-center"><%= usuario.getEstado()%></td>                            
                            <td class="text-center">                                
                                <a type="button" class="btn btn-danger" href="ControllerUsuario?accion=editar&id=<%=usuario.getIdUsuario()%>">Editar</a>
                                <a type="button" class="btn btn-danger" href="ControllerUsuario?accion=delete&id=<%=usuario.getIdUsuario()%>">Eliminar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
        </div>
    </body>
</html>
