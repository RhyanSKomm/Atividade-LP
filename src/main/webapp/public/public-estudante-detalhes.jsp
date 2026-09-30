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
        <c:out value="${estudante.nome}" />
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
        href="${pageContext.request.contextPath}/resources/css/public-estudante-detalhes.css"
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

    <main>

        <section class="profile-section">

            <div class="container">

                <a
                    class="profile-back"
                    href="${pageContext.request.contextPath}/public/estudantes"
                >

                    <span>
                        ←
                    </span>

                    <fmt:message
                        key="estudanteDetalhe.voltar"
                    />

                </a>

                <div class="profile-shell reveal">

                    <div class="row g-0 align-items-stretch">

                        <div class="col-12 col-lg-5">

                            <div class="profile-photo-area">

                                <div class="profile-led"></div>

                                <c:choose>

                                    <c:when
                                        test="${not empty estudante.foto}"
                                    >

                                        <img
                                            class="profile-photo"
                                            src="${estudante.foto}"
                                            alt="${estudante.nome}"
                                            onerror="this.style.display='none'; this.nextElementSibling.style.display='grid';"
                                        >

                                        <div
                                            class="profile-avatar"
                                            style="display: none;"
                                        >
                                            👤
                                        </div>

                                    </c:when>

                                    <c:otherwise>

                                        <div
                                            class="profile-avatar"
                                        >
                                            👤
                                        </div>

                                    </c:otherwise>

                                </c:choose>

                                <div class="profile-tag">

                                    LAB /

                                    ALUNO-

                                    <c:out
                                        value="${estudante.id}"
                                    />

                                </div>

                            </div>

                        </div>

                        <div class="col-12 col-lg-7">

                            <div class="profile-content h-100 d-flex flex-column justify-content-center">

                                <div class="lab-kicker">

                                    <fmt:message
                                        key="estudanteDetalhe.kicker"
                                    />

                                </div>

                                <h1>

                                    <c:out
                                        value="${estudante.nome}"
                                    />

                                </h1>

                                <div class="profile-bio-label">

                                    <fmt:message
                                        key="estudante.minibio"
                                    />

                                </div>

                                <c:choose>

                                    <c:when
                                        test="${not empty estudante.minibio}"
                                    >

                                        <p class="profile-bio">

                                            <c:out
                                                value="${estudante.minibio}"
                                            />

                                        </p>

                                    </c:when>

                                    <c:otherwise>

                                        <p class="profile-bio">

                                            <fmt:message
                                                key="estudantes.semMinibio"
                                            />

                                        </p>

                                    </c:otherwise>

                                </c:choose>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="participations-section">

            <div class="container">

                <div class="participations-heading reveal">

                    <div class="lab-kicker">

                        <fmt:message
                            key="estudanteDetalhe.participacoesKicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="estudanteDetalhe.participacoes"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="estudanteDetalhe.participacoesDescricao"
                        />

                    </p>

                </div>

                <c:choose>

                    <c:when test="${empty participacoes}">

                        <div class="participations-empty reveal">

                            <div class="participations-empty-icon">
                                🔧
                            </div>

                            <h3>

                                <fmt:message
                                    key="estudanteDetalhe.semParticipacoesTitulo"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="estudanteDetalhe.semParticipacoes"
                                />

                            </p>

                        </div>

                    </c:when>

                    <c:otherwise>

                        <div class="row g-4">

                            <c:forEach
                                var="participacao"
                                items="${participacoes}"
                            >

                                <div
                                    class="col-12 col-md-6 col-lg-4"
                                >

                                    <article
                                        class="participation-card reveal"
                                    >

                                        <div class="participation-type">

                                            <fmt:message
                                                key="estudanteDetalhe.atividade"
                                            />

                                        </div>

                                        <h3>

                                            <c:out
                                                value="${participacao.atividadeTitulo}"
                                            />

                                        </h3>

                                        <div class="participation-info">

                                            <span
                                                class="participation-info-label"
                                            >

                                                <fmt:message
                                                    key="participacao.funcao"
                                                />

                                            </span>

                                            <div
                                                class="participation-info-value"
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

                                        <div class="participation-info">

                                            <span
                                                class="participation-info-label"
                                            >

                                                <fmt:message
                                                    key="participacao.contribuicao"
                                                />

                                            </span>

                                            <div
                                                class="participation-info-value"
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

                                        <a
                                            class="participation-link"
                                            href="${pageContext.request.contextPath}/public/atividade?id=${participacao.atividadeId}"
                                        >

                                            <fmt:message
                                                key="geral.detalhes"
                                            />

                                            <span>
                                                →
                                            </span>

                                        </a>

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