package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.Query;

import model.VideoCategory;
import util.DatabaseUtil;


public class CategoriesDao {
	
	public static List<VideoCategory> getAllCategories(String q ) {
	    EntityManager em = null;
	    try {
	        em = DatabaseUtil.connect();
	        TypedQuery<VideoCategory> query;
	        if (q != null && !q.isEmpty()) {
	            query = em.createQuery("SELECT vc FROM VideoCategory vc WHERE vc.categoryName LIKE :q", VideoCategory.class);
	            query.setParameter("q", "%" + q + "%");
	        } else {
	            query = em.createNamedQuery("VideoCategory.findAll", VideoCategory.class);
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


	public static boolean createCategory(VideoCategory category) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			em.getTransaction().begin();
			em.persist(category); // Thêm đối tượng danh mục vào EntityManager
			em.getTransaction().commit();
			return true; // Trả về true nếu thêm thành công
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback transaction nếu có lỗi
			}
			System.out.println("Đã xảy ra lỗi khi thêm danh mục: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			if (em != null && em.isOpen()) {
				em.close(); // Đóng EntityManager
			}
		}
	}

	public static List<VideoCategory> findPage(int page, int size, String q) {
	    EntityManager em = null;
	    try {
	        em = DatabaseUtil.connect();
	        TypedQuery<VideoCategory> query = em.createQuery("SELECT vc FROM VideoCategory vc WHERE vc.categoryName LIKE :q", VideoCategory.class);
	        query.setParameter("q", "%" + q + "%");
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


	public static VideoCategory find(int id) {
		EntityManager entityManager = DatabaseUtil.connect();
		if (entityManager.find(VideoCategory.class, id) != null) {
			return entityManager.find(VideoCategory.class, id);
		} else {
			System.out.println("not found");
			return null;

		}
	}

	public static boolean deleteCategory(int categoryId) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect(); // Kết nối đến EntityManager

			// Bắt đầu giao dịch
			em.getTransaction().begin();

			// Xóa các bản ghi trong bảng share liên quan đến category đã bị xóa
			Query shareQuery = em.createNativeQuery(
					"DELETE FROM share WHERE videoid IN (SELECT id FROM video WHERE category_id = :categoryId)");
			shareQuery.setParameter("categoryId", categoryId);
			shareQuery.executeUpdate();

			// Xóa các bản ghi trong bảng favorite liên quan đến category đã bị xóa
			Query favoriteQuery = em.createNativeQuery(
					"DELETE FROM favorite WHERE videoid IN (SELECT id FROM video WHERE category_id = :categoryId)");
			favoriteQuery.setParameter("categoryId", categoryId);
			favoriteQuery.executeUpdate();

			// Xóa tất cả các video thuộc category đã bị xóa
			Query videoQuery = em.createNativeQuery("DELETE FROM video WHERE category_id = :categoryId");
			videoQuery.setParameter("categoryId", categoryId);
			videoQuery.executeUpdate();

			// Xóa bản ghi trong bảng category
			VideoCategory category = em.find(VideoCategory.class, categoryId);
			if (category != null) {
				em.remove(category);
			} else {
				// Không tìm thấy danh mục
				return false;
			}

			// Commit transaction
			em.getTransaction().commit();

			return true; // Trả về true nếu xóa thành công
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback transaction nếu có lỗi
			}
			System.out.println("Đã xảy ra lỗi khi xóa danh mục: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			if (em != null) {
				em.close(); // Đóng EntityManager
			}
		}
	}

	public static boolean updateCategory(VideoCategory updatedCategory) {
		EntityManager em = DatabaseUtil.connect();
		try {
			em.getTransaction().begin();
			VideoCategory category = em.find(VideoCategory.class, updatedCategory.getId());
			if (category != null) {
				// Cập nhật thông tin mới cho danh mục
				category.setCategoryName(updatedCategory.getCategoryName());
				category.setDescription(updatedCategory.getDescription());

				// Lưu thay đổi vào cơ sở dữ liệu
				em.merge(category);
				em.getTransaction().commit();
				return true; // Trả về true nếu cập nhật thành công
			} else {
				return false; // Trả về false nếu không tìm thấy danh mục
			}
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Đã xảy ra lỗi khi cập nhật danh mục: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			em.close();
		}
	}
	

}
