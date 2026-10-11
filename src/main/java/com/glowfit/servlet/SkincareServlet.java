package com.glowfit.servlet;

import com.glowfit.dao.SkincareDAO;
import com.glowfit.model.Skincare;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/skincare")
public class SkincareServlet extends HttpServlet {

    private SkincareDAO skincareDAO = new SkincareDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String search = req.getParameter("search");
        List<Skincare> list = skincareDAO.getAllSkincare();

        if (search != null && !search.trim().isEmpty()) {
            String q = search.toLowerCase();
            list.removeIf(s ->
                !s.getSkinType().toLowerCase().contains(q)
            );
        }

        req.setAttribute("skincareList", list);
        req.setAttribute("search", search);
        req.getRequestDispatcher("/skincare.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String skinType    = req.getParameter("skinType");
            String routine     = req.getParameter("routine");
            String cleanser    = req.getParameter("cleanser");
            String moisturizer = req.getParameter("moisturizer");

            if (skinType != null && !skinType.isEmpty()
                && routine != null && !routine.isEmpty()) {

                Skincare s = new Skincare(
                    0,
                    skinType,
                    routine,
                    cleanser    != null ? cleanser.trim()    : "",
                    moisturizer != null ? moisturizer.trim() : ""
                );
                skincareDAO.addSkincare(s);
                req.getSession().setAttribute("toast", "Skincare record added successfully!");
            } else {
                req.getSession().setAttribute("toastError", "Please fill all required fields.");
            }

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            skincareDAO.deleteSkincare(id);
            req.getSession().setAttribute("toast", "Record deleted.");
        }

        resp.sendRedirect("skincare");
    }
}
