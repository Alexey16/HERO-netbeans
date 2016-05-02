package heroesbd.DAO;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;

/**
 * 
 * @author Alexey
 */
public class HibernateUtil {
    private static final SessionFactory sessionFactory;
    private static Session session;
    
    static {
        sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        session = sessionFactory.openSession();
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static Session getSession() {
        if(session == null)
            session = sessionFactory.openSession();
        
        return session;
    }
    
    public static void closeSession() {
        session.close();
        session = null;
    }
    
}
