/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import EJB.CommentsFacadeLocal;
import EJB.PostsFacadeLocal;
import EJB.UsersFacadeLocal;
import Entities.Comments;
import Entities.Posts;
import Entities.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ankhaa
 */
public class CommentServlet extends HttpServlet {

    @EJB
    private UsersFacadeLocal ufl;
    @EJB
    private PostsFacadeLocal pfl;
    @EJB
    private CommentsFacadeLocal cfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        Integer postId = Integer.parseInt(request.getParameter("postId"));
        String comment = request.getParameter("comment");
        
        Users user = ufl.find(userId);
        Posts posts = pfl.find(postId);
        
        Comments cmnt = new Comments();
        cmnt.setComment(comment);
        cmnt.setPostid(posts);
        cmnt.setUserid(user);
        cmnt.setDatecreated(new Date());
        
        cfl.create(cmnt);
        
        posts.getCommentsList().add(cmnt);
        pfl.edit(posts);
    }


}
