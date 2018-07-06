package com.spring.finalproject.model;

public class WorldDetailVO {

	private String seq_world_detail;
	private String fk_category;
	private String latitude;
	private String longitude;
	private String zindex;
	
	public WorldDetailVO() {}

	public WorldDetailVO(String seq_world_detail, String fk_category, String latitude, String longitude,
			String zindex) {
		super();
		this.seq_world_detail = seq_world_detail;
		this.fk_category = fk_category;
		this.latitude = latitude;
		this.longitude = longitude;
		this.zindex = zindex;
	}

	public String getSeq_world_detail() {
		return seq_world_detail;
	}

	public void setSeq_world_detail(String seq_world_detail) {
		this.seq_world_detail = seq_world_detail;
	}

	public String getFk_category() {
		return fk_category;
	}

	public void setFk_category(String fk_category) {
		this.fk_category = fk_category;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getZindex() {
		return zindex;
	}

	public void setZindex(String zindex) {
		this.zindex = zindex;
	}
	
		
}
