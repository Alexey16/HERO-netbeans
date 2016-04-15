/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heroesbd.Entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author Алексей
 */
@Entity
@Table(name = "heroic_abilities", catalog = "postgres", schema = "public")
public class HeroicAbilities implements Serializable {

    @EmbeddedId
    protected HeroicAbilitiesPK heroicAbilitiesPK;
    @Column(name = "specific_features")
    private String specificFeatures;
    @JoinColumn(name = "id_hero", referencedColumnName = "id_hero", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Heroes heroes;
    @JoinColumn(name = "id_ability", referencedColumnName = "id_ability", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Abilities abilities;

    public HeroicAbilities() {
    }

    public HeroicAbilities(HeroicAbilitiesPK heroicAbilitiesPK) {
        this.heroicAbilitiesPK = heroicAbilitiesPK;
    }

    public HeroicAbilities(int idHero, int idAbility) {
        this.heroicAbilitiesPK = new HeroicAbilitiesPK(idHero, idAbility);
    }

    public HeroicAbilitiesPK getHeroicAbilitiesPK() {
        return heroicAbilitiesPK;
    }

    public void setHeroicAbilitiesPK(HeroicAbilitiesPK heroicAbilitiesPK) {
        this.heroicAbilitiesPK = heroicAbilitiesPK;
    }

    public String getSpecificFeatures() {
        return specificFeatures;
    }

    public void setSpecificFeatures(String specificFeatures) {
        this.specificFeatures = specificFeatures;
    }

    public Heroes getHeroes() {
        return heroes;
    }

    public void setHeroes(Heroes heroes) {
        this.heroes = heroes;
    }

    public Abilities getAbilities() {
        return abilities;
    }

    public void setAbilities(Abilities abilities) {
        this.abilities = abilities;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (heroicAbilitiesPK != null ? heroicAbilitiesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof HeroicAbilities)) {
            return false;
        }
        HeroicAbilities other = (HeroicAbilities) object;
        if ((this.heroicAbilitiesPK == null && other.heroicAbilitiesPK != null) || (this.heroicAbilitiesPK != null && !this.heroicAbilitiesPK.equals(other.heroicAbilitiesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "hero.HeroicAbilities[ heroicAbilitiesPK=" + heroicAbilitiesPK + " ]";
    }
    
}
