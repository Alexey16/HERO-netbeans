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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Алексей
 */
@Entity
@Table(name = "heroes", catalog = "postgres", schema = "public")
public class Heroes implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_hero")
    private Integer idHero;
    @Column(name = "age")
    private Short age;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "gender")
    private String gender;
    @Column(name = "body_type")
    private String bodyType;
    @Column(name = "location")
    private String location;
    @JoinColumn(name = "id_universe", referencedColumnName = "id_universe")
    @ManyToOne(optional = false)
    private Universes idUniverse;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "heroes")
    private List<HeroicAbilities> heroicAbilitiesCollection;

    public Heroes() {
    }

    public Heroes(Integer idHero) {
        this.idHero = idHero;
    }

    public Heroes(Integer idHero, String name) {
        this.idHero = idHero;
        this.name = name;
    }

    public Integer getIdHero() {
        return idHero;
    }

    public void setIdHero(Integer idHero) {
        this.idHero = idHero;
    }

    public Short getAge() {
        return age;
    }

    public void setAge(Short age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBodyType() {
        return bodyType;
    }

    public void setBodyType(String bodyType) {
        this.bodyType = bodyType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Universes getIdUniverse() {
        return idUniverse;
    }

    public void setIdUniverse(Universes idUniverse) {
        this.idUniverse = idUniverse;
    }

    public void setHeroicAbilitiesCollection(List<HeroicAbilities> heroicAbilitiesCollection) {
        this.heroicAbilitiesCollection = heroicAbilitiesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idHero != null ? idHero.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Heroes)) {
            return false;
        }
        Heroes other = (Heroes) object;
        if ((this.idHero == null && other.idHero != null) || (this.idHero != null && !this.idHero.equals(other.idHero))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hero.Heroes[ idHero=" + idHero + " ]";
    }
    
}
