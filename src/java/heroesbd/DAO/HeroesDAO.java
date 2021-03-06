/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heroesbd.DAO;

import java.util.List;
import heroesbd.Entity.Heroes;
import org.hibernate.Session;

/**
 *
 * @author Алексей
 */
public class HeroesDAO {
    
    public HeroesDAO(){
    }
    
    /**
     *
     * @return
     */
    public List<Heroes> findAll() {
        return (List<Heroes>)HibernateUtil.getSession().createQuery("SELECT h FROM Heroes h").list();
    }
    
     public void save(Heroes obj) {
         
         Session session = HibernateUtil.getSession();
         session.beginTransaction();
         session.saveOrUpdate(obj);
         session.getTransaction().commit();
         HibernateUtil.closeSession();
         
     }
     
     public void delete(Heroes obj) {
         
         HibernateUtil.closeSession();
         Session session = HibernateUtil.getSession();
         session.beginTransaction();
         session.delete(obj);
         session.getTransaction().commit(); 
         
     }
     
     public Heroes getById(int id) {
         Session session = HibernateUtil.getSession();
         Heroes result = (Heroes)session.get(Heroes.class, id);
         
         return result;
     }
    
}
