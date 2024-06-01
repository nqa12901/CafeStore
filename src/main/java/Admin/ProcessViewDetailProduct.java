package Admin;

import dao.ProductDAO;
import model.ProductInOrder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "ProcessViewDetailProduct", value = "/ProcessViewDetailProduct")
public class ProcessViewDetailProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        try {
            ArrayList<ProductInOrder> listOrder =  ProductDAO.orderDetailList(orderId);
            request.setAttribute("productInOrder", listOrder);
            RequestDispatcher dis = request.getRequestDispatcher("pageAdmin/order-detail.jsp");
            dis.forward(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}