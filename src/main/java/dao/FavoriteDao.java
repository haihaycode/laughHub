package dao;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Favorite;
import util.DatabaseUtil;

public class FavoriteDao {
	public static boolean create(Favorite favorite) {
		EntityManager em = DatabaseUtil.connect();
		boolean isSuccess = false;
		try {
			em.getTransaction().begin();
			em.persist(favorite);
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

	public static boolean existsByVideoIdAndUserId(String videoId, String userId) {
		EntityManager em = DatabaseUtil.connect();
		try {
			TypedQuery<Long> query = em.createQuery(
					"SELECT COUNT(f) FROM Favorite f WHERE f.video.id = :videoId AND f.user.id = :userId", Long.class);
			query.setParameter("videoId", videoId);
			query.setParameter("userId", userId);
			Long count = query.getSingleResult();
			return count > 0; // Trả về true nếu có ít nhất một bản ghi tồn tại
		} catch (Exception e) {
			e.printStackTrace();
			return false; // Trả về false nếu có lỗi xảy ra hoặc không tìm thấy kết quả
		} finally {
			em.close();
		}
	}

	public static boolean deleteByVideoIdAndUserId(String videoId, String userId) {
		EntityManager em = DatabaseUtil.connect();
		try {
			em.getTransaction().begin();
			int deletedCount = em
					.createQuery("DELETE FROM Favorite f WHERE f.video.id = :videoId AND f.user.id = :userId")
					.setParameter("videoId", videoId).setParameter("userId", userId).executeUpdate();
			em.getTransaction().commit();
			return deletedCount > 0; // Trả về true nếu có ít nhất một bản ghi được xóa
		} catch (Exception e) {
			em.getTransaction().rollback();
			e.printStackTrace();
			return false; // Trả về false nếu có lỗi xảy ra hoặc không có bản ghi nào được xóa
		} finally {
			em.close();
		}
	}

}
