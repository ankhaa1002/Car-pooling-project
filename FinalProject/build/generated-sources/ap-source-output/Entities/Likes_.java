package Entities;

import Entities.Posts;
import Entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-12-22T01:59:17")
@StaticMetamodel(Likes.class)
public class Likes_ { 

    public static volatile SingularAttribute<Likes, Date> dateupdated;
    public static volatile SingularAttribute<Likes, Integer> likeid;
    public static volatile SingularAttribute<Likes, Date> datecreated;
    public static volatile SingularAttribute<Likes, Posts> postid;
    public static volatile SingularAttribute<Likes, Users> userid;

}