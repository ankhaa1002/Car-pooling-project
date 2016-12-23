/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EJB;

import Entities.Posts;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Ankhaa
 */
@Local
public interface PostsFacadeLocal {

    void create(Posts posts);

    void edit(Posts posts);

    void remove(Posts posts);

    Posts find(Object id);

    List<Posts> findByPostType(int postType);
    
    List<Posts> findAll();

    List<Posts> findRange(int[] range);

    int count();
    
}
