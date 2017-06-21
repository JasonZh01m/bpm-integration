package com.digiwin.bpm.inte.service;

import java.io.Serializable;
import java.util.Date;

public class Parameter implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * OID
     */
    private String oid;

    /**
     * 名称
     */
    private String name;

    /**
     * 描述
     */
    private String description;

    /**
     * 允许上传的文件类型
     */
    private String type;

    /**
     * 有效与否 0:无效, 1:有效
     */
    private Integer valid;

    /**
     * 限制附件个数
     */
    private Integer attachCount;

    /**
     * 单个附件大小
     */
    private Long attachSize;

    /**
     * 创建者
     */
    private String creator;

    /**
     * 创建日期
     */
    private Date createdate;

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getValid() {
        return valid;
    }

    public void setValid(Integer valid) {
        this.valid = valid;
    }

    public Integer getAttachCount() {
        return attachCount;
    }

    public void setAttachCount(Integer attachCount) {
        this.attachCount = attachCount;
    }

    public Long getAttachSize() {
        return attachSize;
    }

    public void setAttachSize(Long attachSize) {
        this.attachSize = attachSize;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    @Override
    public String toString() {
        return "Parameter{" +
                "oid='" + oid + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", type='" + type + '\'' +
                ", valid=" + valid +
                ", attachCount=" + attachCount +
                ", attachSize=" + attachSize +
                ", creator='" + creator + '\'' +
                ", createdate=" + createdate +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Parameter parameter = (Parameter) o;

        return oid != null ? oid.equals(parameter.oid) : parameter.oid == null;

    }

    @Override
    public int hashCode() {
        return oid != null ? oid.hashCode() : 0;
    }
}