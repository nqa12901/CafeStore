package controller;


import dao.OrderDAO;
import model.Order;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "ProcessUserOrders", value = "/user-order")
public class ProcessUserOrders extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        try {
            ArrayList<Order> orderList = OrderDAO.ordersList(user.getId());
            session.setAttribute("orderList", orderList);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher rq = request.getRequestDispatcher("user_order.jsp");
        rq.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}