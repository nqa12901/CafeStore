package dao;

import model.User;

import java.sql.*;

public class UserDao {
    public static Connection openConnection() {
        Connection conn = null;
        try {
            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
            System.out.println("Connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public static User handleLogin(String username, String password) {
        try (Connection c = openConnection()) {
            String select = String.format("select * from users where username = '%s' and password = '%s'", username, password);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("first_name"), rs.getString("last_name"), rs.getString("gender"), rs.getString("birthday"), rs.getString("number"), rs.getString("address"), rs.getString("avatar_url"));
            }
            return null;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public static boolean handleRegister(String username, String password, String first_name, String last_name) {
        try (Connection c = openConnection())
        {
            System.out.printf("Insert record into the table...\n");
            String select = String.format("INSERT INTO users VALUES (null, '%s', '%s', '%s', '%s', null, null, null, null, null, null)", username, password, first_name, last_name);
            Statement s = c.createStatement();
            int a = s.executeUpdate(select);
            return a != 0;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean checkUserExisted(String username) {
        try (Connection c = openConnection()) {
            String select = String.format("select * from users where username = '%s'", username);
            PreparedStatement ps = c.prepareStatement(select);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public static void updateAddressAndNumber(int id, String address, String number) throws SQLException {
        try (Connection c = openConnection()){
            String select = String.format("UPDATE users SET address = '%s', number = '%s' WHERE id = %d", address, number, id);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

    public static void updateAvatar(int id, String avatar_name) throws SQLException {
        try (Connection c = openConnection()){
            String select = String.format("UPDATE users SET avatar_url = '%s' WHERE id = %d", avatar_name, id);
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
