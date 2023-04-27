<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />

<title>Modifica Elemento</title>

</head>
<body class="d-flex flex-column h-100">

	<!-- Fixed navbar -->
	<jsp:include page="../navbar.jsp"></jsp:include>


	<!-- Begin page content -->
	<main class="flex-shrink-0">
		<div class="container">

			<div
				class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }"
				role="alert">
				${errorMessage}
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>

			<div class='card'>
				<div class='card-header'>
					<h5>Modifica elemento</h5>
				</div>
				<div class='card-body'>

					<h6 class="card-title">
						I campi con <span class="text-danger">*</span> sono obbligatori
					</h6>


					<form method="post"
						action="${pageContext.request.contextPath}/ExecuteEditFilmServlet"
						class="row g-3" novalidate="novalidate"
						onsubmit="return validateForm()">


						<div class="col-md-6">
							<label for="titolo" class="form-label">Titolo <span
								class="text-danger">*</span></label>
							<c:if test="${edit_film_attr.titolo != null }">
								<input type="text" name="titolo" id="titolo"
									class="form-control" placeholder="Inserire il titolo"
									value="${edit_film_attr.titolo }">
							</c:if>
							<c:if test="${edit_film_attr.titolo == null }">
								<input type="text" name="titolo" id="titolo"
									class="form-control" placeholder="Inserire il titolo" value="">
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="genere" class="form-label">Genere <span
								class="text-danger">*</span></label>
							<c:if test="${edit_film_attr.genere != null }">
								<input type="text" name="genere" id="genere"
									class="form-control" placeholder="Inserire il genere"
									value="${edit_film_attr.genere }">
							</c:if>
							<c:if test="${edit_film_attr.genere == null }">
								<input type="text" name="genere" id="genere"
									class="form-control" placeholder="Inserire il genere" value="">
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<!--<fmt:parseDate value="${edit_film_attr.dataPubblicazione}"
							pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date" />
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${localDateToBeParsed}" var="parsedDate" /> -->
						<div class="col-md-6">
							<label for="dataPubblicazione" class="form-label">Data di
								Pubblicazione <span class="text-danger">*</span>
							</label>
							<c:if test="${edit_film_attr.dataPubblicazione != null}">
								<input class="form-control" id="dataPubblicazione" type="date"
									placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
									name="dataPubblicazione"
									value="${edit_film_attr.dataPubblicazione}">
							</c:if>
							<c:if test="${edit_film_attr.dataPubblicazione == null}">
								<input class="form-control" id="dataPubblicazione" type="date"
									placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
									name="dataPubblicazione" value="">
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>

						</div>

						<div class="col-md-6">
							<label for="minutiDurata" class="form-label">Durata
								(minuti) <span class="text-danger">*</span>
							</label>
							<c:if test="${edit_film_attr.minutiDurata != null}">
								<input type="number" class="form-control" name="minutiDurata"
									id="minutiDurata" placeholder="Inserire la durata"
									value="${edit_film_attr.minutiDurata }">
							</c:if>

							<c:if test="${edit_film_attr.minutiDurata == null}">
								<input type="number" class="form-control" name="minutiDurata"
									id="minutiDurata" placeholder="Inserire la durata" value="">
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>


						<div class="col-md-6">
							<label for="regista.id">Regista <span class="text-danger">*</span></label>
							<select class="form-select" id="regista.id" name="regista.id">
								<option value="" selected>-- Selezionare una voce --</option>
								<c:forEach items="${registi_list_attribute }" var="registaItem">
									<option value="${registaItem.id}"
										${edit_film_attr.regista.id == registaItem.id?'selected':''}>${registaItem.nome }
										${registaItem.cognome }</option>
								</c:forEach>
							</select>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-12">
							<input type="hidden" name="idFilmToEdit"
								value="${edit_film_attr.id}">
							<button type="submit" name="insertSubmit" value="insertSubmit"
								id="insertSubmit" class="btn btn-primary">Conferma</button>
						</div>

					</form>



					<!-- end card-body -->
				</div>
				<!-- end card -->
			</div>


			<!-- end container -->
		</div>

	</main>

	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>