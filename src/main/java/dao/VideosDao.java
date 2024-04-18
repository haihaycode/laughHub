package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.Video;
import util.DatabaseUtil;

public class VideosDao {
	public static List<Video> getAllVideos(String q, int active, int category) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<Video> query;

			String queryString = "SELECT v FROM Video v";
			boolean whereClauseAdded = false;


			if (q != null && !q.isEmpty()) {
				queryString += " WHERE v.title LIKE :q OR v.description LIKE :q  OR v.id LIKE :q";
				whereClauseAdded = true;
			}

			if (active != 0) {

				if (whereClauseAdded) {
					queryString += " AND v.active = :active";
				} else {
					queryString += " WHERE v.active = :active";
					whereClauseAdded = true;

				}
			}


			if (category > 0) {
				if (whereClauseAdded) {
					queryString += " AND v.videoCategory.id = :categoryId";
				} else {
					queryString += " WHERE v.videoCategory.id = :categoryId";
				}
			}

			// Create the query
			query = em.createQuery(queryString, Video.class);

			// Set parameters
			if (q != null && !q.isEmpty()) {
				query.setParameter("q", "%" + q + "%");
			}
			if (active != 0) {
				if (active != 4) {
					query.setParameter("active", active == 1); // Convert integer to boolean
				} // Convert integer to boolean
			}
			if (category > 0) {
				query.setParameter("categoryId", category);
			}

			// Execute and return the result
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

	public static List<Video> findPage(int page, int size, String q, int active, int category) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<Video> query;

			// Build the base query
			String queryString = "SELECT v FROM Video v";
			boolean whereClauseAdded = false;

			// Check if q is provided
			if (q != null && !q.isEmpty()) {
				queryString += " WHERE v.title LIKE :q OR v.description LIKE :q  OR v.id LIKE :q";
				whereClauseAdded = true;
			}

			// Check if active flag is provided
			if (active != 0) {

				if (whereClauseAdded) {
					queryString += " AND v.active = :active";
				} else {
					queryString += " WHERE v.active = :active";
					whereClauseAdded = true;

				}
			}

			// Check if category is provided
			if (category > 0) {
				if (whereClauseAdded) {
					queryString += " AND v.videoCategory.id = :categoryId";
				} else {
					queryString += " WHERE v.videoCategory.id = :categoryId";
				}
			}

			// Create the query
			query = em.createQuery(queryString, Video.class);

			// Set parameters
			if (q != null && !q.isEmpty()) {
				query.setParameter("q", "%" + q + "%");
			}
			if (active != 0) {
				if (active != 4) {
					query.setParameter("active", active == 1); // Convert integer to boolean
				}
			}
			if (category > 0) {
				query.setParameter("categoryId", category);
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

	public static boolean exists(String id) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			Video video = em.find(Video.class, id);
			return video != null; // Trả về true nếu video tồn tại, ngược lại trả về false
		} catch (Exception e) {
			System.out.println("Đã xảy ra lỗi: " + e.getMessage());
			return false; // Nếu có lỗi, trả về false
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public static Video find(String id) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			return em.find(Video.class, id);
		} catch (Exception e) {
			System.out.println("Đã xảy ra lỗi: " + e.getMessage());
			return null;
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public static boolean createVideo(Video video) {
		EntityManager em = null;
		boolean createdSuccessfully = false;
		try {
			em = DatabaseUtil.connect();
			em.getTransaction().begin();

			// Kiểm tra xem video có tồn tại trong cơ sở dữ liệu chưa
			Video existingVideo = em.find(Video.class, video.getId());
			if (existingVideo == null) {
				em.persist(video);
				em.getTransaction().commit();
				createdSuccessfully = true;
				System.out.println("Video đã được tạo thành công!");
			} else {
				createdSuccessfully = false;
				System.out.println("ID đã tồn tại. Không thể tạo video mới!");
			}
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback();
				createdSuccessfully = false;
				System.out.println("(lỗi)!" + e.getMessage());
			}
			System.out.println("Lỗi khi tạo video: " + e.getMessage());
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
		return createdSuccessfully;
	}

	public static boolean deleteVideo(String videoId) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect(); // Kết nối đến EntityManager

			// Bắt đầu giao dịch
			em.getTransaction().begin();

			// Xóa các bản ghi trong bảng share liên quan đến video đã bị xóa
			Query shareQuery = em.createNativeQuery("DELETE FROM share WHERE videoid = :videoId");
			shareQuery.setParameter("videoId", videoId);
			shareQuery.executeUpdate();

			// Xóa các bản ghi trong bảng favorite liên quan đến video đã bị xóa
			Query favoriteQuery = em.createNativeQuery("DELETE FROM favorite WHERE videoid = :videoId");
			favoriteQuery.setParameter("videoId", videoId);
			favoriteQuery.executeUpdate();

			// Xóa video có id tương ứng
			Video video = em.find(Video.class, videoId);
			if (video != null) {
				em.remove(video);
			} else {
				// Không tìm thấy video
				return false;
			}

			// Commit transaction
			em.getTransaction().commit();

			return true; // Trả về true nếu xóa thành công
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback transaction nếu có lỗi
			}
			System.out.println("Đã xảy ra lỗi khi xóa video: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			if (em != null) {
				em.close(); // Đóng EntityManager
			}
		}
	}

	public static boolean updateVideo(Video video) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect(); // Kết nối đến EntityManager

			// Bắt đầu giao dịch
			em.getTransaction().begin();

			// Tìm video trong cơ sở dữ liệu bằng id
			Video existingVideo = em.find(Video.class, video.getId());
			if (existingVideo != null) {
				// Cập nhật thông tin của video
				existingVideo.setTitle(video.getTitle());
				existingVideo.setPoster(video.getPoster() == null ? existingVideo.getPoster() : video.getPoster());
				existingVideo.setViews(existingVideo.getViews());
				existingVideo.setDescription(video.getDescription());
				existingVideo.setVideodate(existingVideo.getVideodate());
				existingVideo.setActive(video.getActive());
				existingVideo.setVideoCategory(video.getVideoCategory());

				// Lưu thay đổi vào cơ sở dữ liệu
				em.merge(existingVideo);

				// Commit transaction
				em.getTransaction().commit();

				return true; // Trả về true nếu cập nhật thành công
			} else {
				// Không tìm thấy video
				return false;
			}
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback transaction nếu có lỗi
			}
			System.out.println("Đã xảy ra lỗi khi cập nhật video: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			if (em != null) {
				em.close(); // Đóng EntityManager
			}
		}
	}

	public static List<Video> getAllVideosHome(String q, int category, boolean sortByViewsAsc, boolean sortByDateAsc) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<Video> query;

			// Build the base query
			String queryString = "SELECT v FROM Video v WHERE v.active = true";

			// Check if q is provided
			if (q != null && !q.isEmpty()) {
				queryString += " AND (v.title LIKE :q OR v.description LIKE :q OR v.id LIKE :q)";
			}

			// Check if category is provided
			if (category > 0) {
				queryString += " AND v.videoCategory.id = :categoryId";
			}

			// Add order by clause based on sortByViewsAsc parameter
			queryString += " ORDER BY v.views " + (sortByViewsAsc ? "ASC" : "DESC");

			// Add order by clause based on sortByDateAsc parameter
			queryString += ", v.id " + (sortByDateAsc ? "ASC" : "DESC");

			// Create the query
			query = em.createQuery(queryString, Video.class);

			// Set parameters
			if (q != null && !q.isEmpty()) {
				query.setParameter("q", "%" + q + "%");
			}
			if (category > 0) {
				query.setParameter("categoryId", category);
			}

			// Execute and return the result
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

	public static List<Video> findPageHome(int page, int size, String q, int category, boolean sortByViewsAsc,
			boolean sortByDateAsc) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			TypedQuery<Video> query;

			// Build the base query
			String queryString = "SELECT v FROM Video v WHERE v.active = true";

			// Check if q is provided
			if (q != null && !q.isEmpty()) {
				queryString += " AND (v.title LIKE :q OR v.description LIKE :q OR v.id LIKE :q)";
			}

			// Check if category is provided
			if (category > 0) {
				queryString += " AND v.videoCategory.id = :categoryId";
			}

			// Add order by clause based on sortByViewsAsc parameter
			queryString += " ORDER BY v.views " + (sortByViewsAsc ? "ASC" : "DESC");

			// Add order by clause based on sortByDateAsc parameter
			queryString += ", v.id " + (sortByDateAsc ? "ASC" : "DESC");

			// Create the query
			query = em.createQuery(queryString, Video.class);

			// Set parameters
			if (q != null && !q.isEmpty()) {
				query.setParameter("q", "%" + q + "%");
			}
			if (category > 0) {
				query.setParameter("categoryId", category);
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

	public static boolean updateVideoViews(Video video) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect(); // Kết nối đến EntityManager

			// Bắt đầu giao dịch
			em.getTransaction().begin();

			// Tìm video trong cơ sở dữ liệu bằng id
			Video existingVideo = em.find(Video.class, video.getId());
			if (existingVideo != null) {
				// Tăng giá trị views lên 1
				existingVideo.setViews(existingVideo.getViews() + 1);

				// Lưu thay đổi vào cơ sở dữ liệu
				em.merge(existingVideo);

				// Commit transaction
				em.getTransaction().commit();

				return true; // Trả về true nếu cập nhật thành công
			} else {
				// Không tìm thấy video
				return false;
			}
		} catch (Exception e) {
			if (em != null && em.getTransaction().isActive()) {
				em.getTransaction().rollback(); // Rollback transaction nếu có lỗi
			}
			System.out.println("Đã xảy ra lỗi khi cập nhật số lượt xem của video: " + e.getMessage());
			return false; // Trả về false nếu có lỗi xảy ra
		} finally {
			if (em != null) {
				em.close(); // Đóng EntityManager
			}
		}
	}

	public static Video getVideoByIdActive(String id) {
		EntityManager em = null;
		try {
			em = DatabaseUtil.connect();
			String jpql = "SELECT v FROM Video v WHERE v.id = :id AND v.active = true";
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			query.setParameter("id", id);
			return query.getSingleResult(); // Trả về đối tượng Video nếu tìm thấy, ngược lại trả về null
		} catch (NoResultException e) {
			return null; // Không tìm thấy video, trả về null
		} catch (Exception e) {
			System.out.println("Đã xảy ra lỗi: " + e.getMessage());
			return null; // Nếu có lỗi, trả về null
		} finally {
			if (em != null && em.isOpen()) {
				em.close();
			}
		}
	}

	public static List<Video> getRandomizedList(List<Video> videos) {
		if (videos == null || videos.isEmpty()) {
			return new ArrayList<>(); // Trả về danh sách trống nếu danh sách ban đầu là null hoặc trống
		}

		List<Video> randomizedList = new ArrayList<>(videos); // Tạo một bản sao của danh sách ban đầu
		Collections.shuffle(randomizedList); // Xáo trộn vị trí của các phần tử trong danh sách
		return randomizedList; // Trả về danh sách đã xáo trộn
	}

	public static List<Video> getAllFavoriteVideosByUserId(String userId) {
		EntityManager em = DatabaseUtil.connect();
		List<Video> favoriteVideos = null;
		try {
			TypedQuery<Video> query = em.createQuery("SELECT f.video FROM Favorite f WHERE f.user.id = :userId",
					Video.class);
			query.setParameter("userId", userId);
			favoriteVideos = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}
		return favoriteVideos;
	}

}
