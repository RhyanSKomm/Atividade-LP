
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${empty sessionScope.locale ? 'pt_BR' : sessionScope.locale}" />
<fmt:setBundle basename="resources.message" />

<c:set var="editando" value="${not empty atividade.id}" />

<!doctype html>
<html lang="${empty sessionScope.locale ? 'pt-BR' : sessionScope.locale}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
        <c:choose>
            <c:when test="${editando}">
                <fmt:message key="admin.editarAtividade" />
            </c:when>
            <c:otherwise>
                <fmt:message key="atividade.nova" />
            </c:otherwise>
        </c:choose>
        - <fmt:message key="titulo.portal" />
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
        href="${pageContext.request.contextPath}/resources/css/admin-atividade-form.css"
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
                <div class="col-12 col-xl-10">

                    <a
                        class="d-inline-flex align-items-center gap-2 mb-4 text-success fw-bold"
                        href="${pageContext.request.contextPath}/atividades"
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
                                <fmt:message key="admin.editarAtividade" />
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="atividade.nova" />
                            </c:otherwise>
                        </c:choose>
                    </h1>

                    <p class="admin-page-description">
                        <c:choose>
                            <c:when test="${editando}">
                                <fmt:message key="admin.editarAtividadeDescricao" />
                            </c:when>
                            <c:otherwise>
                                <fmt:message key="admin.atividadeNovaDescricao" />
                            </c:otherwise>
                        </c:choose>
                    </p>

                    <section class="admin-panel admin-form-panel">

                        <form
                            action="${pageContext.request.contextPath}/atividades"
                            method="post"
                            accept-charset="UTF-8"
                        >

                            <c:if test="${editando}">
                                <input
                                    type="hidden"
                                    name="id"
                                    value="${atividade.id}"
                                >
                            </c:if>

                            <div class="admin-form-section">

                                <div class="admin-form-heading">
                                    <div class="admin-form-heading-icon">✎</div>

                                    <div>
                                        <h2>
                                            <fmt:message key="admin.informacoesAtividade" />
                                        </h2>

                                        <p>
                                            <fmt:message key="admin.informacoesAtividadeDescricao" />
                                        </p>
                                    </div>
                                </div>

                                <div class="row g-4">

                                    <div class="col-12">
                                        <label
                                            for="titulo"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.titulo" />
                                            <span class="admin-form-required">*</span>
                                        </label>

                                        <input
                                            type="text"
                                            class="form-control"
                                            id="titulo"
                                            name="titulo"
                                            maxlength="200"
                                            placeholder="<fmt:message key='admin.atividadeTituloPlaceholder' />"
                                            value="<c:out value='${atividade.titulo}' />"
                                            required
                                        >
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label
                                            for="tipo"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.tipo" />
                                            <span class="admin-form-required">*</span>
                                        </label>

                                        <select
                                            class="form-select"
                                            id="tipo"
                                            name="tipo"
                                            required
                                        >
                                            <option value="" disabled ${empty atividade.tipo ? 'selected' : ''}>
                                                <fmt:message key="admin.selecioneTipo" />
                                            </option>

                                            <option value="projeto" ${atividade.tipo == 'projeto' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoProjeto" />
                                            </option>

                                            <option value="estágio" ${atividade.tipo == 'estágio' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoEstagio" />
                                            </option>

                                            <option value="tarefa" ${atividade.tipo == 'tarefa' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoTarefa" />
                                            </option>

                                            <option value="oficina" ${atividade.tipo == 'oficina' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoOficina" />
                                            </option>

                                            <option value="palestra" ${atividade.tipo == 'palestra' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoPalestra" />
                                            </option>

                                            <option value="evento" ${atividade.tipo == 'evento' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoEvento" />
                                            </option>

                                            <option value="competição" ${atividade.tipo == 'competição' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoCompeticao" />
                                            </option>

                                            <option value="visita" ${atividade.tipo == 'visita' ? 'selected' : ''}>
                                                <fmt:message key="admin.tipoVisita" />
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label
                                            for="situacao"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.situacao" />
                                            <span class="admin-form-required">*</span>
                                        </label>

                                        <select
                                            class="form-select"
                                            id="situacao"
                                            name="situacao"
                                            required
                                        >
                                            <option value="" disabled ${empty atividade.situacao ? 'selected' : ''}>
                                                <fmt:message key="admin.selecioneSituacao" />
                                            </option>

                                            <option value="planejada" ${atividade.situacao == 'planejada' ? 'selected' : ''}>
                                                <fmt:message key="admin.situacaoPlanejada" />
                                            </option>

                                            <option value="em andamento" ${atividade.situacao == 'em andamento' ? 'selected' : ''}>
                                                <fmt:message key="admin.situacaoEmAndamento" />
                                            </option>

                                            <option value="concluída" ${atividade.situacao == 'concluída' ? 'selected' : ''}>
                                                <fmt:message key="admin.situacaoConcluida" />
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-12">
                                        <label
                                            for="descricao"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.descricao" />
                                        </label>

                                        <textarea
                                            class="form-control"
                                            id="descricao"
                                            name="descricao"
                                            rows="5"
                                            placeholder="<fmt:message key='admin.atividadeDescricaoPlaceholder' />"
                                        ><c:out value="${atividade.descricao}" /></textarea>

                                        <div class="admin-form-help">
                                            <fmt:message key="admin.atividadeDescricaoAjuda" />
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="admin-form-section">

                                <div class="admin-form-heading">
                                    <div class="admin-form-heading-icon">◷</div>

                                    <div>
                                        <h2>
                                            <fmt:message key="admin.datasResponsavel" />
                                        </h2>

                                        <p>
                                            <fmt:message key="admin.datasResponsavelDescricao" />
                                        </p>
                                    </div>
                                </div>

                                <div class="row g-4">

                                    <div class="col-12 col-md-6">
                                        <label
                                            for="dataInicio"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.dataInicio" />
                                            <span class="admin-form-required">*</span>
                                        </label>

                                        <input
                                            type="date"
                                            class="form-control"
                                            id="dataInicio"
                                            name="dataInicio"
                                            value="${atividade.dataInicio}"
                                            required
                                        >
                                    </div>

                                    <div class="col-12 col-md-6">
                                        <label
                                            for="dataFim"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="atividade.dataFim" />
                                        </label>

                                        <input
                                            type="date"
                                            class="form-control"
                                            id="dataFim"
                                            name="dataFim"
                                            value="${atividade.dataFim}"
                                        >

                                        <div class="admin-form-help">
                                            <fmt:message key="admin.dataFimAjuda" />
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label
                                            for="coordenadorId"
                                            class="form-label admin-form-label"
                                        >
                                            <fmt:message key="admin.coordenadorResponsavel" />
                                            <span class="admin-form-required">*</span>
                                        </label>

                                        <select
                                            class="form-select"
                                            id="coordenadorId"
                                            name="coordenadorId"
                                            required
                                        >
                                            <option value="" disabled ${empty atividade.coordenadorId ? 'selected' : ''}>
                                                <fmt:message key="admin.selecioneCoordenador" />
                                            </option>

                                            <c:forEach var="coordenador" items="${coordenadores}">
                                                <option
                                                    value="${coordenador.id}"
                                                    ${atividade.coordenadorId == coordenador.id ? 'selected' : ''}
                                                >
                                                    <c:out value="${coordenador.nome}" />
                                                </option>
                                            </c:forEach>
                                        </select>

                                        <c:if test="${empty coordenadores}">
                                            <div class="admin-form-help text-danger">
                                                <fmt:message key="admin.semCoordenadores" />
                                            </div>
                                        </c:if>
                                    </div>

                                </div>
                            </div>

                            <div class="admin-form-section">

                                <div class="admin-form-heading">
                                    <div class="admin-form-heading-icon">▦</div>

                                    <div>
                                        <h2>
                                            <fmt:message key="admin.periodosLetivos" />
                                        </h2>

                                        <p>
                                            <fmt:message key="admin.periodosDescricao" />
                                        </p>
                                    </div>
                                </div>

                                <c:choose>
                                    <c:when test="${empty periodos}">
                                        <div class="admin-form-empty">
                                            <fmt:message key="admin.semPeriodos" />
                                        </div>
                                    </c:when>

                                    <c:otherwise>
                                        <div class="admin-period-grid">

                                            <c:forEach var="periodo" items="${periodos}">
                                                <div class="admin-period-option">

                                                    <input
                                                        type="checkbox"
                                                        id="periodo${periodo.id}"
                                                        name="periodos"
                                                        value="${periodo.id}"
                                                        ${periodosSelecionados.contains(periodo.id) ? 'checked' : ''}
                                                    >

                                                    <label
                                                        class="admin-period-label"
                                                        for="periodo${periodo.id}"
                                                    >
                                                        <span>
                                                            <span class="admin-period-year">
                                                                <c:out value="${periodo.ano}" />
                                                            </span>

                                                            <span class="admin-period-semester">
                                                                <c:out value="${periodo.semestre}" />º
                                                                <fmt:message key="admin.semestre" />
                                                            </span>
                                                        </span>

                                                        <span class="admin-period-check">✓</span>
                                                    </label>

                                                </div>
                                            </c:forEach>

                                        </div>

                                        <div class="admin-form-help mt-3">
                                            <fmt:message key="admin.periodosAjuda" />
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>

                            <div class="admin-form-actions">

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
                                    <fmt:message key="geral.salvar" />
                                    <span aria-hidden="true">→</span>
                                </button>

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