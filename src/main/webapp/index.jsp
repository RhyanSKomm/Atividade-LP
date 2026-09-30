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
        href="${pageContext.request.contextPath}/resources/css/public-home.css"
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
                            class="nav-link active"
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

        <section class="home-hero">

            <div class="container">

                <div class="row align-items-center g-5">

                    <div class="col-12 col-lg-6">

                        <div class="lab-kicker">

                            <fmt:message
                                key="home.kicker"
                            />

                        </div>

                        <h1 class="home-title">

                            <fmt:message
                                key="home.hero.parte1"
                            />

                            <span class="accent">

                                <fmt:message
                                    key="home.hero.parte2"
                                />

                            </span>

                        </h1>

                        <p class="home-description">

                            <fmt:message
                                key="home.hero.descricao"
                            />

                        </p>

                        <div class="home-actions">

                            <a
                                class="home-button home-button-primary"
                                href="${pageContext.request.contextPath}/public/atividades"
                            >

                                <fmt:message
                                    key="home.hero.atividades"
                                />

                                <span>
                                    →
                                </span>

                            </a>

                            <a
                                class="home-button home-button-secondary"
                                href="${pageContext.request.contextPath}/public/estudantes"
                            >

                                <fmt:message
                                    key="home.hero.estudantes"
                                />

                            </a>

                        </div>

                    </div>

                    <div class="col-12 col-lg-6">

                        <div class="home-bench">

                            <div
                                class="home-bench-board"
                            ></div>

                            <div
                                class="home-bench-tape"
                            ></div>

                            <div
                                class="home-bench-label home-bench-label-one"
                            >
                                BANCADA / IFMS-CG
                                <br>
                                TESTAR → AJUSTAR → REPETIR
                            </div>

                            <div
                                class="home-bench-label home-bench-label-two"
                            >
                                STATUS: EM MOVIMENTO
                            </div>

                            <span
                                class="home-bench-led home-bench-led-one"
                            ></span>

                            <span
                                class="home-bench-led home-bench-led-two"
                            ></span>

                            <svg
                                class="home-bench-svg"
                                viewBox="0 0 700 560"
                                aria-label="Bancada de robótica"
                            >

                                <rect
                                    x="70"
                                    y="170"
                                    width="280"
                                    height="175"
                                    rx="16"
                                    fill="#27384c"
                                />

                                <rect
                                    x="88"
                                    y="188"
                                    width="244"
                                    height="138"
                                    rx="8"
                                    fill="#eff7f2"
                                />

                                <rect
                                    x="122"
                                    y="220"
                                    width="128"
                                    height="10"
                                    rx="5"
                                    fill="#198754"
                                />

                                <rect
                                    x="122"
                                    y="245"
                                    width="180"
                                    height="8"
                                    rx="4"
                                    fill="#8fb3d5"
                                />

                                <rect
                                    x="122"
                                    y="268"
                                    width="160"
                                    height="8"
                                    rx="4"
                                    fill="#c0ccd5"
                                />

                                <rect
                                    x="122"
                                    y="291"
                                    width="105"
                                    height="8"
                                    rx="4"
                                    fill="#f08a35"
                                />

                                <path
                                    d="M45 350h330l-30 34H75z"
                                    fill="#172033"
                                />

                                <g
                                    transform="translate(430 245)"
                                >

                                    <rect
                                        x="0"
                                        y="42"
                                        width="150"
                                        height="70"
                                        rx="16"
                                        fill="#e6edf3"
                                        stroke="#173b68"
                                        stroke-width="5"
                                    />

                                    <circle
                                        cx="28"
                                        cy="117"
                                        r="25"
                                        fill="#172033"
                                    />

                                    <circle
                                        cx="125"
                                        cy="117"
                                        r="25"
                                        fill="#172033"
                                    />

                                    <circle
                                        cx="28"
                                        cy="117"
                                        r="11"
                                        fill="#94a8b8"
                                    />

                                    <circle
                                        cx="125"
                                        cy="117"
                                        r="11"
                                        fill="#94a8b8"
                                    />

                                    <rect
                                        x="35"
                                        y="0"
                                        width="82"
                                        height="58"
                                        rx="12"
                                        fill="#198754"
                                    />

                                    <circle
                                        cx="55"
                                        cy="18"
                                        r="7"
                                        fill="#f6c945"
                                    />

                                    <circle
                                        cx="96"
                                        cy="18"
                                        r="7"
                                        fill="#f6c945"
                                    />

                                    <rect
                                        x="50"
                                        y="36"
                                        width="52"
                                        height="8"
                                        rx="4"
                                        fill="#d6f3e2"
                                    />

                                    <path
                                        d="M76 0v-34"
                                        stroke="#173b68"
                                        stroke-width="7"
                                        stroke-linecap="round"
                                    />

                                    <circle
                                        cx="76"
                                        cy="-43"
                                        r="10"
                                        fill="#f08a35"
                                    />

                                </g>

                                <g
                                    transform="translate(335 390)"
                                >

                                    <rect
                                        width="185"
                                        height="78"
                                        rx="12"
                                        fill="#2f7f58"
                                    />

                                    <rect
                                        x="22"
                                        y="15"
                                        width="55"
                                        height="35"
                                        rx="5"
                                        fill="#173b68"
                                    />

                                    <circle
                                        cx="105"
                                        cy="25"
                                        r="6"
                                        fill="#f6c945"
                                    />

                                    <circle
                                        cx="127"
                                        cy="25"
                                        r="6"
                                        fill="#f08a35"
                                    />

                                    <circle
                                        cx="149"
                                        cy="25"
                                        r="6"
                                        fill="#d63b32"
                                    />

                                    <path
                                        d="M88 54h72"
                                        stroke="#c8f0da"
                                        stroke-width="4"
                                        stroke-dasharray="8 6"
                                    />

                                </g>

                                <path
                                    d="M420 405 C390 360, 360 350, 330 365"
                                    fill="none"
                                    stroke="#d63b32"
                                    stroke-width="7"
                                />

                                <path
                                    d="M468 405 C455 350, 525 345, 535 300"
                                    fill="none"
                                    stroke="#275d8f"
                                    stroke-width="7"
                                />

                                <path
                                    d="M385 442 C300 468, 250 444, 215 385"
                                    fill="none"
                                    stroke="#f6c945"
                                    stroke-width="7"
                                />

                                <g
                                    transform="translate(540 410)"
                                >

                                    <path
                                        d="M0 0l55 55"
                                        stroke="#7b8793"
                                        stroke-width="12"
                                        stroke-linecap="round"
                                    />

                                    <circle
                                        cx="60"
                                        cy="60"
                                        r="17"
                                        fill="#f08a35"
                                    />

                                </g>

                            </svg>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="home-section">

            <div class="container">

                <div
                    class="home-section-heading reveal"
                >

                    <div class="lab-kicker">

                        <fmt:message
                            key="home.explorar.kicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="home.explorar.titulo"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="home.explorar.descricao"
                        />

                    </p>

                </div>

                <div class="row g-4">

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="home-access-card reveal h-100"
                        >

                            <span
                                class="home-access-number"
                            >
                                01 / SOBRE
                            </span>

                            <div
                                class="home-access-icon"
                            >
                                🔬
                            </div>

                            <h3>

                                <fmt:message
                                    key="home.sobre.titulo"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="home.sobre.descricao"
                                />

                            </p>

                            <a
                                class="home-access-link"
                                href="${pageContext.request.contextPath}/public/public-sobre.jsp"
                            >

                                <fmt:message
                                    key="home.sobre.acao"
                                />

                                <span>
                                    →
                                </span>

                            </a>

                        </article>

                    </div>

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="home-access-card reveal h-100"
                        >

                            <span
                                class="home-access-number"
                            >
                                02 / PESSOAS
                            </span>

                            <div
                                class="home-access-icon"
                            >
                                👥
                            </div>

                            <h3>

                                <fmt:message
                                    key="home.estudantes.titulo"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="home.estudantes.descricao"
                                />

                            </p>

                            <a
                                class="home-access-link"
                                href="${pageContext.request.contextPath}/public/estudantes"
                            >

                                <fmt:message
                                    key="home.estudantes.acao"
                                />

                                <span>
                                    →
                                </span>

                            </a>

                        </article>

                    </div>

                    <div
                        class="col-12 col-md-4"
                    >

                        <article
                            class="home-access-card reveal h-100"
                        >

                            <span
                                class="home-access-number"
                            >
                                03 / ATIVIDADES
                            </span>

                            <div
                                class="home-access-icon"
                            >
                                🤖
                            </div>

                            <h3>

                                <fmt:message
                                    key="home.atividades.titulo"
                                />

                            </h3>

                            <p>

                                <fmt:message
                                    key="home.atividades.descricao"
                                />

                            </p>

                            <a
                                class="home-access-link"
                                href="${pageContext.request.contextPath}/public/atividades"
                            >

                                <fmt:message
                                    key="home.atividades.acao"
                                />

                                <span>
                                    →
                                </span>

                            </a>

                        </article>

                    </div>

                </div>

            </div>

        </section>

        <section class="home-section">

            <div class="container">

                <div class="home-process reveal">

                    <div class="home-process-content">

                        <div
                            class="lab-kicker"
                            style="color: #8ce6b0;"
                        >

                            <fmt:message
                                key="home.processo.kicker"
                            />

                        </div>

                        <h2>

                            <fmt:message
                                key="home.processo.titulo"
                            />

                        </h2>

                        <p
                            class="home-process-description"
                        >

                            <fmt:message
                                key="home.processo.descricao"
                            />

                        </p>

                        <div
                            class="home-process-track"
                        >

                            <span
                                class="home-process-pulse"
                            ></span>

                            <div
                                class="home-process-step"
                            >

                                <div
                                    class="home-process-icon"
                                >
                                    ✎
                                </div>

                                <strong>

                                    <fmt:message
                                        key="home.processo.ideia"
                                    />

                                </strong>

                                <small>

                                    <fmt:message
                                        key="home.processo.ideiaDescricao"
                                    />

                                </small>

                            </div>

                            <div
                                class="home-process-step"
                            >

                                <div
                                    class="home-process-icon"
                                >
                                    🔧
                                </div>

                                <strong>

                                    <fmt:message
                                        key="home.processo.montagem"
                                    />

                                </strong>

                                <small>

                                    <fmt:message
                                        key="home.processo.montagemDescricao"
                                    />

                                </small>

                            </div>

                            <div
                                class="home-process-step"
                            >

                                <div
                                    class="home-process-icon"
                                >
                                    ⌨
                                </div>

                                <strong>

                                    <fmt:message
                                        key="home.processo.codigo"
                                    />

                                </strong>

                                <small>

                                    <fmt:message
                                        key="home.processo.codigoDescricao"
                                    />

                                </small>

                            </div>

                            <div
                                class="home-process-step"
                            >

                                <div
                                    class="home-process-icon"
                                >
                                    ⚡
                                </div>

                                <strong>

                                    <fmt:message
                                        key="home.processo.teste"
                                    />

                                </strong>

                                <small>

                                    <fmt:message
                                        key="home.processo.testeDescricao"
                                    />

                                </small>

                            </div>

                            <div
                                class="home-process-step"
                            >

                                <div
                                    class="home-process-icon"
                                >
                                    ✓
                                </div>

                                <strong>

                                    <fmt:message
                                        key="home.processo.registro"
                                    />

                                </strong>

                                <small>

                                    <fmt:message
                                        key="home.processo.registroDescricao"
                                    />

                                </small>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <section class="home-section">

            <div class="container">

                <div class="home-memory reveal">

                    <div class="lab-kicker">

                        <fmt:message
                            key="home.memoria.kicker"
                        />

                    </div>

                    <h2>

                        <fmt:message
                            key="home.memoria.titulo"
                        />

                    </h2>

                    <p>

                        <fmt:message
                            key="home.memoria.descricao"
                        />

                    </p>

                    <div class="home-memory-links">

                        <a
                            class="home-memory-link"
                            href="${pageContext.request.contextPath}/public/estudantes"
                        >

                            <fmt:message
                                key="menu.estudantes"
                            />

                            →

                        </a>

                        <a
                            class="home-memory-link"
                            href="${pageContext.request.contextPath}/public/atividades"
                        >

                            <fmt:message
                                key="menu.atividades"
                            />

                            →

                        </a>

                        <a
                            class="home-memory-link"
                            href="${pageContext.request.contextPath}/public/public-sobre.jsp"
                        >

                            <fmt:message
                                key="menu.sobre"
                            />

                            →

                        </a>

                    </div>

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