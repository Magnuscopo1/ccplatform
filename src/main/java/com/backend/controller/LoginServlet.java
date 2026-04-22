package com.backend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backend.dao.UserDAO;
import com.common.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, pass);

        if (user != null) {
            // Create session and store user object
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Redirect to the premium home page
            response.sendRedirect("index.jsp");
        } else {
            // Redirect back to login with error message
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}