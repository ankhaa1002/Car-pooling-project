/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Ankhaa
 */
@JsonIgnoreProperties({"postid"})
@Entity
@Table(name = "likes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Likes.findAll", query = "SELECT l FROM Likes l"),
    @NamedQuery(name = "Likes.findByLikeid", query = "SELECT l FROM Likes l WHERE l.likeid = :likeid"),
    @NamedQuery(name = "Likes.findByUseridAndPostid", query = "SELECT l FROM Likes l WHERE l.userid = :userid AND l.postid = :postid"),
    @NamedQuery(name = "Likes.findByDatecreated", query = "SELECT l FROM Likes l WHERE l.datecreated = :datecreated"),
    @NamedQuery(name = "Likes.findByDateupdated", query = "SELECT l FROM Likes l WHERE l.dateupdated = :dateupdated")})
public class Likes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "likeid")
    private Integer likeid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "datecreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datecreated;
    @Basic(optional = false)
    @Column(name = "dateupdated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateupdated;
    @JoinColumn(name = "postid", referencedColumnName = "postid")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Posts postid;
    @JoinColumn(name = "userid", referencedColumnName = "userid")
    @ManyToOne(optional = false)
    private Users userid;

    public Likes() {
    }

    public Likes(Integer likeid) {
        this.likeid = likeid;
    }

    public Likes(Integer likeid, Date datecreated, Date dateupdated) {
        this.likeid = likeid;
        this.datecreated = datecreated;
        this.dateupdated = dateupdated;
    }

    public Integer getLikeid() {
        return likeid;
    }

    public void setLikeid(Integer likeid) {
        this.likeid = likeid;
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    public Date getDateupdated() {
        return dateupdated;
    }

    public void setDateupdated(Date dateupdated) {
        this.dateupdated = dateupdated;
    }
    
    @JsonIgnore
    public Posts getPostid() {
        return postid;
    }

    public void setPostid(Posts postid) {
        this.postid = postid;
    }

    public Users getUserid() {
        return userid;
    }

    public void setUserid(Users userid) {
        this.userid = userid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (likeid != null ? likeid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Likes)) {
            return false;
        }
        Likes other = (Likes) object;
        if ((this.likeid == null && other.likeid != null) || (this.likeid != null && !this.likeid.equals(other.likeid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Likes[ likeid=" + likeid + " ]";
    }
    
}
