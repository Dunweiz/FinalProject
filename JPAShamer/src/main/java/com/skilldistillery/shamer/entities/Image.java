package com.skilldistillery.shamer.entities;

@Entity
public class Image {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="complaint_id")
	private Complaint complaint;
	
	@Column(name="image_url")
	private String imageUrl;

	public Image() {
		super();
	}

	public Image(Complaint complaint, String imageUrl) {
		super();
		this.complaint = complaint;
		this.imageUrl = imageUrl;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Complaint getComplaint() {
		return complaint;
	}

	public void setComplaint(Complaint complaint) {
		this.complaint = complaint;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", imageUrl=" + imageUrl + "]";
	}
	
	
}
