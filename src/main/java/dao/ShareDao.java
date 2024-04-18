package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Share;
import util.DatabaseUtil;

public class ShareDao {
	public static boolean insert(Share share) {
		EntityManager em = DatabaseUtil.connect();
		boolean isSuccess = false;
		try {
			em.getTransaction().begin();
			em.persist(share);
			em.getTransaction().commit();
			isSuccess = true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			em.close();
		}
		return isSuccess;
	}

	public static List<Share> findByVideoId(String videoId) {
		EntityManager em = DatabaseUtil.connect();
		List<Share> shares = null;
		try {
			String jpql = "SELECT s FROM Share s WHERE s.video.id = :videoId";
			TypedQuery<Share> query = em.createQuery(jpql, Share.class);
			query.setParameter("videoId", videoId);
			shares = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return shares;
	}
}
