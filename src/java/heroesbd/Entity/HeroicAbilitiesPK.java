/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heroesbd.Entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Алексей
 */
@Embeddable
public class HeroicAbilitiesPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "id_hero")
    private int idHero;
    @Basic(optional = false)
    @Column(name = "id_ability")
    private int idAbility;

    public HeroicAbilitiesPK() {
    }

    public HeroicAbilitiesPK(int idHero, int idAbility) {
        this.idHero = idHero;
        this.idAbility = idAbility;
    }

    public int getIdHero() {
        return idHero;
    }

    public void setIdHero(int idHero) {
        this.idHero = idHero;
    }

    public int getIdAbility() {
        return idAbility;
    }

    public void setIdAbility(int idAbility) {
        this.idAbility = idAbility;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idHero;
        hash += (int) idAbility;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HeroicAbilitiesPK)) {
            return false;
        }
        HeroicAbilitiesPK other = (HeroicAbilitiesPK) object;
        if (this.idHero != other.idHero) {
            return false;
        }
        if (this.idAbility != other.idAbility) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hero.HeroicAbilitiesPK[ idHero=" + idHero + ", idAbility=" + idAbility + " ]";
    }
    
}
