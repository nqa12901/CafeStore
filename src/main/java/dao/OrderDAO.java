package dao;

import model.Order;

import java.sql.*;
import java.util.ArrayList;

public class OrderDAO {
    public static Connection openConnection() {
        Connection conn = null;
        try {
            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
            System.out.println("Connected successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void addOrderDetail(int orderId, int productId, int price, int quantity, int totalMoney, String size) throws SQLException {
        try (Connection c = openConnection())
        {
            String add = String.format("insert into order_details value(null,'%d','%d','%d','%d','%d','%s')", orderId, productId, price, quantity, totalMoney, size);
            PreparedStatement stm = c.prepareStatement(add);
            stm.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int addOrder(int userId, int totalMoney, String firstName, String lastName, String email, String phoneNumber, String address, String orderDate, String status, String note, String shippingMethod, String paymentMethod) throws SQLException {
        int orderId = -1;
        try (Connection c = openConnection()) {
            String add = String.format("insert into orders value (null,'%d','%s','%s','%s','%s','%s','%s','%s','%s','%d','%s','%s')", userId, firstName, lastName, email, phoneNumber, address, orderDate, status, note, totalMoney, shippingMethod, paymentMethod);
            String selectLastInsertIdQuery = "SELECT LAST_INSERT_ID()";
            Statement stm = c.createStatement();
            stm.executeUpdate(add);
            ResultSet rs = stm.executeQuery(selectLastInsertIdQuery);
            while (rs.next()) {
                orderId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderId;
    }

    public static ArrayList<Order> ordersList(int userId) throws SQLException {
        ArrayList<Order> ordersList = new ArrayList<>();
        try (Connection c = openConnection()) {
            String get = String.format("select * from orders where user_id = %d", userId);
            PreparedStatement ps = c.prepareStatement(get);
            ResultSet rs = ps.executeQuery();
            while (rs.next())
            {
                ordersList.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11), rs.getString(12), rs.getString(13)));
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return ordersList;
    }
}
