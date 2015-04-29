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
@Table(name = "manual")
public class Manual implements java.io.Serializable{
	
	/**
     * 主键id
     */
    private Long id;
    /**
     * 是否显示
     */
    private Integer isShow;
    /**
     * 标题
     */
    private String title;
    /**
     * 内容
     */
    private String imgExplain;

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
	@Column(name = "title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "imgExplain")
	public String getImgExplain() {
		return imgExplain;
	}
	public void setImgExplain(String imgExplain) {
		this.imgExplain = imgExplain;
	}
	public Manual() {
		super();
	}
	
	
}
