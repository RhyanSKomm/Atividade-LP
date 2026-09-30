<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <fmt:message key="titulo.sobre" />
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
        href="${pageContext.request.contextPath}/resources/css/public-sobre.css"
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
                            class="nav-link active"
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

        <section class="about-hero">

            <div class="container">

                <div class="row align-items-center g-5">

                    <div class="col-12 col-lg-7">

                        <div class="lab-kicker">

                            <fmt:message
                                key="sobre.kicker"
                            />

                        </div>

                        <h1 class="about-title">

                            <fmt:message
                                key="sobre.hero.parte1"
                            />

                            <span class="accent">

                                <fmt:message
                                    key="sobre.hero.parte2"
                                />

                            </span>

                        </h1>

                        <p class="about-description">

                            <fmt:message
                                key="sobre.hero.descricao"
                            />

                        </p>

                    </div>

                    <div class="col-12 col-lg-5">

                        <div class="about-visual reveal">

                            <div class="about-board">

                                <div
                                    class="about-board-tape"
                                ></div>

                                <div
                                    class="about-board-content"
                                >

                                    <div
                                        class="about-board-code"
                                    >
                                        LAB / IFMS-CG
                                    </div>

                                    <h2>

                                        <fmt:message
                                            key="sobre.board.titulo"
                                        />

                                    </h2>

                                    <div
                                        class="about-board-flow"
                                    >

                                        <div
                                            class="about-flow-item"
                                        >

                                            <div
                                                class="about-flow-icon"
                                            >
                                                💡
                                            </div>

                                            <div
                                                class="about-flow-text"
                                            >

                                                <strong>

                                                    <fmt:message
                                                        key="sobre.board.ideia"
                                                    />

                                                </strong>

                                                <span>

                                                    <fmt:message
                                                        key="sobre.board.ideiaDescricao"
                                                    />

                                                </span>

                                            </div>

                                        </div>

                                        <div
                                            class="about-flow-item"
                                        >

                                            <div
                                                class="about-flow-icon"
                                            >
                                                🔧
                                            </div>

                                            <div
                                                class="about-flow-text"
                                            >

                                                <strong>

                                                    <fmt:message
                                                        key="sobre.board.construcao"
                                                    />

                                                </strong>

                                                <span>

                                                    <fmt:message
                                                        key="sobre.board.construcaoDescricao"
                                                    />

                                                </span>

                                            </div>

                                        </div>

                                        <div
                                            class="about-flow-item"
                                        >

                                            <div
                                                class="about-flow-icon"
                                            >
                                                ⌨
                                            </div>

                                            <div
                                                class="about-flow-text"
                                            >

                                                <strong>

                                                    <fmt:message
                                                        key="sobre.board.programacao"
                                                    />

                                                </strong>

                                                <span>

                                                    <fmt:message
                                                        key="sobre.board.programacaoDescricao"
                                                    />

                                                </span>

                                            </div>

                                        </div>

                                        <div
                                            class="about-flow-item"
                                        >

                                            <div
                                                class="about-flow-icon"
                                            >
                                                ⚡
                                            </div>

                                            <div
                                                class="about-flow-text"
                                            >

                                                <strong>

                                                    <fmt:message
                                                        key="sobre.board.teste"
                                                    />

                                                </strong>

                                                <span>

                                                    <fmt:message
                                                        key="sobre.board.testeDescricao"
                                                    />

                                                </span>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="about-section">

            <div class="container">

                <div
                    class="about-manifesto reveal"
                >

                    <div
                        class="about-manifesto-content"
                    >

                        <div
                            class="lab-kicker"
                            style="color: #8ce6b0;"
                        >

                            <fmt:message
                                key="sobre.manifesto.kicker"
                            />

                        </div>

                        <h2>

                            <fmt:message
                                key="sobre.manifesto.titulo"
                            />

                        </h2>

                        <p>

                            <fmt:message
                                key="sobre.manifesto.descricao"
                            />

                        </p>

                    </div>

                </div>

            </div>

        </section>

        <section class="about-pillars">

            <div class="container">

                <div
                    class="about-section-heading reveal"
                >

                    <div class="lab-kicker">

                        <fmt:message
                            key="sobre.atuacao.kicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="sobre.atuacao.titulo"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="sobre.atuacao.descricao"
                        />

                    </p>

                </div>

                <div class="row g-4">

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="about-pillar reveal h-100"
                        >

                            <div
                                class="about-pillar-icon"
                            >
                                🤖
                            </div>

                            <h3>

                                <fmt:message
                                    key="sobre.pilar.projetos"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="sobre.pilar.projetosDescricao"
                                />

                            </p>

                        </article>

                    </div>

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="about-pillar reveal h-100"
                        >

                            <div
                                class="about-pillar-icon"
                            >
                                🧠
                            </div>

                            <h3>

                                <fmt:message
                                    key="sobre.pilar.aprendizado"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="sobre.pilar.aprendizadoDescricao"
                                />

                            </p>

                        </article>

                    </div>

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="about-pillar reveal h-100"
                        >

                            <div
                                class="about-pillar-icon"
                            >
                                🏆
                            </div>

                            <h3>

                                <fmt:message
                                    key="sobre.pilar.experiencias"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="sobre.pilar.experienciasDescricao"
                                />

                            </p>

                        </article>

                    </div>

                </div>

            </div>

        </section>

        <section class="about-section">

            <div class="container">

                <div
                    class="about-memory reveal"
                >

                    <div class="lab-kicker">

                        <fmt:message
                            key="sobre.memoria.kicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="sobre.memoria.titulo"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="sobre.memoria.descricao"
                        />

                    </p>

                    <div
                        class="about-memory-flow"
                    >

                        <div class="memory-step">

                            <div
                                class="memory-step-icon"
                            >
                                👤
                            </div>

                            <strong>

                                <fmt:message
                                    key="sobre.memoria.pessoas"
                                />

                            </strong>

                            <small>

                                <fmt:message
                                    key="sobre.memoria.pessoasDescricao"
                                />

                            </small>

                        </div>

                        <div class="memory-step">

                            <div
                                class="memory-step-icon"
                            >
                                🔧
                            </div>

                            <strong>

                                <fmt:message
                                    key="sobre.memoria.atividades"
                                />

                            </strong>

                            <small>

                                <fmt:message
                                    key="sobre.memoria.atividadesDescricao"
                                />

                            </small>

                        </div>

                        <div class="memory-step">

                            <div
                                class="memory-step-icon"
                            >
                                🗓
                            </div>

                            <strong>

                                <fmt:message
                                    key="sobre.memoria.periodos"
                                />

                            </strong>

                            <small>

                                <fmt:message
                                    key="sobre.memoria.periodosDescricao"
                                />

                            </small>

                        </div>

                        <div class="memory-step">

                            <div
                                class="memory-step-icon"
                            >
                                ●
                            </div>

                            <strong>

                                <fmt:message
                                    key="sobre.memoria.historia"
                                />

                            </strong>

                            <small>

                                <fmt:message
                                    key="sobre.memoria.historiaDescricao"
                                />

                            </small>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="about-contact">

            <div class="container">

                <div
                    class="about-contact-box reveal"
                >

                    <div
                        class="lab-kicker"
                        style="color: #8ce6b0;"
                    >

                        <fmt:message
                            key="sobre.contato.kicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="sobre.contato.titulo"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="sobre.contato.descricao"
                        />

                    </p>

                    <a
                        class="about-instagram"
                        href="https://www.instagram.com/robotican.cg/"
                        target="_blank"
                    >

                        @robotican.cg

                        <span>
                            →
                        </span>

                    </a>

                </div>

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