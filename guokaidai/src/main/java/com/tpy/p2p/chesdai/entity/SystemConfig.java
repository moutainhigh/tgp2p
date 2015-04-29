package com.tpy.p2p.chesdai.entity;

import java.sql.Date;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * 配置表
 */
@Entity
@Table(name = "system_config")
public class SystemConfig {
    private int id;

    //设置项名称
    private String name;

    //设置项值
    private String value;


    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "value")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }


}
