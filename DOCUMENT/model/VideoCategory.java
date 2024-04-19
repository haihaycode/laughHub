package model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the video_category database table.
 * 
 */
@Entity
@Table(name="video_category")
@NamedQuery(name="VideoCategory.findAll", query="SELECT v FROM VideoCategory v")
public class VideoCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="category_name")
	private String categoryName;

	@Column(name="created_date")
	private Timestamp createdDate;

	@Lob
	private String description;

	//bi-directional many-to-one association to Video
	@OneToMany(mappedBy="videoCategory")
	private List<Video> videos;

	public VideoCategory() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Timestamp getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Video> getVideos() {
		return this.videos;
	}

	public void setVideos(List<Video> videos) {
		this.videos = videos;
	}

	public Video addVideo(Video video) {
		getVideos().add(video);
		video.setVideoCategory(this);

		return video;
	}

	public Video removeVideo(Video video) {
		getVideos().remove(video);
		video.setVideoCategory(null);

		return video;
	}

	public VideoCategory(String categoryName, Timestamp createdDate, String description) {
		super();
		this.categoryName = categoryName;
		this.createdDate = createdDate;
		this.description = description;
	}

}