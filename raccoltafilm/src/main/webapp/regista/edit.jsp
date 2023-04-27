<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="it" class="h-100">
<head>

<!-- Common imports in pages -->
<jsp:include page="../header.jsp" />
<script type="text/javascript">
	function validateForm() {
		var nome = document.getElementById("nome");
		var cognome = document.getElementById("cognome");
		var nickName = document.getElementById("nickName");
		var dataDiNascita = document.getElementById("dataDiNascita");
		var sesso = document.getElementById("sesso");
		var formIsValid = true;
		if (nome.value === "") {
			nome.classList.add("is-invalid");
			formIsValid = false;
		} else {
			nome.classList.remove("is-invalid");
		}
		if (cognome.value === "") {
			cognome.classList.add("is-invalid");
			formIsValid = false;
		} else {
			cognome.classList.remove("is-invalid");
		}
		if (nickName.value === "") {
			nickName.classList.add("is-invalid");
			formIsValid = false;
		} else {
			nickName.classList.remove("is-invalid");
		}
		if (dataDiNascita.value === "") {
			dataDiNascita.classList.add("is-invalid");
			formIsValid = false;
		} else {
			dataDiNascita.classList.remove("is-invalid");
		}
		if (sesso.value === "") {
			sesso.classList.add("is-invalid");
			formIsValid = false;
		} else {
			sesso.classList.remove("is-invalid");
		}
		return formIsValid;
	}
</script>



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
			<div class="alert alert-danger alert-dismissible fade show d-none"
				role="alert">
				Esempio di operazione fallita!
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
			<div class="alert alert-info alert-dismissible fade show d-none"
				role="alert">
				Aggiungere d-none nelle class per non far apparire
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
						action="${pageContext.request.contextPath}/ExecuteEditRegistaServlet"
						class="row g-3" novalidate="novalidate"
						onsubmit="return validateForm()">


						<div class="col-md-6">
							<label for="nome" class="form-label">Nome <span
								class="text-danger">*</span></label>
							<c:if test="${edit_regista_attr.nome != null }">
								<input type="text" name="nome" id="nome" class="form-control"
									placeholder="Inserire il nome"
									value="${edit_regista_attr.nome }" required>
							</c:if>
							<c:if test="${edit_regista_attr.nome == null }">
								<input type="text" name="nome" id="nome" class="form-control"
									placeholder="Inserire il nome" value="" required>
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="cognome" class="form-label">Cognome <span
								class="text-danger">*</span></label>
							<c:if test="${edit_regista_attr.cognome != null}">
								<input type="text" name="cognome" id="cognome"
									class="form-control" placeholder="Inserire il cognome"
									value="${edit_regista_attr.cognome }" required>
							</c:if>
							<c:if test="${edit_regista_attr.cognome == null}">
								<input type="text" name="cognome" id="cognome"
									class="form-control" placeholder="Inserire il cognome" value=""
									required>
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-6">
							<label for="nickName" class="form-label">Nickname <span
								class="text-danger">*</span></label>
							<c:if test="${edit_regista_attr.nickName != null }">
								<input type="text" class="form-control" name="nickName"
									id="nickName" placeholder="Inserire il nickname"
									value="${edit_regista_attr.nickName }" required>
							</c:if>
							<c:if test="${edit_regista_attr.nickName == null }">
								<input type="text" class="form-control" name="nickName"
									id="nickName" placeholder="Inserire il nickname" value=""
									required>
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>

						</div>

						<!--<fmt:parseDate value="${edit_regista_attr.dataDiNascita}"
							pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date" />
						<fmt:formatDate pattern="yyyy-MM-dd"
							value="${localDateToBeParsed}" var="parsedDate" /> -->
						<div class="col-md-3">
							<label for="dataDiNascita" class="form-label">Data di
								Nascita <span class="text-danger">*</span>
							</label>
							<c:if test="${edit_regista_attr.dataDiNascita != null}"></c:if>
							<input class="form-control" id="dataDiNascita" type="date"
								placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
								name="dataDiNascita" required
								value="${edit_regista_attr.dataDiNascita}">
							<c:if test="${edit_regista_attr.dataDiNascita == null}">
								<input class="form-control" id="dataDiNascita" type="date"
									placeholder="dd/MM/yy" title="formato : gg/mm/aaaa"
									name="dataDiNascita" required value="">
							</c:if>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>

						<div class="col-md-3">
							<label for="sesso" class="form-label">Sesso <span
								class="text-danger">*</span></label> <select class="form-select"
								id="sesso" name="sesso" required>
								<option value="" selected>- Selezionare -</option>
								<option value="MASCHIO"
									${edit_regista_attr.sesso == 'MASCHIO'?'selected':''}>M</option>
								<option value="FEMMINA"
									${edit_regista_attr.sesso == 'FEMMINA'?'selected':''}>F</option>
							</select>
							<div class="invalid-feedback">Campo obbligatorio</div>
						</div>


						<div class="col-12">
							<input type="hidden" name="idRegistaToEdit"
								value="${edit_regista_attr.id}">
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