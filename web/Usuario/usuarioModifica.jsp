<%-- 
    Document   : usuarioModifica
    Created on : 20/02/2023, 19:46:06
    Author     : Usuario
--%>
<%@page import="org.models.ModelUsuario"%>
<%@page import="org.dao.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantillaIndex.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><div class="container">
            <form id="form-work" class="" name="form-work" action="ControllerUsuario" method="get">
                    <h1>Modifica Usuario</h1>
                  <div class="form-group" >  
                      <%
                          DaoUsuario daoUsuario = new DaoUsuario();
                          //Variable que nos envian desde el controller por medio de la instrucción setAttribute
                          int idUsuario = Integer.parseInt((String) request.getAttribute("idUsu"));
                          ModelUsuario usuario = new ModelUsuario();
                          usuario = daoUsuario.list(idUsuario);
                      %>
                      
                      <input type="hidden" name="usuario" value="<%= usuario.getIdUsuario()%>">
                      <div class="col-md-4">
                          <label class="control-label" for="nombre">Nombre</label>
                          <input name="nombre" class="form-control" placeholder="Nombres" type="text" value ="<%= usuario.getNombre()%>">
                      </div>
                      <br><br><br>
                      <div class="col-md-4">
                          <label class="control-label" for="usuarios">Usuario</label>
                          <input name="usuarios" class="form-control" placeholder="Usuario" type="text" value="<%= usuario.getUsuario()%>">
                      </div>
                      <br><br><br>
                      <div class="col-md-3">
                          <label class="control-label" for="password">Password</label>
                          <input name="password" class="form-control" placeholder="Password" type="text" value="<%= usuario.getClave()%>">
                      </div>
                       <br><br><br>
                      <div class="col-md-3">
                          <label class="control-label" for="estado">Estado</label>
                          <select name="estado" class="form-control">
                              <option value="1" selected="">Activo</option>
                              <option value="0" >Inactivo</option>
                          </select>
                      <%--    <input name="estado" class="form-control" placeholder="Estado" type="text"> --%>
                      </div>
                        <br><br><br>
                        <br><br><br><br>
                      <div class="col-md-3">
                          <button type="submit" name="accion" value="update" class="btn btn-success btn-lg btn-block info">Actualizar</button>
                      </div>
                      <div class="col-md-3">
                          <a class="btn btn-success btn-lg btn-block info" href="ControllerUsuario?accion=read"  > Regresar</a>
                      </div>
                  </div>
            </form>
        </div>
    </body>
</html>
