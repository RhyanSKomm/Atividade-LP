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
        <fmt:message key="titulo.estudantes" />
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
                            class="nav-link active"
                            href="${pageContext.request.contextPath}/public/estudantes"
                        >

                            <fmt:message
                                key="menu.estudantes"
                            />

                        </a>

                    </li>

                    <li class="nav-item">

                        <a
                            class="nav-link"
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

    <header class="public-page-hero">

        <div class="container">

            <div class="lab-kicker">

                <fmt:message
                    key="estudantes.kicker"
                />

            </div>

            <h1 class="public-page-title">

                <fmt:message
                    key="estudantes.hero.parte1"
                />

                <span class="accent">

                    <fmt:message
                        key="estudantes.hero.parte2"
                    />

                </span>

            </h1>

            <p class="public-page-description">

                <fmt:message
                    key="estudantes.hero.descricao"
                />

            </p>

            <div class="hero-note">

                <fmt:message
                    key="estudantes.hero.fluxo"
                />

            </div>

        </div>

    </header>

    <main class="students-section">

        <div class="container">

            <div class="row mb-4 reveal">

                <div class="col-12">

                    <div class="lab-kicker">

                        <fmt:message
                            key="estudantes.participantes"
                        />

                    </div>

                    <h2
                        class="h3 fw-bold mb-0 mt-2"
                    >

                        <fmt:message
                            key="estudantes.subtitulo"
                        />

                    </h2>

                </div>

            </div>

            <c:choose>

                <c:when test="${empty estudantes}">

                    <div class="row">

                        <div class="col-12">

                            <div
                                class="students-empty reveal"
                            >

                                <div
                                    class="students-empty-icon"
                                >
                                    🤖
                                </div>

                                <h3>

                                    <fmt:message
                                        key="estudantes.vazio.titulo"
                                    />

                                </h3>

                                <p
                                    class="text-muted mb-0"
                                >

                                    <fmt:message
                                        key="estudantes.vazio.descricao"
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
                            var="estudante"
                            items="${estudantes}"
                        >

                            <div
                                class="col-12 col-md-6 col-lg-4"
                            >

                                <article
                                    class="student-card reveal tilt-card h-100"
                                >

                                    <div
                                        class="student-led"
                                    ></div>

                                    <c:if
                                        test="${estudante.id % 3 == 0}"
                                    >

                                        <div
                                            class="student-tape"
                                        ></div>

                                    </c:if>

                                    <div
                                        class="student-photo"
                                    >

                                        <c:choose>

                                            <c:when
                                                test="${not empty estudante.foto}"
                                            >

                                                <img
                                                    src="${estudante.foto}"
                                                    alt="${estudante.nome}"
                                                    onerror="this.style.display='none'; this.nextElementSibling.style.display='grid';"
                                                >

                                                <div
                                                    class="student-avatar-fallback"
                                                    style="display: none;"
                                                >
                                                    👤
                                                </div>

                                            </c:when>

                                            <c:otherwise>

                                                <div
                                                    class="student-avatar-fallback"
                                                >
                                                    👤
                                                </div>

                                            </c:otherwise>

                                        </c:choose>

                                        <span
                                            class="student-photo-tag"
                                        >

                                            LAB /

                                            ALUNO-

                                            <c:out
                                                value="${estudante.id}"
                                            />

                                        </span>

                                    </div>

                                    <div
                                        class="student-card-body d-flex flex-column"
                                    >

                                        <h2>

                                            <c:out
                                                value="${estudante.nome}"
                                            />

                                        </h2>

                                        <c:choose>

                                            <c:when
                                                test="${not empty estudante.minibio}"
                                            >

                                                <p>

                                                    <c:out
                                                        value="${estudante.minibio}"
                                                    />

                                                </p>

                                            </c:when>

                                            <c:otherwise>

                                                <p>

                                                    <fmt:message
                                                        key="estudantes.semMinibio"
                                                    />

                                                </p>

                                            </c:otherwise>

                                        </c:choose>

                                        <div class="mt-auto">

                                            <a
                                                class="student-detail-link"
                                                href="${pageContext.request.contextPath}/public/estudante?id=${estudante.id}"
                                            >

                                                <fmt:message
                                                    key="geral.detalhes"
                                                />

                                                <span>
                                                    →
                                                </span>

                                            </a>

                                        </div>

                                    </div>

                                </article>

                            </div>

                        </c:forEach>

                    </div>

                </c:otherwise>

            </c:choose>

            <section
                class="network-strip reveal"
            >

                <div class="network-content">

                    <div
                        class="lab-kicker"
                        style="color: #8ce6b0;"
                    >

                        <fmt:message
                            key="estudantes.conexao.kicker"
                        />

                    </div>

                    <div class="row mt-3">

                        <div
                            class="col-12 col-lg-8"
                        >

                            <h2
                                class="network-title"
                            >

                                <fmt:message
                                    key="estudantes.conexao.titulo"
                                />

                            </h2>

                            <p
                                class="network-copy"
                            >

                                <fmt:message
                                    key="estudantes.conexao.descricao"
                                />

                            </p>

                        </div>

                    </div>

                    <div class="network">

                        <span
                            class="network-pulse"
                        ></span>

                        <div class="network-node">

                            <div
                                class="network-node-icon"
                            >
                                👤
                            </div>

                            <strong>

                                <fmt:message
                                    key="estudantes.conexao.estudante"
                                />

                            </strong>

                        </div>

                        <div class="network-node">

                            <div
                                class="network-node-icon"
                            >
                                ↔
                            </div>

                            <strong>

                                <fmt:message
                                    key="estudantes.conexao.participacao"
                                />

                            </strong>

                        </div>

                        <div class="network-node">

                            <div
                                class="network-node-icon"
                            >
                                🤖
                            </div>

                            <strong>

                                <fmt:message
                                    key="estudantes.conexao.atividade"
                                />

                            </strong>

                        </div>

                        <div class="network-node">

                            <div
                                class="network-node-icon"
                            >
                                🔧
                            </div>

                            <strong>

                                <fmt:message
                                    key="estudantes.conexao.contribuicao"
                                />

                            </strong>

                        </div>

                        <div class="network-node">

                            <div
                                class="network-node-icon"
                            >
                                ●
                            </div>

                            <strong>

                                <fmt:message
                                    key="estudantes.conexao.memoria"
                                />

                            </strong>

                        </div>

                    </div>

                </div>

            </section>

        </div>

    </main>

    <footer class="public-footer">

        <div class="container">

            <div
                class="row align-items-center gy-3"
            >

                <div
                    class="col-12 col-md-6"
                >

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

                <div
                    class="col-12 col-md-6"
                >

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