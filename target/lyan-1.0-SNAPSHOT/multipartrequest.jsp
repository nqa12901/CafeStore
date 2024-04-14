<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <%
            // Maximum file size allowed (5MB)
            int maxFileSize = 5 * 1024 * 1024; // 5MB in bytes

            try {
                // Uses MultipartRequest from oreilly library.
                // Accepts request object, the target location to save, and max file size
                MultipartRequest m = new MultipartRequest(request, "C:\\Users\\LynG\\Downloads\\apache-tomcat-9.0.86-windows-x64\\apache-tomcat-9.0.86\\webapps\\lyan_war_exploded\\data", maxFileSize);

                // Get the uploaded file's path
                HttpServletRequest req = request;
                Enumeration<String> fileParameterNames = req.getParameterNames();
                while (fileParameterNames.hasMoreElements()) {
                    String fileParameterName = fileParameterNames.nextElement();
                    String fileName = m.getFilesystemName(fileParameterName);
                    // Print the path to the uploaded file
                    System.out.println("File uploaded successfully. Path: " + fileName);
                }
            } catch (IOException e) {
                // Handle any exceptions related to file upload
                System.out.println("Error uploading file: " + e.getMessage());
            }
        %>
    </body>
</html>
