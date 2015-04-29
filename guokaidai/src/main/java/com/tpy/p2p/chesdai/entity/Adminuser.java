package com.tpy.p2p.chesdai.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * Adminuser 后台用户信息
 */
/**
 * <p>
 * Title:Adminuser
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Company: 太平洋金融
 * </p>
 * 
 * @author LiNing
 *         <p>
 *         date 2014年2月14日
 *         </p>
 */
@Entity
@Table(name = "adminuser")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer","comments","attachments","userrelationinfos","role"})
public class Adminuser implements java.io.Serializable {

    /** 主键 */
    private Long id;
    /** 角色 */
    private Role role;
    /** 登陆名 */
    private String username;
    /** 真实姓名 */
    private String realname;
    /** 电话 */
    private String phone;
    /** 性别 */
    private Integer sex;
    /** 年龄 */
    private Integer age;
    /** 邮箱 */
    private String email;
    /** (0未启用 1启用) */
    private Integer status;
    /** 密码 MD5 加密 */
    private String password;
    /** 地址 */
    private String address;
    /**QQ通讯**/
    private String qq;
    /**头像**/
    private String imgUrl;
    /** comments */
    private Set<Comment> comments = new HashSet<Comment>(0);
    /** attachments */
    private Set<Attachment> attachments = new HashSet<Attachment>(0);
    /** userrelationinfos */
    private Set<Userrelationinfo> userrelationinfos = new HashSet<Userrelationinfo>(
            0);

    /** default constructor */
    public Adminuser() {
    }

    /**
     * <p>
     * Title:
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param id
     *            id
     */
    public Adminuser(Long id) {
        this.id = id;
    }

    /**
     * <p>
     * Title:
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param role
     *            权限
     * @param username
     *            用户名
     * @param realname
     *            真实姓名
     * @param phone
     *            电话号码
     * @param sex
     *            性别
     * @param age
     *            年龄
     * @param email
     *            邮箱
     * @param status
     *            状态
     * @param password
     *            密码
     * @param address
     *            地址
     * @param comments
     *            comments
     * @param attachments
     *            attachments
     * @param userrelationinfos
     *            联系信息
     */
    public Adminuser(Role role, String username, String realname, String phone,
            Integer sex, Integer age, String email, Integer status,
            String password, String address, Set<Comment> comments,
            Set<Attachment> attachments, Set<Userrelationinfo> userrelationinfos,String qq,String imgUrl) {
        this.role = role;
        this.username = username;
        this.realname = realname;
        this.phone = phone;
        this.sex = sex;
        this.age = age;
        this.email = email;
        this.status = status;
        this.password = password;
        this.address = address;
        this.comments = comments;
        this.attachments = attachments;
        this.qq=qq;
        this.imgUrl=imgUrl;
        this.userrelationinfos = userrelationinfos;
    }

    // Property accessors
    /**
     * <p>
     * Title: getId
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return id
     */
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Long getId() {
        return this.id;
    }

    /**
     * <p>
     * Title: setId
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param id
     *            id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>
     * Title: getRole
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return role
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id")
    public Role getRole() {
        return this.role;
    }

    /**
     * <p>
     * Title: setRole
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param role
     *            role
     */
    public void setRole(Role role) {
        this.role = role;
    }

    /**
     * <p>
     * Title: getUsername
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return username
     */
    @Column(name = "username", length = 20)
    public String getUsername() {
        return this.username;
    }

    /**
     * <p>
     * Title: setUsername
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param username
     *            username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * <p>
     * Title: getRealname
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return realname
     */
    @Column(name = "realname", length = 20)
    public String getRealname() {
        return this.realname;
    }

    /**
     * <p>
     * Title: setRealname
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param realname
     *            realname
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /**
     * <p>
     * Title: getPhone
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return phone
     */
    @Column(name = "phone", length = 20)
    public String getPhone() {
        return this.phone;
    }

    /**
     * <p>
     * Title: setPhone
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param phone
     *            phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * <p>
     * Title: getSex
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return sex
     */
    @Column(name = "sex")
    public Integer getSex() {
        return this.sex;
    }

    /**
     * <p>
     * Title: setSex
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param sex
     *            sex
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * <p>
     * Title: getAge
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return age
     */
    @Column(name = "age")
    public Integer getAge() {
        return this.age;
    }

    /**
     * <p>
     * Title: setAge
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param age
     *            age
     */
    public void setAge(Integer age) {
        this.age = age;
    }

    /**
     * <p>
     * Title: getEmail
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return email
     */
    @Column(name = "email", length = 20)
    public String getEmail() {
        return this.email;
    }

    /**
     * <p>
     * Title: setEmail
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param email
     *            email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * <p>
     * Title: getStatus
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return status
     */
    @Column(name = "status")
    public Integer getStatus() {
        return this.status;
    }

    /**
     * <p>
     * Title: setStatus
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param status
     *            status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * <p>
     * Title: getPassword
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return password
     */
    @Column(name = "password")
    public String getPassword() {
        return this.password;
    }

    /**
     * <p>
     * Title: setPassword
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param password
     *            password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * <p>
     * Title: getAddress
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return address
     */
    @Column(name = "address")
    public String getAddress() {
        return this.address;
    }

    /**
     * <p>
     * Title: setAddress
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param address
     *            address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "qq")
    public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
  
	@Column(name = "imgUrl")
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	/**
     * <p>
     * Title: getComments
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return comments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminuser")
    public Set<Comment> getComments() {
        return this.comments;
    }

    /**
     * <p>
     * Title: setComments
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param comments
     *            comments
     */
    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    /**
     * <p>
     * Title: getAttachments
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return attachments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminuser")
    public Set<Attachment> getAttachments() {
        return this.attachments;
    }

    /**
     * <p>
     * Title: setAttachments
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param attachments
     *            attachments
     */
    public void setAttachments(Set<Attachment> attachments) {
        this.attachments = attachments;
    }

    /**
     * <p>
     * Title: getUserrelationinfos
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @return userrelationinfos
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminuser")
    public Set<Userrelationinfo> getUserrelationinfos() {
        return this.userrelationinfos;
    }

    /**
     * <p>
     * Title: setUserrelationinfos
     * </p>
     * <p>
     * Description:
     * </p>
     * 
     * @param userrelationinfos
     *            userrelationinfos
     */
    public void setUserrelationinfos(Set<Userrelationinfo> userrelationinfos) {
        this.userrelationinfos = userrelationinfos;
    }

}