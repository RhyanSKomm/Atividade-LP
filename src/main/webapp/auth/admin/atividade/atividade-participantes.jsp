
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.locale}" />

<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        <fmt:message key="participacao.participantes" />
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

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/admin-participantes.css"
    >
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light fixed-top admin-navbar">
        <div class="container">

            <a
                class="navbar-brand d-flex align-items-center gap-3"
                href="${pageContext.request.contextPath}/"
            >
                <div class="admin-brand-mark">IF</div>

                <div>
                    <div class="admin-brand-title">
                        <fmt:message key="menu.administracao" />
                    </div>

                    <div class="admin-brand-subtitle">
                        Laboratório de Robótica · IFMS
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
                aria-label="Abrir menu"
            >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="adminMenu">
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
                            class="nav-link active"
                            href="${pageContext.request.contextPath}/atividades"
                        >
                            <fmt:message key="menu.atividades" />
                        </a>
                    </li>

                    <li class="nav-item ms-lg-3">
                        <a
                            class="btn btn-sm btn-outline-success"
                            href="${pageContext.request.contextPath}/"
                        >
                            Portal público
                        </a>
                    </li>

                </ul>
            </div>

        </div>
    </nav>

    <main class="admin-main">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-12 col-xl-10">

                    <a
                        class="d-inline-flex align-items-center gap-2 mb-4 text-success fw-bold"
                        href="${pageContext.request.contextPath}/atividades"
                    >
                        <span aria-hidden="true">←</span>
                        <fmt:message key="geral.voltar" />
                    </a>

                    <div class="admin-eyebrow">
                        Gestão do laboratório
                    </div>

                    <h1 class="admin-page-title">
                        <fmt:message key="participacao.participantes" />
                    </h1>

                    <p class="admin-page-description">
                        Vincule estudantes à atividade e registre a função
                        e a contribuição de cada participante.
                    </p>

                    <section class="admin-participants-activity">

                        <div class="admin-participants-activity-label">
                            Atividade selecionada
                        </div>

                        <h2>
                            <c:out value="${atividade.titulo}" />
                        </h2>

                        <c:if test="${not empty atividade.descricao}">
                            <p>
                                <c:out value="${atividade.descricao}" />
                            </p>
                        </c:if>

                    </section>

                    <section class="admin-panel">

                        <div class="admin-panel-header">
                            <h2 class="admin-panel-title">
                                Adicionar participante
                            </h2>
                        </div>

                        <c:choose>

                            <c:when test="${empty estudantes}">

                                <div class="admin-participants-empty">
                                    <div class="admin-participants-empty-icon">👤</div>

                                    <p class="mb-3">
                                        Nenhum estudante está disponível para vinculação.
                                    </p>

                                    <a
                                        class="admin-action-button"
                                        href="${pageContext.request.contextPath}/estudantes?acao=novo"
                                    >
                                        Cadastrar estudante
                                    </a>
                                </div>

                            </c:when>

                            <c:otherwise>

                                <form
                                    class="admin-participants-form"
                                    action="${pageContext.request.contextPath}/participacoes"
                                    method="post"
                                    accept-charset="UTF-8"
                                >

                                    <input
                                        type="hidden"
                                        name="atividadeId"
                                        value="${atividade.id}"
                                    >

                                    <div class="row g-4">

                                        <div class="col-12">

                                            <label
                                                for="estudanteId"
                                                class="form-label"
                                            >
                                                <fmt:message key="titulo.estudantes" />
                                                <span class="text-danger">*</span>
                                            </label>

                                            <select
                                                class="form-select"
                                                id="estudanteId"
                                                name="estudanteId"
                                                required
                                            >
                                                <option value="" selected disabled>
                                                    Selecione um estudante
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

                                        <div class="col-12 col-md-6">

                                            <label
                                                for="funcao"
                                                class="form-label"
                                            >
                                                <fmt:message key="participacao.funcao" />
                                                <span class="text-danger">*</span>
                                            </label>

                                            <input
                                                type="text"
                                                class="form-control"
                                                id="funcao"
                                                name="funcao"
                                                maxlength="150"
                                                placeholder="Ex.: Programação, montagem, pesquisa"
                                                required
                                            >

                                        </div>

                                        <div class="col-12">

                                            <label
                                                for="descricaoContribuicao"
                                                class="form-label"
                                            >
                                                <fmt:message key="participacao.contribuicao" />
                                            </label>

                                            <textarea
                                                class="form-control"
                                                id="descricaoContribuicao"
                                                name="descricaoContribuicao"
                                                rows="4"
                                                placeholder="Descreva o que o estudante realizou nesta atividade."
                                            ></textarea>

                                            <div class="admin-participants-form-help">
                                                Esse registro aparecerá no perfil público
                                                do estudante e nos detalhes da atividade.
                                            </div>

                                        </div>

                                    </div>

                                    <div class="admin-participants-form-actions">

                                        <a
                                            class="btn btn-outline-secondary px-4 py-2"
                                            href="${pageContext.request.contextPath}/atividades"
                                        >
                                            <fmt:message key="geral.cancelar" />
                                        </a>

                                        <button
                                            type="submit"
                                            class="admin-action-button"
                                        >
                                            Vincular estudante
                                            <span aria-hidden="true">→</span>
                                        </button>

                                    </div>

                                </form>

                            </c:otherwise>

                        </c:choose>

                    </section>

                    <section class="admin-panel">

                        <div class="admin-panel-header">
                            <h2 class="admin-panel-title">
                                Participantes vinculados
                            </h2>
                        </div>

                        <c:choose>

                            <c:when test="${empty participacoes}">

                                <div class="admin-participants-empty">
                                    <div class="admin-participants-empty-icon">👥</div>

                                    <p class="mb-0">
                                        Esta atividade ainda não possui estudantes vinculados.
                                    </p>
                                </div>

                            </c:when>

                            <c:otherwise>

                                <div class="admin-participants-list">

                                    <c:forEach
                                        var="participacao"
                                        items="${participacoes}"
                                    >

                                        <article class="admin-participant-card">

                                            <div class="admin-participant-avatar">
                                                👤
                                            </div>

                                            <div class="flex-grow-1">

                                                <div class="admin-participant-name">
                                                    <c:out value="${participacao.estudanteNome}" />
                                                </div>

                                                <c:if test="${not empty participacao.funcao}">
                                                    <span class="admin-participant-role">
                                                        <c:out value="${participacao.funcao}" />
                                                    </span>
                                                </c:if>

                                                <c:if test="${not empty participacao.descricaoContribuicao}">
                                                    <p class="admin-participant-contribution">
                                                        <c:out value="${participacao.descricaoContribuicao}" />
                                                    </p>
                                                </c:if>

                                                <a
                                                    class="d-inline-block mt-2 small fw-bold text-success"
                                                    href="${pageContext.request.contextPath}/public/estudante?id=${participacao.estudanteId}"
                                                    target="_blank"
                                                    rel="noopener noreferrer"
                                                >
                                                    Ver perfil público →
                                                </a>

                                            </div>

                                        </article>

                                    </c:forEach>

                                </div>

                            </c:otherwise>

                        </c:choose>

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