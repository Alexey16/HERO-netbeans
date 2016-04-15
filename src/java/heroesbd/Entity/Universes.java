/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heroesbd.Entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Алексей
 */
@Entity
@Table(name = "universes", catalog = "postgres", schema = "public")
public class Universes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_universe")
    private Integer idUniverse;
    @Basic(optional = false)
    @Column(name = "title")
    private String title;
    @Column(name = "foundation_year")
    private Short foundationYear;
    @Column(name = "type")
    private String type;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idUniverse")
    private List<Heroes> heroesCollection;

    public Universes() {
    }

    public Universes(Integer idUniverse) {
        this.idUniverse = idUniverse;
    }

    public Universes(Integer idUniverse, String title) {
        this.idUniverse = idUniverse;
        this.title = title;
    }

    public Integer getIdUniverse() {
        return idUniverse;
    }

    public void setIdUniverse(Integer idUniverse) {
        this.idUniverse = idUniverse;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Short getFoundationYear() {
        return foundationYear;
    }

    public void setFoundationYear(Short foundationYear) {
        this.foundationYear = foundationYear;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setHeroesCollection(List<Heroes> heroesCollection) {
        this.heroesCollection = heroesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idUniverse != null ? idUniverse.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Universes)) {
            return false;
        }
        Universes other = (Universes) object;
        if ((this.idUniverse == null && other.idUniverse != null) || (this.idUniverse != null && !this.idUniverse.equals(other.idUniverse))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hero.Universes[ idUniverse=" + idUniverse + " ]";
    }
    
}
