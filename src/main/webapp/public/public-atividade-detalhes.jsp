<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="${sessionScope.locale}" />

<!doctype html>

<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <title>
        <c:out value="${atividade.titulo}" />
        -
        <fmt:message key="titulo.portal" />
    </title>

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/css/bootstrap.min.css"
    >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/public.css"
    >

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/resources/css/public-atividade-detalhes.css"
    >

</head>

<body>

    <div class="ambient-background"></div>

    <canvas id="robot-bg"></canvas>

    <div
        class="cursor-orb"
        id="cursorOrb"
    ></div>

    <nav
        class="navbar navbar-expand-lg navbar-light fixed-top public-navbar"
    >

        <div class="container">

            <a
                class="navbar-brand d-flex align-items-center gap-3"
                href="${pageContext.request.contextPath}/"
            >

                <div class="public-brand-mark">
                    IF
                </div>

                <div>

                    <div class="public-brand-title">

                        <fmt:message
                            key="titulo.portal"
                        />

                    </div>

                    <div class="public-brand-subtitle">

                        IFMS · Campus Campo Grande

                    </div>

                </div>

            </a>

            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#publicMenu"
                aria-controls="publicMenu"
                aria-expanded="false"
                aria-label="Abrir menu"
            >

                <span
                    class="navbar-toggler-icon"
                ></span>

            </button>

            <div
                class="collapse navbar-collapse"
                id="publicMenu"
            >

                <ul
                    class="navbar-nav ms-auto align-items-lg-center gap-lg-2"
                >

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="${pageContext.request.contextPath}/"
                        >

                            <fmt:message
                                key="menu.inicio"
                            />

                        </a>

                    </li>

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="${pageContext.request.contextPath}/public/public-sobre.jsp"
                        >

                            <fmt:message
                                key="menu.sobre"
                            />

                        </a>

                    </li>

                    <li class="nav-item">

                        <a
                            class="nav-link"
                            href="${pageContext.request.contextPath}/public/estudantes"
                        >

                            <fmt:message
                                key="menu.estudantes"
                            />

                        </a>

                    </li>

                    <li class="nav-item">

                        <a
                            class="nav-link active"
                            href="${pageContext.request.contextPath}/public/atividades"
                        >

                            <fmt:message
                                key="menu.atividades"
                            />

                        </a>

                    </li>

                    <li
                        class="nav-item dropdown ms-lg-3 mt-2 mt-lg-0"
                    >

                        <button
                            class="btn language-pill dropdown-toggle"
                            type="button"
                            id="languageDropdown"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >

                            🌐

                            <fmt:message
                                key="idioma.selecionar"
                            />

                        </button>

                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="languageDropdown"
                        >

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="${pageContext.request.contextPath}/idioma?lang=pt"
                                >
                                    Português
                                </a>

                            </li>

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="${pageContext.request.contextPath}/idioma?lang=en"
                                >
                                    English
                                </a>

                            </li>

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="${pageContext.request.contextPath}/idioma?lang=es"
                                >
                                    Español
                                </a>

                            </li>

                            <li>

                                <a
                                    class="dropdown-item"
                                    href="${pageContext.request.contextPath}/idioma?lang=fr"
                                >
                                    Français
                                </a>

                            </li>

                        </ul>

                    </li>

                </ul>

            </div>

        </div>

    </nav>

    <main>

        <section class="activity-detail-section">

            <div class="container">

                <a
                    class="activity-detail-back"
                    href="${pageContext.request.contextPath}/public/atividades"
                >

                    <span>
                        ←
                    </span>

                    <fmt:message
                        key="atividadeDetalhe.voltar"
                    />

                </a>

                <div
                    class="activity-detail-header reveal"
                >

                    <div class="row g-0">

                        <div class="col-12 col-lg-7">

                            <div
                                class="activity-detail-main h-100 d-flex flex-column justify-content-center"
                            >

                                <div>

                                    <span
                                        class="activity-detail-code"
                                    >

                                        ATIVIDADE /

                                        <c:out
                                            value="${atividade.id}"
                                        />

                                    </span>

                                </div>

                                <h1
                                    class="activity-detail-title"
                                >

                                    <c:out
                                        value="${atividade.titulo}"
                                    />

                                </h1>

                                <c:choose>

                                    <c:when
                                        test="${not empty atividade.descricao}"
                                    >

                                        <p
                                            class="activity-detail-description"
                                        >

                                            <c:out
                                                value="${atividade.descricao}"
                                            />

                                        </p>

                                    </c:when>

                                    <c:otherwise>

                                        <p
                                            class="activity-detail-description"
                                        >

                                            <fmt:message
                                                key="atividadeDetalhe.semDescricao"
                                            />

                                        </p>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>

                        <div class="col-12 col-lg-5">

                            <div
                                class="activity-detail-side"
                            >

                                <div
                                    class="activity-info-box"
                                >

                                    <span
                                        class="activity-info-label"
                                    >

                                        <fmt:message
                                            key="atividade.tipo"
                                        />

                                    </span>

                                    <div
                                        class="activity-info-value"
                                    >

                                        <c:out
                                            value="${atividade.tipo}"
                                        />

                                    </div>

                                </div>

                                <div
                                    class="activity-info-box"
                                >

                                    <span
                                        class="activity-info-label"
                                    >

                                        <fmt:message
                                            key="atividade.situacao"
                                        />

                                    </span>

                                    <div
                                        class="activity-info-value activity-info-status"
                                    >

                                        <c:out
                                            value="${atividade.situacao}"
                                        />

                                    </div>

                                </div>

                                <div
                                    class="activity-info-box"
                                >

                                    <span
                                        class="activity-info-label"
                                    >

                                        <fmt:message
                                            key="atividadeDetalhe.datas"
                                        />

                                    </span>

                                    <div
                                        class="activity-info-value"
                                    >

                                        <c:out
                                            value="${atividade.dataInicio}"
                                        />

                                        <c:if
                                            test="${not empty atividade.dataFim}"
                                        >

                                            →

                                            <c:out
                                                value="${atividade.dataFim}"
                                            />

                                        </c:if>

                                    </div>

                                </div>

                                <div
                                    class="activity-info-box"
                                >

                                    <span
                                        class="activity-info-label"
                                    >

                                        <fmt:message
                                            key="atividadeDetalhe.coordenador"
                                        />

                                    </span>

                                    <div
                                        class="activity-info-value"
                                    >

                                        <c:choose>

                                            <c:when
                                                test="${not empty coordenador}"
                                            >

                                                <c:out
                                                    value="${coordenador.nome}"
                                                />

                                            </c:when>

                                            <c:otherwise>

                                                -

                                            </c:otherwise>

                                        </c:choose>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section
            class="activity-periods-section"
        >

            <div class="container">

                <div
                    class="activity-section-heading reveal"
                >

                    <div class="lab-kicker">

                        <fmt:message
                            key="atividadeDetalhe.periodosKicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="atividadeDetalhe.periodos"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="atividadeDetalhe.periodosDescricao"
                        />

                    </p>

                </div>

                <c:choose>

                    <c:when test="${empty periodos}">

                        <div
                            class="periods-empty reveal"
                        >

                            <fmt:message
                                key="atividadeDetalhe.semPeriodos"
                            />

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div
                            class="period-list reveal"
                        >

                            <c:forEach
                                var="periodo"
                                items="${periodos}"
                            >

                                <div
                                    class="period-chip"
                                >

                                    <span
                                        class="period-chip-year"
                                    >

                                        <c:out
                                            value="${periodo.ano}"
                                        />

                                    </span>

                                    <span
                                        class="period-chip-semester"
                                    >

                                        <c:out
                                            value="${periodo.semestre}"
                                        />

                                        º

                                        <fmt:message
                                            key="atividadeDetalhe.semestre"
                                        />

                                    </span>

                                </div>

                            </c:forEach>

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </section>

        <section class="participants-section">

            <div class="container">

                <div
                    class="activity-section-heading reveal"
                >

                    <div class="lab-kicker">

                        <fmt:message
                            key="atividadeDetalhe.participantesKicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="atividadeDetalhe.participantes"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="atividadeDetalhe.participantesDescricao"
                        />

                    </p>

                </div>

                <c:choose>

                    <c:when
                        test="${empty participacoes}"
                    >

                        <div
                            class="participants-empty reveal"
                        >

                            <fmt:message
                                key="atividadeDetalhe.semParticipantes"
                            />

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div
                            class="row g-4 justify-content-center"
                        >

                            <c:forEach
                                var="participacao"
                                items="${participacoes}"
                            >

                                <div
                                    class="col-12 col-md-6 col-lg-4"
                                >

                                    <article
                                        class="participant-card reveal"
                                    >

                                        <div
                                            class="participant-avatar"
                                        >
                                            👤
                                        </div>

                                        <h3>

                                            <c:out
                                                value="${participacao.estudanteNome}"
                                            />

                                        </h3>

                                        <div
                                            class="participant-info"
                                        >

                                            <span
                                                class="participant-label"
                                            >

                                                <fmt:message
                                                    key="participacao.funcao"
                                                />

                                            </span>

                                            <div
                                                class="participant-value"
                                            >

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty participacao.funcao}"
                                                    >

                                                        <c:out
                                                            value="${participacao.funcao}"
                                                        />

                                                    </c:when>

                                                    <c:otherwise>

                                                        -

                                                    </c:otherwise>

                                                </c:choose>

                                            </div>

                                        </div>

                                        <div
                                            class="participant-info"
                                        >

                                            <span
                                                class="participant-label"
                                            >

                                                <fmt:message
                                                    key="participacao.contribuicao"
                                                />

                                            </span>

                                            <div
                                                class="participant-value"
                                            >

                                                <c:choose>

                                                    <c:when
                                                        test="${not empty participacao.descricaoContribuicao}"
                                                    >

                                                        <c:out
                                                            value="${participacao.descricaoContribuicao}"
                                                        />

                                                    </c:when>

                                                    <c:otherwise>

                                                        -

                                                    </c:otherwise>

                                                </c:choose>

                                            </div>

                                        </div>

                                    </article>

                                </div>

                            </c:forEach>

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </section>

    </main>

    <footer class="public-footer">

        <div class="container">

            <div
                class="row align-items-center gy-3"
            >

                <div class="col-12 col-md-6">

                    <strong>

                        <fmt:message
                            key="titulo.portal"
                        />

                    </strong>

                    <br>

                    <small>
                        IFMS · Campus Campo Grande
                    </small>

                </div>

                <div class="col-12 col-md-6">

                    <div
                        class="d-flex flex-wrap gap-3 justify-content-md-end small"
                    >

                        <a
                            class="text-light"
                            href="https://www.instagram.com/robotican.cg/"
                            target="_blank"
                        >
                            @robotican.cg
                        </a>

                        <a
                            class="text-light"
                            href="${pageContext.request.contextPath}/public/public-sobre.jsp"
                        >

                            <fmt:message
                                key="menu.sobre"
                            />

                        </a>

                        <a
                            class="text-light"
                            href="${pageContext.request.contextPath}/public/atividades"
                        >

                            <fmt:message
                                key="menu.atividades"
                            />

                        </a>

                        <a
                            class="text-light"
                            href="${pageContext.request.contextPath}/public/estudantes"
                        >

                            <fmt:message
                                key="menu.estudantes"
                            />

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </footer>

    <script
        src="${pageContext.request.contextPath}/resources/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"
    ></script>

    <script
        src="${pageContext.request.contextPath}/resources/js/public.js"
    ></script>

</body>

</html>