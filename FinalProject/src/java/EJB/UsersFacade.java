/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJB;

import Entities.Users;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ankhaa
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> implements UsersFacadeLocal {
    @PersistenceContext(unitName = "FinalProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }
    
}
