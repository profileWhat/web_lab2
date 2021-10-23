package servlets;

import Data.ResultTable;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String xValue;
        String yValue;
        String rValue;
        if (req.getParameter("canvas-x").equals("") || req.getParameter("canvas-y").equals("")) {
            xValue = req.getParameter("xValue");
            yValue = req.getParameter("yValue");
        } else {
            xValue = req.getParameter("canvas-x");
            yValue = req.getParameter("canvas-y");
        }
        rValue = req.getParameter("rValue");

        if (isValidData(xValue, yValue, rValue)) {
            double x = Double.parseDouble(xValue);
            double y = Double.parseDouble(yValue);
            double r = Double.parseDouble(rValue);
            boolean hit = checkHit(x, y, r);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
            Date date = new Date(System.currentTimeMillis());
            String currentTime = formatter.format(date);
            ResultTable result = new ResultTable(Math.round(x * 100) / 100D, Math.round(y * 100) / 100D, r, currentTime, hit);
            ArrayList<ResultTable> results;
            if (req.getSession().getAttribute("results") == null) {
                results = new ArrayList<>();
            } else {
                results = (ArrayList<ResultTable>) req.getSession().getAttribute("results");
            }
            results.add(result);
            req.getSession().setAttribute("results", results);
        }
        resp.sendRedirect("/web_lab2-1.0-SNAPSHOT");
    }

    private boolean isValidData(String xValue, String yValue, String rValue) {
        try {
            double x = Double.parseDouble(xValue);
            double y = Double.parseDouble(yValue);
            double r = Double.parseDouble(rValue);
            if (x <= -5 || x >= 5) return false;
            if (y < -2 || y > 2) return false;
            if (r < 1 || r > 3) return false;
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }

    private boolean checkHit(double x, double y, double r) {
        return  (x >= 0 && x <= r/2 && y <= 0 && y >= r*(-1)) ||
                (x <= 0 && y <= 0 && (Math.sqrt(x*x + y*y)) <= Math.abs(r)) && x >= r/2*(-1) && y >= r/2*(-1) ||
                (x <= 0 && y >= 0 && (x/2 + r/2) >= y && y <= r/2 && x >= r*(-1));
    }
}
