
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${empty sessionScope.locale ? 'pt_BR' : sessionScope.locale}" />
<fmt:setBundle basename="resources.message" />

<!doctype html>
<html lang="${sessionScope.locale == 'en_US' ? 'en' : sessionScope.locale == 'es_ES' ? 'es' : sessionScope.locale == 'fr_FR' ? 'fr' : 'pt-BR'}">

<head>
    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>
        <fmt:message key="menu.administracao" />
        -
        <fmt:message key="titulo.estudantes" />
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

            <div class="row align-items-end g-4">

                <div class="col-12 col-lg-8">

                    <div class="admin-eyebrow">
                        <fmt:message key="admin.gestao" />
                    </div>

                    <h1 class="admin-page-title">
                        <fmt:message key="titulo.estudantes" />
                    </h1>

                    <p class="admin-page-description">
                        <fmt:message key="admin.estudantesDescricao" />
                    </p>

                </div>

                <div class="col-12 col-lg-4 text-lg-end admin-action-area">

                    <a
                        class="admin-action-button"
                        href="${pageContext.request.contextPath}/estudantes?acao=novo"
                    >
                        +
                        <fmt:message key="estudante.novo" />
                    </a>

                </div>

            </div>

            <section class="admin-panel">

                <div class="admin-panel-header">

                    <h2 class="admin-panel-title">
                        <fmt:message key="admin.estudantesCadastrados" />
                    </h2>

                </div>

                <c:choose>

                    <c:when test="${empty estudantes}">

                        <div class="admin-empty">

                            <div class="admin-empty-icon">
                                👤
                            </div>

                            <h2>
                                <fmt:message key="admin.estudantesVazioTitulo" />
                            </h2>

                            <p>
                                <fmt:message key="admin.estudantesVazioDescricao" />
                            </p>

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div class="table-responsive">

                            <table class="table admin-table">

                                <thead>
                                    <tr>

                                        <th>
                                            <fmt:message key="titulo.estudantes" />
                                        </th>

                                        <th>
                                            <fmt:message key="estudante.minibio" />
                                        </th>

                                        <th class="text-end">
                                            <fmt:message key="admin.acoes" />
                                        </th>

                                    </tr>
                                </thead>

                                <tbody>

                                    <c:forEach
                                        var="estudante"
                                        items="${estudantes}"
                                    >

                                        <tr>

                                            <td>

                                                <div class="admin-student">

                                                    <div class="admin-avatar">

                                                        <c:choose>

                                                            <c:when test="${not empty estudante.foto}">

                                                                <img
                                                                    src="<c:out value='${estudante.foto}' />"
                                                                    alt="<c:out value='${estudante.nome}' />"
                                                                    onerror="this.style.display='none'; this.nextElementSibling.style.display='grid';"
                                                                >

                                                                <span style="display: none;">
                                                                    👤
                                                                </span>

                                                            </c:when>

                                                            <c:otherwise>
                                                                👤
                                                            </c:otherwise>

                                                        </c:choose>

                                                    </div>

                                                    <div>

                                                        <span class="admin-student-name">
                                                            <c:out value="${estudante.nome}" />
                                                        </span>

                                                        <span class="admin-student-id">
                                                            ID /
                                                            <c:out value="${estudante.id}" />
                                                        </span>

                                                    </div>

                                                </div>

                                            </td>

                                            <td>

                                                <div class="admin-bio">

                                                    <c:choose>

                                                        <c:when test="${not empty estudante.minibio}">
                                                            <c:out value="${estudante.minibio}" />
                                                        </c:when>

                                                        <c:otherwise>
                                                            -
                                                        </c:otherwise>

                                                    </c:choose>

                                                </div>

                                            </td>

                                            <td class="text-end">

                                                <div class="d-flex justify-content-end align-items-center gap-2">

                                                    <a
                                                        class="btn btn-sm btn-outline-success"
                                                        href="${pageContext.request.contextPath}/estudantes?acao=editar&amp;id=${estudante.id}"
                                                    >
                                                        <fmt:message key="admin.editar" />
                                                    </a>

                                                    <button
                                                        type="button"
                                                        class="admin-delete-button"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#modalExcluir${estudante.id}"
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
                            var="estudante"
                            items="${estudantes}"
                        >

                            <div
                                class="modal fade admin-modal"
                                id="modalExcluir${estudante.id}"
                                tabindex="-1"
                            >

                                <div class="modal-dialog modal-dialog-centered">

                                    <div class="modal-content">

                                        <div class="modal-body p-4">

                                            <div class="admin-modal-icon">
                                                !
                                            </div>

                                            <h2 class="h4 admin-modal-title">
                                                <fmt:message key="admin.excluirEstudanteTitulo" />
                                            </h2>

                                            <p class="text-muted mb-0">

                                                <fmt:message key="admin.excluirEstudanteDescricao" />

                                                <strong>
                                                    <c:out value="${estudante.nome}" />
                                                </strong>.

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
                                                href="${pageContext.request.contextPath}/estudantes?acao=excluir&amp;id=${estudante.id}"
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
                <fmt:message key="titulo.portal" /> · IFMS Campus Campo Grande
            </footer>

        </div>
    </main>

    <script
        src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"
    ></script>

</body>
</html>