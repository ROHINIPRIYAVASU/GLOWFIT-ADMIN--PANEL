package com.glowfit.servlet;

import com.glowfit.dao.FashionDAO;
import com.glowfit.model.Fashion;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/fashion")
public class FashionServlet extends HttpServlet {

    private FashionDAO fashionDAO = new FashionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String search = req.getParameter("search");
        List<Fashion> list = fashionDAO.getAllFashion();

        if (search != null && !search.trim().isEmpty()) {
            String q = search.toLowerCase();
            list.removeIf(f ->
                !f.getBodyType().toLowerCase().contains(q) &&
                !f.getOccasion().toLowerCase().contains(q)
            );
        }

        req.setAttribute("fashionList", list);
        req.setAttribute("search", search);
        req.getRequestDispatcher("/fashion.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String bodyType       = req.getParameter("bodyType");
            String occasion       = req.getParameter("occasion");
            String recommendation = req.getParameter("recommendation");

            if (bodyType != null && !bodyType.isEmpty()
                && occasion != null && !occasion.isEmpty()
                && recommendation != null && !recommendation.trim().isEmpty()) {

                Fashion f = new Fashion(0, bodyType, occasion, recommendation.trim());
                fashionDAO.addFashion(f);
                req.getSession().setAttribute("toast", "Fashion record added successfully!");
            } else {
                req.getSession().setAttribute("toastError", "Please fill all fields.");
            }

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            fashionDAO.deleteFashion(id);
            req.getSession().setAttribute("toast", "Record deleted.");
        }

        resp.sendRedirect("fashion");
    }
}