package com.tpy.p2p.chesdai.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;



/**
 * Outline
 */
@Entity
@Table(name = "outline")
public class Outline implements java.io.Serializable{
	
	/**
     * 主键id
     */
    private Long id;
    /**
     * 图片
     */
    private String imgUrl;
    /**
     * 是否显示
     */
    private Integer isShow;
    /**
     * 路径
     */
    private String url;
    /**
     * 内容
     */
    private String content;

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name = "isShow")
	public Integer getIsShow() {
		return isShow;
	}
	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}
	@Column(name = "url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Column(name = "imgUrl")
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Column(name = "content")
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Outline() {
		super();
	}
}
