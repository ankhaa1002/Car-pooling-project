/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJB;

import Entities.Likes;
import Entities.Posts;
import Entities.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Ankhaa
 */
@Stateless
public class LikesFacade extends AbstractFacade<Likes> implements LikesFacadeLocal {
    @PersistenceContext(unitName = "FinalProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public LikesFacade() {
        super(Likes.class);
    }

    @Override
    public List<Likes> findByUseridAndPostid(Users user, Posts post) {
        Query findByPosttype = em.createNamedQuery("Likes.findByUseridAndPostid");
        findByPosttype.setParameter("userid", user);
        findByPosttype.setParameter("postid", post);
        List<Likes> likes = findByPosttype.getResultList();
        
        return likes;
    }
    
}
