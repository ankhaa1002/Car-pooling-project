package Entities;

import Entities.Posts;
import Entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-12-22T01:59:17")
@StaticMetamodel(Comments.class)
public class Comments_ { 

    public static volatile SingularAttribute<Comments, Date> dateupdated;
    public static volatile SingularAttribute<Comments, Integer> commentid;
    public static volatile SingularAttribute<Comments, String> comment;
    public static volatile SingularAttribute<Comments, Date> datecreated;
    public static volatile SingularAttribute<Comments, Posts> postid;
    public static volatile SingularAttribute<Comments, Users> userid;

}