package com.tpy.p2p.chesdai.entity;

/**
 * Created by hsq on 2015/3/4.
 */
import javax.persistence.*;
import static javax.persistence.GenerationType.IDENTITY;

/**
 * 系统配置表
 */
@Entity
@Table(name = "sysconfig")
public class SysConfig {

    /**
     *  id
     */
    private int id;

    /**
     * 配置名
     */
    private String key;

    /**
     * 配置值
     */
    private String value;

    public SysConfig(){}

    public SysConfig(String value, String key) {
        this.value = value;
        this.key = key;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "key", unique = true, nullable = false)
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Column(name = "value")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
