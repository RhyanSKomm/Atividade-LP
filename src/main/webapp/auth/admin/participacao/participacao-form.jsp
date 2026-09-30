<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="resources.message" />

<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>
        <fmt:message key="participacao.nova" />
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
                aria-label="<fmt:message key='menu.administracao' />"
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
                            class="nav-link"
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
                            class="nav-link active"
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

                    <c:choose>

                        <c:when test="${not empty atividadeIdSelecionada}">

                            <a
                                class="d-inline-flex align-items-center gap-2 mb-4 text-success fw-bold"
                                href="${pageContext.request.contextPath}/atividades?acao=participantes&amp;id=${atividadeIdSelecionada}"
                            >
                                <span aria-hidden="true">←</span>
                                <fmt:message key="geral.voltar" />
                            </a>

                        </c:when>

                        <c:otherwise>

                            <a
                                class="d-inline-flex align-items-center gap-2 mb-4 text-success fw-bold"
                                href="${pageContext.request.contextPath}/atividades"
                            >
                                <span aria-hidden="true">←</span>
                                <fmt:message key="geral.voltar" />
                            </a>

                        </c:otherwise>

                    </c:choose>

                    <div class="admin-eyebrow">
                        <fmt:message key="admin.gestao" />
                    </div>

                    <h1 class="admin-page-title">
                        <fmt:message key="participacao.associarTitulo" />
                    </h1>

                    <p class="admin-page-description">
                        <fmt:message key="participacao.associarDescricao" />
                    </p>

                    <c:if test="${param.erro == 'duplicada'}">

                        <div
                            class="alert alert-danger"
                            role="alert"
                        >
                            <fmt:message key="participacao.duplicada" />
                        </div>

                    </c:if>

                    <c:if test="${empty estudantes}">

                        <div
                            class="alert alert-warning"
                            role="alert"
                        >
                            <fmt:message key="participacao.semEstudantes" />
                        </div>

                    </c:if>

                    <c:if test="${empty atividades}">

                        <div
                            class="alert alert-warning"
                            role="alert"
                        >
                            <fmt:message key="participacao.semAtividades" />
                        </div>

                    </c:if>

                    <section class="admin-panel">

                        <div class="admin-panel-header">

                            <h2 class="admin-panel-title">
                                <fmt:message key="participacao.dados" />
                            </h2>

                            <span class="badge bg-success">
                                <fmt:message key="participacao.nova" />
                            </span>

                        </div>

                        <form
                            action="${pageContext.request.contextPath}/participacoes"
                            method="post"
                            accept-charset="UTF-8"
                        >

                            <div class="p-4 p-lg-5">

                                <div class="row g-4">

                                    <div class="col-12">

                                        <label
                                            for="estudanteId"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="participacao.estudante" />
                                            <span class="text-danger">*</span>
                                        </label>

                                        <select
                                            class="form-select form-select-lg"
                                            id="estudanteId"
                                            name="estudanteId"
                                            required
                                        >

                                            <option
                                                value=""
                                                selected
                                                disabled
                                            >
                                                <fmt:message key="participacao.selecioneEstudante" />
                                            </option>

                                            <c:forEach
                                                var="estudante"
                                                items="${estudantes}"
                                            >

                                                <option value="${estudante.id}">
                                                    <c:out value="${estudante.nome}" />
                                                </option>

                                            </c:forEach>

                                        </select>

                                    </div>

                                    <div class="col-12">

                                        <label
                                            for="atividadeId"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="participacao.atividade" />
                                            <span class="text-danger">*</span>
                                        </label>

                                        <select
                                            class="form-select form-select-lg"
                                            id="atividadeId"
                                            name="atividadeId"
                                            required
                                        >

                                            <option
                                                value=""
                                                disabled
                                                <c:if test="${empty atividadeIdSelecionada}">selected</c:if>
                                            >
                                                <fmt:message key="participacao.selecioneAtividade" />
                                            </option>

                                            <c:forEach
                                                var="atividade"
                                                items="${atividades}"
                                            >

                                                <c:choose>

                                                    <c:when test="${atividade.id == atividadeIdSelecionada}">

                                                        <option
                                                            value="${atividade.id}"
                                                            selected
                                                        >
                                                            <c:out value="${atividade.titulo}" />
                                                        </option>

                                                    </c:when>

                                                    <c:otherwise>

                                                        <option value="${atividade.id}">
                                                            <c:out value="${atividade.titulo}" />
                                                        </option>

                                                    </c:otherwise>

                                                </c:choose>

                                            </c:forEach>

                                        </select>

                                    </div>

                                    <div class="col-12">

                                        <label
                                            for="funcao"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="participacao.funcao" />
                                        </label>

                                        <input
                                            type="text"
                                            class="form-control"
                                            id="funcao"
                                            name="funcao"
                                            maxlength="100"
                                            placeholder="<fmt:message key='participacao.funcaoPlaceholder' />"
                                        >

                                    </div>

                                    <div class="col-12">

                                        <label
                                            for="descricaoContribuicao"
                                            class="form-label fw-bold"
                                        >
                                            <fmt:message key="participacao.descricaoContribuicao" />
                                        </label>

                                        <textarea
                                            class="form-control"
                                            id="descricaoContribuicao"
                                            name="descricaoContribuicao"
                                            rows="5"
                                            placeholder="<fmt:message key='participacao.descricaoPlaceholder' />"
                                        ></textarea>

                                    </div>

                                </div>

                            </div>

                            <div class="border-top px-4 px-lg-5 py-4">

                                <div
                                    class="d-flex flex-column-reverse flex-sm-row justify-content-sm-end gap-3"
                                >

                                    <a
                                        class="btn btn-outline-secondary px-4 py-2"
                                        href="${pageContext.request.contextPath}/atividades"
                                    >
                                        <fmt:message key="geral.cancelar" />
                                    </a>

                                    <button
                                        type="submit"
                                        class="admin-action-button justify-content-center"
                                        <c:if test="${empty estudantes or empty atividades}">disabled</c:if>
                                    >
                                        <fmt:message key="participacao.associar" />
                                        <span aria-hidden="true">→</span>
                                    </button>

                                </div>

                            </div>

                        </form>

                    </section>

                    <footer class="admin-footer">
                        Laboratório de Robótica · IFMS Campus Campo Grande
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