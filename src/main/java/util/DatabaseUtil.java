package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class DatabaseUtil {

	private static EntityManagerFactory emf;

	public static EntityManager connect() {
		if (emf == null) {
			// Nạp persistence.xml và tạo EntityManagerFactory
			emf = Persistence.createEntityManagerFactory("bs5h14wg6zljcu2uhmfm");
		}
		// Tạo EntityManager để bắt đầu làm việc với CSDL
		EntityManager em = emf.createEntityManager();
		return em;
	}

	public static void close() {
		if (emf != null && emf.isOpen()) {
			emf.close();
		}
	}
}
