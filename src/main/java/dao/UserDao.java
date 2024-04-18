package dao;

import javax.persistence.Query;
import java.util.List;

import javax.persistence.EntityManager;

import javax.persistence.TypedQuery;

import model.User;
import util.DatabaseUtil;

public class UserDao {
	public static String create(User user) {
		EntityManager em = DatabaseUtil.connect();
		try {
			em.getTransaction().begin();
			em.persist(user);
			em.getTransaction().commit();
			return "success";
		} catch (Exception e) {
			em.getTransaction().rollback();
			return "error :" + e.getMessage();
		} finally {
			em.close();
		}
	}

	public static String checkIdExists(User user) {
		EntityManager em = DatabaseUtil.connect();
		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.id = :id", Long.class);
			query.setParameter("id", user.getId());
			Long count = query.getSingleResult();
			return count > 0 ? "existed" : "not";
		} catch (Exception e) {
			em.getTransaction().rollback();
			return "error";
		} finally {
			em.close();
		}
	}

	public static User find(String id) {
		EntityManager entityManager = DatabaseUtil.connect();
		if (entityManager.find(User.class, id) != null) {
			return entityManager.find(User.class, id);
		} else {
			return null;
		}
	}

	public static String update(User user) {
		EntityManager em = DatabaseUtil.connect();
		User oldUser = em.find(User.class, user.getId());
		if (oldUser == null) {
			return "(lỗi) không tìm thấy người dùng ";
		}
		oldUser.setId(user.getId());
		oldUser.setFullname(user.getFullname());
		oldUser.setEmail(user.getEmail());
		oldUser.setAvatar(user.getAvatar() == null ? oldUser.getAvatar() : user.getAvatar());
		em.getTransaction().begin();
		em.merge(oldUser);
		em.getTransaction().commit();
		return "Cập nhật người dùng thành công";
	}

	public static void updatePassword(User user) {
		EntityManager em = DatabaseUtil.connect();
		try {
			em.getTransaction().begin();
			em.merge(user);
			em.getTransaction().commit();
			System.out.println("Cập nhật thành công");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			em.getTransaction().rollback();
			System.out.println("Cập Nhật thất bại");

		}
	}

	public static boolean checkEmailExists(String email) {
		EntityManager em = DatabaseUtil.connect();
		try {
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email", Long.class);
			query.setParameter("email", email);
			Long count = query.getSingleResult();
			return count > 0;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return false;
		} finally {
			em.close();
		}
	}

	public static User getUserByEmail(String email) {
		EntityManager em = DatabaseUtil.connect();
		try {
			TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
			query.setParameter("email", email);
			List<User> users = query.getResultList();
			return users.isEmpty() ? null : users.get(0);
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return null;
		} finally {
			em.close();
		}
	}

	public static List<User> getAllUsers(String q) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<User> query;
			if (q != null && !q.isEmpty()) {
				query = em.createQuery("SELECT u FROM User u WHERE u.id LIKE :q OR u.fullname LIKE :q", User.class);
				query.setParameter("q", "%" + q + "%");
			} else {
				query = em.createNamedQuery("User.findAll", User.class);
			}
			return query.getResultList();
		} catch (Exception e) {
			System.out.println("Đã xảy ra lỗi: " + e.getMessage());
			return null;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public static List<User> findPage(int page, int size, String q) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<User> query;
			if (q != null && !q.isEmpty()) {
				query = em.createQuery("SELECT u FROM User u WHERE u.id LIKE :q OR u.fullname LIKE :q", User.class);
				query.setParameter("q", "%" + q + "%");
			} else {
				query = em.createNamedQuery("User.findAll", User.class);
			}
			query.setFirstResult(page * size);
			query.setMaxResults(size);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public static boolean deleteUser(String userId) {
		EntityManager em = DatabaseUtil.connect();
		try {
			em.getTransaction().begin();
			User user = em.find(User.class, userId);
			Query favoriteQuery = em.createNativeQuery("DELETE FROM favorite WHERE userid = :userId");
			favoriteQuery.setParameter("userId", userId);
			favoriteQuery.executeUpdate();

			// Xóa các bản ghi trong bảng share liên quan đến người dùng đã bị xóa
			Query shareQuery = em.createNativeQuery("DELETE FROM share WHERE userid = :userId");
			shareQuery.setParameter("userId", userId);
			shareQuery.executeUpdate();

			if (user != null) {
				em.remove(user);
				em.getTransaction().commit();
				return true; // Trả về true nếu xóa thành công
			} else {
				return false; // Trả về false nếu không tìm thấy người dùng
			}
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Đã xảy ra lỗi khi xóa người dùng: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			em.close();
		}
	}

}
