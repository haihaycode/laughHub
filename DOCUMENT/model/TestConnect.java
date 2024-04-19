package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;


public class TestConnect {
	public static void main(String[] args) {
		 EntityManagerFactory emf = Persistence.createEntityManagerFactory("bs5h14wg6zljcu2uhmfm");
	        EntityManager em = emf.createEntityManager();
	        
	        TypedQuery<Favorite> query = em.createQuery( "SELECT f FROM Favorite f",Favorite.class);
	 
	        List<Favorite> favorites= query.getResultList();
	        for (Favorite favorite : favorites) {
	            System.out.println("Favorite ID: " + favorite.getId());
	            System.out.println("Liked Date: " + favorite.getLikedate());
	            // In thêm các thông tin khác nếu cần
	        }
	        
	        em.close();
	        emf.close();
    }
}
