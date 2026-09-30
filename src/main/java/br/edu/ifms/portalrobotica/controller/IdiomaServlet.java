package br.edu.ifms.portalrobotica.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/idioma")
public class IdiomaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idioma = request.getParameter("lang");

        Locale locale;

        if ("en".equals(idioma)) {
            locale = new Locale("en", "US");

        } else if ("es".equals(idioma)) {
            locale = new Locale("es", "ES");

        } else if ("fr".equals(idioma)) {
            locale = new Locale("fr", "FR");

        } else {
            locale = new Locale("pt", "BR");
        }

        HttpSession session = request.getSession();

        session.setAttribute("locale", locale);

        String voltar = request.getHeader("referer");

        if (voltar != null) {
            response.sendRedirect(voltar);
        } else {
            response.sendRedirect(
                request.getContextPath() + "/"
            );
        }
    }
}