/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.LikesFacadeLocal;
import EJB.PostsFacadeLocal;
import EJB.UsersFacadeLocal;
import Entities.Likes;
import Entities.Posts;
import Entities.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankhaa
 */
public class LikeServlet extends HttpServlet {

    @EJB
    private UsersFacadeLocal ufl;
    @EJB
    private PostsFacadeLocal pfl;
    @EJB
    private LikesFacadeLocal lfl;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer postId = Integer.parseInt(request.getParameter("postId"));

        Users user = ufl.find(userId);
        Posts posts = pfl.find(postId);

        List<Likes> likess = lfl.findByUseridAndPostid(user, posts);

        if (likess.size() > 0) {
            Likes l = likess.get(0);
            posts.getLikesList().remove(l);
            
            pfl.edit(posts);
            
            lfl.remove(l);
        } else {
            Likes likes = new Likes();
            likes.setUserid(user);
            likes.setPostid(posts);
            likes.setDatecreated(new Date());

            lfl.create(likes);

            posts.getLikesList().add(likes);
            pfl.edit(posts);
        }
    }
}
