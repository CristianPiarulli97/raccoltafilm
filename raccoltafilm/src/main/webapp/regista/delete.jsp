<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="it" class="h-100" >
	 <head>

	 	<!-- Common imports in pages -->
	 	<jsp:include page="../header.jsp" />
	 	
	   <title>Visualizza Elemento</title>
	   
	 </head>
	   <body class="d-flex flex-column h-100">
	   
	   		<!-- Fixed navbar -->
	   		<jsp:include page="../navbar.jsp"></jsp:include>
	    
			
			<!-- Begin page content -->
			<main class="flex-shrink-0">
			  <div class="container">
			  
			  		<div class='card'>
					    <div class='card-header'>
					        <h5>Visualizza dettaglio</h5>
					    </div>
					    
					
					    <div class='card-body'>
					<dl class="row">
							  <dt class="col-sm-3 text-right">Id:</dt>
							  <dd class="col-sm-9">${delete_regista_attr.id}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Titolo:</dt>
							  <dd class="col-sm-9">${delete_regista_attr.nome}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Genere:</dt>
							  <dd class="col-sm-9">${delete_regista_attr.cognome}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Genere:</dt>
							  <dd class="col-sm-9">${delete_regista_attr.nickName}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Data Di Nascita:</dt>
							  <dd class="col-sm-9">
							  	<fmt:parseDate value="${delete_regista_attr.dataDiNascita}" pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date"/>
								<fmt:formatDate pattern="dd/MM/yyyy" value="${localDateToBeParsed}" />
							  </dd>
					    	</dl>
					    	
					    	<dl class="row">
								<dt class="col-sm-3 text-right">Sesso:</dt>
								<dd class="col-sm-9">${delete_regista_attr.sesso}</dd>
							</dl>
					    <!-- info Regista -->
					    	<p>
							  <a class="btn btn-primary btn-sm" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
							    Info Films
							  </a>
							</p>
								<c:forEach items="${delete_regista_attr.films }" var="filmsItem">
							
							<div class="collapse" id="collapseExample">
							  <div class="card card-body">
							  	<dl class="row">
								  <dt class="col-sm-3 text-right">titolo:</dt>
								  <dd class="col-sm-9">${filmsItem.titolo}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">genere:</dt>
								  <dd class="col-sm-9">${filmsItem.genere}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">data di pubblicazione:</dt>
								  <dd class="col-sm-9">${filmsItem.dataPubblicazione}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">minuti di durata:</dt>
								  <dd class="col-sm-9">${filmsItem.minutiDurata}</dd>
							   	</dl>
							    
							    
							  </div>
							<!-- end info Regista -->
							</div>
					    	</c:forEach>
					    	
					    <div class='card-footer'>
					    	<form action="ExecuteDeleteRegistaServlet" method="post">
					    		<input type="hidden" name="idRegista" value="${delete_regista_attr.id}">
						    	<button type="submit" name="submit" id="submit" class="btn btn-danger">Elimina</button>
						        <a href="ExecuteListRegistaServlet" class='btn btn-outline-secondary' style='width:80px'>
						            <i class='fa fa-chevron-left'></i> Back
						        </a>
					        </form>
					    </div>
					    
					<!-- end card -->
					</div>	
			  
			    
			  <!-- end container -->  
			  </div>
			  </div>
			</main>
			
			<!-- Footer -->
			<jsp:include page="../footer.jsp" />
	  </body>
</html>