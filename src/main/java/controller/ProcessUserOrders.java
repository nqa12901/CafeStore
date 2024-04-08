package controller;


import dao.OrderDAO;
import model.Order;
import model.ProductInOrder;
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

    protected ArrayList<Order> orderList;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String orderId = request.getParameter("id");
        String ordinalNumber = request.getParameter("ordinal-number");
        if (orderId == null) {
            try {
                orderList = OrderDAO.ordersList(user.getId());
                session.setAttribute("orderList", orderList);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            RequestDispatcher rq = request.getRequestDispatcher("user_order.jsp");
            rq.forward(request, response);
        }
        else
        {
            ArrayList<ProductInOrder> productInOrders;
            try {
                productInOrders = OrderDAO.orderDetailList(Integer.parseInt(orderId));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            Order order = orderList.get(Integer.parseInt(ordinalNumber));
            request.setAttribute("order", order);
            request.setAttribute("productInOrder", productInOrders);
            request.setAttribute("orderId", orderId);
            request.setAttribute("ordinal-number", ordinalNumber);
            RequestDispatcher rq = request.getRequestDispatcher("one_order_detail.jsp");
            rq.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ArrayList<ProductInOrder> productInOrders;
        String orderId = request.getParameter("id");
        String ordinalNumber = request.getParameter("ordinal-number");
        try {
            productInOrders = OrderDAO.orderDetailList(Integer.parseInt(orderId));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Order order = orderList.get(Integer.parseInt(ordinalNumber));
        request.setAttribute("order", order);
        request.setAttribute("productInOrder", productInOrders);
        request.setAttribute("orderId", orderId);
        request.setAttribute("ordinal-number", ordinalNumber);
        RequestDispatcher rq = request.getRequestDispatcher("one_order_detail.jsp");
        rq.forward(request, response);
    }
}