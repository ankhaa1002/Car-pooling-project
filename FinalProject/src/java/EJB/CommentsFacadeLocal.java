/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJB;

import Entities.Comments;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Ankhaa
 */
@Local
public interface CommentsFacadeLocal {

    void create(Comments comments);

    void edit(Comments comments);

    void remove(Comments comments);

    Comments find(Object id);

    List<Comments> findAll();

    List<Comments> findRange(int[] range);

    int count();
    
}
