package com.digiwin.bpm.inte.model;

import java.io.Serializable;
import java.util.Date;

public class Folder implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * OID
     */
    private String oid;

    /**
     * ID(自增长序号)
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 说明
     */
    private String description;

    /**
     * 父文件夹ID
     */
    private Long parent;

    /**
     * 创建者UserOID
     */
    private String creator;

    /**
     * 创建日期（默认带入系统日期时间）
     */
    private Date createdate;

    /**
     * 是否继承父级目录配置,0:否,1:是
     */
    private Integer isExtended;

    /**
     * 文件上传方式, 是否通过流程上传  0:否,1:是
     */
    private Integer isAddByProcess;

    /**
     * 文件变更方式, 是否通过流程变更  0:否,1:是
     */
    private Integer isUpdateByProcess;

    /**
     * 文件作废方式, 是否通过流程作废  0:否,1:是
     */
    private Integer isInvalidByProcess;

    /**
     * 文件编号规则OID
     */
    private String snruledef;

    /**
     * 文件版号规则OID
     */
    private String versiondef;

    /**
     * 参数定义OID
     */
    private String parameter;
    
    /**
     * 文件夹状态,0:失效,1生效
     */
    private Long valid;

	public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getParent() {
        return parent;
    }

    public void setParent(Long parent) {
        this.parent = parent;
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

    public Integer getIsExtended() {
        return isExtended;
    }

    public void setIsExtended(Integer isExtended) {
        this.isExtended = isExtended;
    }

    public Integer getIsAddByProcess() {
        return isAddByProcess;
    }

    public void setIsAddByProcess(Integer isAddByProcess) {
        this.isAddByProcess = isAddByProcess;
    }

    public Integer getIsUpdateByProcess() {
        return isUpdateByProcess;
    }

    public void setIsUpdateByProcess(Integer isUpdateByProcess) {
        this.isUpdateByProcess = isUpdateByProcess;
    }

    public Integer getIsInvalidByProcess() {
        return isInvalidByProcess;
    }

    public void setIsInvalidByProcess(Integer isInvalidByProcess) {
        this.isInvalidByProcess = isInvalidByProcess;
    }

    public String getSnruledef() {
        return snruledef;
    }

    public void setSnruledef(String snruledef) {
        this.snruledef = snruledef == null ? null : snruledef.trim();
    }

    public String getVersiondef() {
        return versiondef;
    }

    public void setVersiondef(String versiondef) {
        this.versiondef = versiondef == null ? null : versiondef.trim();
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter == null ? null : parameter.trim();
    }

    public Long getValid() {
		return valid;
	}

	public void setValid(Long valid) {
		this.valid = valid;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Folder folder = (Folder) o;

        return oid != null ? oid.equals(folder.oid) : folder.oid == null;

    }

    @Override
    public int hashCode() {
        return oid != null ? oid.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "Folder{" +
                "oid='" + oid + '\'' +
                ", id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", parent='" + parent + '\'' +
                ", creator='" + creator + '\'' +
                ", createdate=" + createdate +
                ", isExtended=" + isExtended +
                ", isAddByProcess=" + isAddByProcess +
                ", isUpdateByProcess=" + isUpdateByProcess +
                ", isInvalidByProcess=" + isInvalidByProcess +
                ", snruledef='" + snruledef + '\'' +
                ", versiondef='" + versiondef + '\'' +
                ", parameter='" + parameter + '\'' +
                '}';
    }


}