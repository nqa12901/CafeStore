// Currently, cart only work in session, delete when close browser


package controller;

import dao.OrderDAO;
import dao.UserDao;
import model.ProductInCart;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


@WebServlet(name = "ProcessCheckout", value = "/cart")
public class ProcessCheckout extends HttpServlet {

    protected void processOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ArrayList<ProductInCart> cart = (ArrayList<ProductInCart>) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        int userId = user.getId();
        int totalMoney = 0;
        for (ProductInCart prod : cart)
        {
            totalMoney += prod.getQuantity() * prod.getPrice();
        }
        String first_name = request.getParameter("firstName");
        String last_name = request.getParameter("lastName");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String saveInfo = request.getParameter("save-info");
        String paymentMethod = "Ship COD";
        String status = "Processing";
        String shipping_method = request.getParameter("shippingMethod");
        String order_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        System.out.println(userId + " / " + first_name + " / " + last_name +" / " + email + " / " + number + " / " + address + " / " + order_date + " / " + status + " / " + note + " / " + totalMoney + " / " + shipping_method + " / " + paymentMethod + " / " + saveInfo);
        int orderId = OrderDAO.addOrder(userId, totalMoney, first_name, last_name, email, number, address, order_date, status, note, shipping_method, paymentMethod);
        System.out.println(orderId);
        for (ProductInCart prod : cart)
        {
            OrderDAO.addOrderDetail(orderId, prod.getId(), prod.getPrice(), prod.getQuantity(), prod.getPrice() * prod.getQuantity(), prod.getOption());
        }
        if (saveInfo != null)
        {
            UserDao.updateAddressAndNumber(userId, address, number);
            user = UserDao.handleLogin(user.getUsername(), user.getPassword());
            session.setAttribute("user", user);
        }
        RequestDispatcher rq = request.getRequestDispatcher("./orderSuccess.jsp");
        rq.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rq = request.getRequestDispatcher("checkout.jsp");
        rq.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        try {
            processOrder(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}