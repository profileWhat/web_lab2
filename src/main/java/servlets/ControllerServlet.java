package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String resetFlagParam = req.getParameter("reset-flag");
        if (resetFlagParam != null && resetFlagParam.equals("true"))
            getServletContext().getNamedDispatcher("ResetChangesServlet").forward(req, resp);
        else if (
                (req.getParameter("xValue") != null && req.getParameter("yValue") != null && req.getParameter("rValue") != null) ||
                        (req.getParameter("canvas-x") != null && req.getParameter("canvas-y") != null && req.getParameter("rValue") != null)
        ) getServletContext().getNamedDispatcher("AreaCheckServlet").forward(req, resp);
        else req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.getRequestDispatcher("/index.jsp").forward(req, res);
    }
}
