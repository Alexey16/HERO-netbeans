/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package heroesbd.DAO;

import java.util.List;
import heroesbd.Entity.Abilities;
import org.hibernate.Session;

/**
 *
 * @author Алексей
 */
public class AbilitiesDAO {
    
    public AbilitiesDAO(){
    }
    
    public List<Abilities> findAll() {
        return (List<Abilities>)HibernateUtil.getSession().createQuery("SELECT a FROM Abilities a").list();
    }
    
    
    public void save(Abilities obj) {
         Session session = HibernateUtil.getSession();
         session.beginTransaction();
         session.saveOrUpdate(obj);
         session.getTransaction().commit(); 
     }
     
     public void delete(Abilities obj) {
         
         Session session = HibernateUtil.getSession();
         
            session.beginTransaction();
            session.delete(obj);
            session.getTransaction().commit(); 
         
     }
     
     public Abilities getById(int id) {
         Session session = HibernateUtil.getSession();
         Abilities result = (Abilities)session.get(Abilities.class, id);
         
         return result;
     }
    
}
