<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${empty sessionScope.locale ? 'pt_BR' : sessionScope.locale}" />
<fmt:setBundle basename="resources.message" />

<fmt:message key="admin.nomePlaceholder" var="nomePlaceholder" />
<fmt:message key="admin.minibioPlaceholder" var="minibioPlaceholder" />

<c:set var="editando" value="${not empty estudante.id}" />

<!doctype html>
<html lang="${sessionScope.locale == 'en_US' ? 'en' : sessionScope.locale == 'es_ES' ? 'es' : sessionScope.locale == 'fr_FR' ? 'fr' : 'pt-BR'}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        <c:choose>
            <c:when test="${editando}">
                <fmt:message key="admin.editarEstudante" />
            </c:when>
            <c:otherwise>
                <fmt:message key="estudante.novo" />
            </c:otherwise>
        </c:choose>
        -
        <fmt:message key="titulo.portal" />
    </title>

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css"
    >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/admin.css"
    >
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top admin-navbar">
        <div class="container">

            <a
                class="navbar-brand d-flex align-items-center gap-3"
                href="${pageContext.request.contextPath}/"
            >
                <div class="admin-brand-mark">
                    IF
                </div>

                <div>
                    <div class="admin-brand-title">
                        <fmt:message key="menu.administracao" />
                    </div>

                    <div class="admin-brand-subtitle">
                        <fmt:message key="titulo.portal" /> · IFMS
                    </div>
                </div>
            </a>

            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#adminMenu"
                aria-controls="adminMenu"
                aria-expanded="false"
                aria-label="${nomePlaceholder}"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div
                class="collapse navbar-collapse"
                id="adminMenu"
            >
                <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">

                    <li class="nav-item">
                        <a
                            class="nav-link active"
                            href="${pageContext.request.contextPath}/estudantes"
                        >
                            <fmt:message key="menu.estudantes" />
                        </a>
                    </li>

                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="${pageContext.request.contextPath}/atividades"
                        >
                            <fmt:message key="menu.atividades" />
                        </a>
                    </li>

                    <li class="nav-item">
                        <a
                            class="nav-link"
                            href="${pageContext.request.contextPath}/participacoes"
                        >
                            <fmt:message key="participacao.participantes" />
                        </a>
                    </li>

                    <li class="nav-item ms-lg-3">
                        <a
                            class="btn btn-sm btn-outline-success"
                            href="${pageContext.request.contextPath}/"
                        >
                            <fmt:message key="admin.portalPublico" />
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>

    <main class="admin-main">

        <div class="container">

            <div class="row justify-content-center">

                <div class="col-12 col-lg-9 col-xl-8">

                    <a
                        class="d-inline-flex align-items-center gap-2 mb-4 text-success fw-bold"
                        href="${pageContext.request.contextPath}/estudantes"
                    >
                        <span aria-hidden="true">←</span>
                        <fmt:message key="geral.voltar" />
                    </a>

                    <div class="admin-eyebrow">
                        <fmt:message key="admin.gestao" />
                    </div>

                    <h1 class="admin-page-title">

                        <c:choose>

                            <c:when test="${editando}">
                                <fmt:message key="admin.editarEstudante" />
                            </c:when>

                            <c:otherwise>
                                <fmt:message key="estudante.novo" />
                            </c:otherwise>

                        </c:choose>

                    </h1>

                    <p class="admin-page-description">

                        <c:choose>

                            <c:when test="${editando}">
                                <fmt:message key="admin.editarEstudanteDescricao" />
                            </c:when>

                            <c:otherwise>
                                <fmt:message key="admin.novoEstudanteDescricao" />
                            </c:otherwise>

                        </c:choose>

                    </p>

                    <section class="admin-panel">

                        <div class="admin-panel-header">

                            <h2 class="admin-panel-title">
                                <fmt:message key="admin.dadosEstudante" />
                            </h2>

                            <span class="badge bg-success">

                                <c:choose>

                                    <c:when test="${editando}">
                                        <fmt:message key="admin.editandoCadastro" />
                                    </c:when>

                                    <c:otherwise>
                                        <fmt:message key="admin.novoCadastro" />
                                    </c:otherwise>

                                </c:choose>

                            </span>

                        </div>

                        <form
                            action="${pageContext.request.contextPath}/estudantes"
                            method="post"
                            accept-charset="UTF-8"
                        >

                            <c:if test="${editando}">
                                <input
                                    type="hidden"
                                    name="id"
                                    value="${estudante.id}"
                                >
                            </c:if>

                            <div class="p-4 p-lg-5">

                                <div class="row g-4">

                                    <div class="col-12">

                                        <label
                                            for="nome"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="estudante.nome" />
                                            <span class="text-danger">*</span>
                                        </label>

                                        <input
                                            type="text"
                                            class="form-control form-control-lg"
                                            id="nome"
                                            name="nome"
                                            maxlength="150"
                                            placeholder="${nomePlaceholder}"
                                            autocomplete="name"
                                            value="<c:out value='${estudante.nome}' />"
                                            required
                                        >

                                    </div>

                                    <div class="col-12">

                                        <label
                                            for="minibio"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="estudante.minibio" />
                                        </label>

                                        <textarea
                                            class="form-control"
                                            id="minibio"
                                            name="minibio"
                                            rows="5"
                                            placeholder="${minibioPlaceholder}"
                                        ><c:out value="${estudante.minibio}" /></textarea>

                                        <div class="form-text">
                                            <fmt:message key="admin.minibioAjuda" />
                                        </div>

                                    </div>

                                    <div class="col-12">

                                        <label
                                            for="foto"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="estudante.foto" />
                                        </label>

                                        <input
                                            type="text"
                                            class="form-control"
                                            id="foto"
                                            name="foto"
                                            maxlength="255"
                                            placeholder="https://exemplo.com/foto.jpg"
                                            value="<c:out value='${estudante.foto}' />"
                                        >

                                        <div class="form-text">
                                            <fmt:message key="admin.fotoAjuda" />
                                        </div>

                                    </div>

                                </div>

                            </div>

                            <div class="border-top px-4 px-lg-5 py-4">

                                <div class="d-flex flex-column-reverse flex-sm-row justify-content-sm-end gap-3">

                                    <a
                                        class="btn btn-outline-secondary px-4 py-2"
                                        href="${pageContext.request.contextPath}/estudantes"
                                    >
                                        <fmt:message key="geral.cancelar" />
                                    </a>

                                    <button
                                        type="submit"
                                        class="admin-action-button justify-content-center"
                                    >
                                        <fmt:message key="geral.salvar" />
                                        <span aria-hidden="true">→</span>
                                    </button>

                                </div>

                            </div>

                        </form>

                    </section>

                    <footer class="admin-footer">
                        <fmt:message key="titulo.portal" /> · IFMS Campus Campo Grande
                    </footer>

                </div>

            </div>

        </div>

    </main>

    <script
        src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"
    ></script>

</body>
</html>