package Entities;

import Entities.Comments;
import Entities.Likes;
import Entities.Users;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-12-22T01:59:17")
@StaticMetamodel(Posts.class)
public class Posts_ { 

    public static volatile ListAttribute<Posts, Comments> commentsList;
    public static volatile SingularAttribute<Posts, String> post;
    public static volatile SingularAttribute<Posts, Date> dateupdated;
    public static volatile SingularAttribute<Posts, Integer> posttype;
    public static volatile SingularAttribute<Posts, String> destination;
    public static volatile SingularAttribute<Posts, Integer> postid;
    public static volatile SingularAttribute<Posts, String> source;
    public static volatile SingularAttribute<Posts, Date> datecreated;
    public static volatile SingularAttribute<Posts, Users> userid;
    public static volatile ListAttribute<Posts, Likes> likesList;

}