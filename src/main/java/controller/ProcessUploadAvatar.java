package controller;

import dao.UserDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet(name = "ProcessUploadAvatar", value = "/upload")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
        maxFileSize = 1024 * 1024 * 5,        // 10MB
        maxRequestSize = 1024 * 1024 * 10      // 50MB
)
public class ProcessUploadAvatar extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the real path of the root folder of the web application
        String uploadDirectory = "C:\\Users\\LynG\\Downloads\\csdl\\Web-project-BTL-CSDL--main\\src\\main\\webapp\\resources\\avatar";
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        try {
            // Delete old avatar
            File f = new File("C:\\Users\\LynG\\Downloads\\csdl\\Web-project-BTL-CSDL--main\\src\\main\\webapp\\resources\\avatar\\" + user.getAvatar_url());
            if (f.exists())
            {
                f.delete();
            }
            // Get all parts from the request
            for (Part part : request.getParts()) {
                // Generate a unique file name using UUID
                String fileName = UUID.randomUUID().toString() + "-" + extractFileName(part);
                // Write the file to the upload directory
                part.write(uploadDirectory + File.separator + fileName);
                System.out.println("File uploaded successfully: " + fileName);
                // Goi ham cap nhat anh dai dien cho user
                UserDao.updateAvatar(user.getId(), fileName);
            }
            // Cap nhat du lieu moi cho user
            user = UserDao.handleLogin(user.getUsername(), user.getPassword());
            session.setAttribute("user", user);
            response.sendRedirect("./info");
        } catch (IOException | ServletException e) {
            // Handle any exceptions related to file upload
            System.out.println("Error uploading file: " + e.getMessage());
            response.getWriter().println("Error uploading file: " + e.getMessage());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private String extractFileName(Part part) {
        // Get content-disposition header of the Part
        String contentDisp = part.getHeader("content-disposition");
        // Extract filename from content-disposition header
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                // Return the filename without path information
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
