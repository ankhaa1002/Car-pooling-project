/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJB;

import Entities.Posts;
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
public class PostsFacade extends AbstractFacade<Posts> implements PostsFacadeLocal {

    @PersistenceContext(unitName = "FinalProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PostsFacade() {
        super(Posts.class);
    }

    @Override
    public List<Posts> findAll() {
        Query findAll = em.createNamedQuery("Posts.findAll");
        List<Posts> employees = findAll.getResultList();

        return employees;
    }

    @Override
    public List<Posts> findByPostType(int postType) {
        Query findByPosttype = em.createNamedQuery("Posts.findByPosttype");
        findByPosttype.setParameter("posttype", postType);
        findByPosttype.setFirstResult((1 - 1) * 25);
        findByPosttype.setMaxResults(25);
        List<Posts> employees = findByPosttype.getResultList();

        return employees;
    }

}
