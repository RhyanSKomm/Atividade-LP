
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${empty sessionScope.locale ? 'pt_BR' : sessionScope.locale}" />
<fmt:setBundle basename="resources.message" />

<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        <fmt:message key="titulo.atividades" />
        -
        <fmt:message key="menu.administracao" />
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
        href="${pageContext.request.contextPath}/resources/css/admin-atividades.css"
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

            <div class="row align-items-end g-4">

                <div class="col-12 col-lg-8">

                    <div class="admin-eyebrow">
                        Gestão do laboratório
                    </div>

                    <h1 class="admin-page-title">
                        <fmt:message key="titulo.atividades" />
                    </h1>

                    <p class="admin-page-description">
                        Gerencie os projetos, oficinas, competições e demais
                        atividades cadastradas no Laboratório de Robótica.
                    </p>

                </div>

                <div class="col-12 col-lg-4 text-lg-end admin-action-area">

                    <a
                        class="admin-action-button"
                        href="${pageContext.request.contextPath}/atividades?acao=novo"
                    >
                        <span aria-hidden="true">+</span>
                        <fmt:message key="atividade.nova" />
                    </a>

                </div>
            </div>

            <section class="admin-panel">

                <div class="admin-panel-header">

                    <h2 class="admin-panel-title">
                        Atividades cadastradas
                    </h2>

                    <c:if test="${not empty atividades}">
                        <div class="admin-activity-summary">
                            <span class="admin-activity-summary-dot"></span>
                            Registros disponíveis para consulta
                        </div>
                    </c:if>

                </div>

                <c:choose>

                    <c:when test="${empty atividades}">

                        <div class="admin-activity-empty">

                            <div class="admin-activity-empty-icon">
                                🤖
                            </div>

                            <h2>
                                Nenhuma atividade cadastrada
                            </h2>

                            <p>
                                Cadastre a primeira atividade para registrar
                                os projetos e experiências do laboratório.
                            </p>

                            <a
                                class="admin-action-button"
                                href="${pageContext.request.contextPath}/atividades?acao=novo"
                            >
                                <span aria-hidden="true">+</span>
                                <fmt:message key="atividade.nova" />
                            </a>

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div class="table-responsive">

                            <table class="table admin-table">

                                <thead>
                                    <tr>
                                        <th>Atividade</th>

                                        <th>
                                            <fmt:message key="atividade.tipo" />
                                        </th>

                                        <th>
                                            <fmt:message key="atividade.situacao" />
                                        </th>

                                        <th>Datas</th>

                                        <th class="text-end">
                                            Ações
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <c:forEach
                                        var="atividade"
                                        items="${atividades}"
                                    >

                                        <tr>

                                            <td>

                                                <span class="admin-activity-name">
                                                    <c:out value="${atividade.titulo}" />
                                                </span>

                                                <span class="admin-activity-id">
                                                    ID /
                                                    <c:out value="${atividade.id}" />
                                                </span>

                                                <c:if test="${not empty atividade.descricao}">
                                                    <div class="admin-activity-description">
                                                        <c:out value="${atividade.descricao}" />
                                                    </div>
                                                </c:if>

                                            </td>

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty atividade.tipo}">
                                                        <span class="admin-activity-type">
                                                            <c:out value="${atividade.tipo}" />
                                                        </span>
                                                    </c:when>

                                                    <c:otherwise>
                                                        —
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty atividade.situacao}">
                                                        <span class="admin-activity-status">
                                                            <c:out value="${atividade.situacao}" />
                                                        </span>
                                                    </c:when>

                                                    <c:otherwise>
                                                        —
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>

                                            <td>

                                                <div class="admin-activity-dates">

                                                    <div>

                                                        <span class="admin-activity-date-label">
                                                            Início:
                                                        </span>

                                                        <c:choose>

                                                            <c:when test="${not empty atividade.dataInicio}">
                                                                <c:out value="${atividade.dataInicio}" />
                                                            </c:when>

                                                            <c:otherwise>
                                                                —
                                                            </c:otherwise>

                                                        </c:choose>

                                                    </div>

                                                    <div>

                                                        <span class="admin-activity-date-label">
                                                            Fim:
                                                        </span>

                                                        <c:choose>

                                                            <c:when test="${not empty atividade.dataFim}">
                                                                <c:out value="${atividade.dataFim}" />
                                                            </c:when>

                                                            <c:otherwise>
                                                                —
                                                            </c:otherwise>

                                                        </c:choose>

                                                    </div>

                                                </div>

                                            </td>

                                            <td>

                                                <div class="admin-activity-actions">

                                                    <a
                                                        class="admin-activity-view"
                                                        href="${pageContext.request.contextPath}/public/atividade?id=${atividade.id}"
                                                        target="_blank"
                                                        rel="noopener noreferrer"
                                                    >
                                                        Visualizar
                                                    </a>

                                                    <a
                                                        class="admin-activity-view"
                                                        href="${pageContext.request.contextPath}/atividades?acao=editar&amp;id=${atividade.id}"
                                                    >
                                                        <fmt:message key="admin.editar" />
                                                    </a>

                                                    <a
                                                        class="admin-activity-view"
                                                        href="${pageContext.request.contextPath}/atividades?acao=participantes&amp;id=${atividade.id}"
                                                    >
                                                        Participantes
                                                    </a>

                                                    <button
                                                        type="button"
                                                        class="admin-delete-button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modalExcluirAtividade${atividade.id}"
                                                    >
                                                        <fmt:message key="geral.excluir" />
                                                    </button>

                                                </div>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>

                        <c:forEach
                            var="atividade"
                            items="${atividades}"
                        >

                            <div
                                class="modal fade admin-modal"
                                id="modalExcluirAtividade${atividade.id}"
                                tabindex="-1"
                                aria-labelledby="tituloExcluirAtividade${atividade.id}"
                                aria-hidden="true"
                            >

                                <div class="modal-dialog modal-dialog-centered">

                                    <div class="modal-content">

                                        <div class="modal-body p-4">

                                            <div class="admin-modal-icon">
                                                !
                                            </div>

                                            <h2
                                                class="h4 admin-modal-title"
                                                id="tituloExcluirAtividade${atividade.id}"
                                            >
                                                Excluir atividade?
                                            </h2>

                                            <p class="text-muted mb-0">

                                                Você está prestes a excluir

                                                <strong>
                                                    <c:out value="${atividade.titulo}" />
                                                </strong>.

                                            </p>

                                            <p class="small text-muted mt-3 mb-0">
                                                Confirme somente se deseja remover
                                                este registro do laboratório.
                                            </p>

                                        </div>

                                        <div class="modal-footer">

                                            <button
                                                type="button"
                                                class="btn btn-light"
                                                data-bs-dismiss="modal"
                                            >
                                                <fmt:message key="geral.cancelar" />
                                            </button>

                                            <a
                                                class="btn btn-danger"
                                                href="${pageContext.request.contextPath}/atividades?acao=excluir&amp;id=${atividade.id}"
                                            >
                                                <fmt:message key="geral.excluir" />
                                            </a>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                    </c:otherwise>

                </c:choose>

            </section>

            <footer class="admin-footer">
                Laboratório de Robótica · IFMS Campus Campo Grande
            </footer>

        </div>
    </main>

    <script
        src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"
    ></script>

</body>
</html>