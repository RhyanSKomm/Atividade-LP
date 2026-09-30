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
        <fmt:message key="titulo.atividades" />
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
        href="${pageContext.request.contextPath}/resources/css/public-atividades.css"
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

    <header class="activities-hero">

        <div class="container">

            <div class="lab-kicker">

                <fmt:message
                    key="atividadesPublicas.kicker"
                />

            </div>

            <h1 class="activities-hero-title">

                <fmt:message
                    key="atividadesPublicas.hero.parte1"
                />

                <span class="accent">

                    <fmt:message
                        key="atividadesPublicas.hero.parte2"
                    />

                </span>

            </h1>

            <p class="activities-hero-description">

                <fmt:message
                    key="atividadesPublicas.hero.descricao"
                />

            </p>

        </div>

    </header>

    <main class="activities-section">

        <div class="container">

            <div class="row mb-4 reveal">

                <div class="col-12">

                    <div class="lab-kicker">

                        <fmt:message
                            key="atividadesPublicas.listagemKicker"
                        />

                    </div>

                    <h2
                        class="h3 fw-bold mb-0 mt-2"
                    >

                        <fmt:message
                            key="atividadesPublicas.listagemTitulo"
                        />

                    </h2>

                </div>

            </div>

            <c:choose>

                <c:when test="${empty atividades}">

                    <div class="row">

                        <div class="col-12">

                            <div
                                class="activities-empty reveal"
                            >

                                <div
                                    class="activities-empty-icon"
                                >
                                    🤖
                                </div>

                                <h3>

                                    <fmt:message
                                        key="atividadesPublicas.vazioTitulo"
                                    />

                                </h3>

                                <p>

                                    <fmt:message
                                        key="atividadesPublicas.vazioDescricao"
                                    />

                                </p>

                            </div>

                        </div>

                    </div>

                </c:when>

                <c:otherwise>

                    <div
                        class="row g-4 justify-content-center"
                    >

                        <c:forEach
                            var="atividade"
                            items="${atividades}"
                        >

                            <div
                                class="col-12 col-md-6 col-lg-4"
                            >

                                <article
                                    class="activity-card reveal tilt-card d-flex flex-column"
                                >

                                    <div
                                        class="activity-led"
                                    ></div>

                                    <c:if
                                        test="${atividade.id % 3 == 0}"
                                    >

                                        <div
                                            class="activity-tape"
                                        ></div>

                                    </c:if>

                                    <div>

                                        <span class="activity-code">

                                            ATIVIDADE /

                                            <c:out
                                                value="${atividade.id}"
                                            />

                                        </span>

                                        <h2 class="activity-title">

                                            <c:out
                                                value="${atividade.titulo}"
                                            />

                                        </h2>

                                        <c:if
                                            test="${not empty atividade.descricao}"
                                        >

                                            <p class="activity-description">

                                                <c:out
                                                    value="${atividade.descricao}"
                                                />

                                            </p>

                                        </c:if>

                                        <div class="activity-meta">

                                            <div
                                                class="activity-meta-item"
                                            >

                                                <div
                                                    class="activity-meta-icon"
                                                >
                                                    ⚙
                                                </div>

                                                <div
                                                    class="activity-meta-content"
                                                >

                                                    <span
                                                        class="activity-meta-label"
                                                    >

                                                        <fmt:message
                                                            key="atividade.tipo"
                                                        />

                                                    </span>

                                                    <div
                                                        class="activity-meta-value"
                                                    >

                                                        <c:out
                                                            value="${atividade.tipo}"
                                                        />

                                                    </div>

                                                </div>

                                            </div>

                                            <div
                                                class="activity-meta-item"
                                            >

                                                <div
                                                    class="activity-meta-icon"
                                                >
                                                    ●
                                                </div>

                                                <div
                                                    class="activity-meta-content"
                                                >

                                                    <span
                                                        class="activity-meta-label"
                                                    >

                                                        <fmt:message
                                                            key="atividade.situacao"
                                                        />

                                                    </span>

                                                    <div
                                                        class="activity-meta-value activity-status"
                                                    >

                                                        <span
                                                            class="activity-status-dot"
                                                        ></span>

                                                        <c:out
                                                            value="${atividade.situacao}"
                                                        />

                                                    </div>

                                                </div>

                                            </div>

                                            <div
                                                class="activity-meta-item"
                                            >

                                                <div
                                                    class="activity-meta-icon"
                                                >
                                                    ◷
                                                </div>

                                                <div
                                                    class="activity-meta-content"
                                                >

                                                    <span
                                                        class="activity-meta-label"
                                                    >

                                                        <fmt:message
                                                            key="atividadesPublicas.periodo"
                                                        />

                                                    </span>

                                                    <div
                                                        class="activity-meta-value"
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

                                            </div>

                                        </div>

                                    </div>

                                    <div class="mt-auto">

                                        <a
                                            class="activity-detail-link"
                                            href="${pageContext.request.contextPath}/public/atividade?id=${atividade.id}"
                                        >

                                            <fmt:message
                                                key="geral.detalhes"
                                            />

                                            <span>
                                                →
                                            </span>

                                        </a>

                                    </div>

                                </article>

                            </div>

                        </c:forEach>

                    </div>

                </c:otherwise>

            </c:choose>

            <section
                class="activity-date-line reveal"
            >

                <div class="lab-kicker">

                    <fmt:message
                        key="atividadesPublicas.memoriaKicker"
                    />

                </div>

                <h2>

                    <fmt:message
                        key="atividadesPublicas.memoriaTitulo"
                    />

                </h2>

                <p>

                    <fmt:message
                        key="atividadesPublicas.memoriaDescricao"
                    />

                </p>

            </section>

        </div>

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