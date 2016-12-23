/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.UsersFacadeLocal;
import Entities.Users;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ankhaa
 */
public class LoginServlet extends HttpServlet {

    @EJB
    private UsersFacadeLocal uf;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request, response);
        } else {
            response.sendRedirect("/FinalProject");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

        String check = request.getParameter("check");

        if (check.equals("Log In")) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            List<Users> users = uf.findAll();

            for (Users user : users) {
                if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);

                    RequestDispatcher view = request.getRequestDispatcher("Main");
                    view.forward(request, response);
                }
            }
            
            RequestDispatcher view = request.getRequestDispatcher("login.jsp");
            request.setAttribute("error", "Email or password doesn't match!");
            view.forward(request, response);

        } else {
            String fullName = request.getParameter("fullName");
            Integer gender = request.getParameter("gender").equals("male") ? 0 : 1;
            String state = request.getParameter("state");
            String city = request.getParameter("city");
            String street = request.getParameter("street");
            Integer zip = Integer.parseInt(request.getParameter("zip"));
            Integer birthYear = Integer.parseInt(request.getParameter("birthYear"));
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Users user = new Users();

            user.setFullname(fullName);
            user.setGender(gender);
            user.setState(state);
            user.setCity(city);
            user.setStreet(street);
            user.setZipcode(zip);
            user.setBirthyear(birthYear);
            user.setEmail(email);
            user.setPassword(password);
            user.setDatecreated(new Date());

            Calendar cal = Calendar.getInstance();
            cal.setTime(new Date());
            if (cal.get(Calendar.YEAR) - birthYear <= 18) {
                RequestDispatcher view = request.getRequestDispatcher("login.jsp");
                request.setAttribute("error", "Due to safety, we are not allowed to register customers below 18 years old!");
                view.forward(request, response);
            } else {

                uf.create(user);

                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                RequestDispatcher view = request.getRequestDispatcher("Main");
                view.forward(request, response);
            }
        }
    }

}
