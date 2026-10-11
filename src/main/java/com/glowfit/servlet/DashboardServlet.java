package com.glowfit.servlet;

import com.glowfit.dao.FashionDAO;
import com.glowfit.dao.SkincareDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private FashionDAO  fashionDAO  = new FashionDAO();
    private SkincareDAO skincareDAO = new SkincareDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int fashionCount  = fashionDAO.getCount();
        int skincareCount = skincareDAO.getCount();
        int totalCount    = fashionCount + skincareCount;

        req.setAttribute("fashionCount",  fashionCount);
        req.setAttribute("skincareCount", skincareCount);
        req.setAttribute("totalCount",    totalCount);

        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
