package com.digiwin.bpm.inte.model;

import java.util.Date;

public class UploadFile {
    /**
     * null
     */
    private String oid;

    /**
     * null
     */
    private String name;

    /**
     * null
     */
    private String creator;

    /**
     * null
     */
    private Date createdate;

    /**
     * null
     */
    private String contenttype;

    /**
     * null
     */
    private Long filesize;

    /**
     * null
     */
    private String parent;

    /**
     * null
     */
    private String reserv1;

    /**
     * null
     */
    private String reserv2;

    /**
     * null
     */
    private String reserv3;

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

    public String getContenttype() {
        return contenttype;
    }

    public void setContenttype(String contenttype) {
        this.contenttype = contenttype == null ? null : contenttype.trim();
    }

    public Long getFilesize() {
        return filesize;
    }

    public void setFilesize(Long filesize) {
        this.filesize = filesize;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent == null ? null : parent.trim();
    }

    public String getReserv1() {
        return reserv1;
    }

    public void setReserv1(String reserv1) {
        this.reserv1 = reserv1 == null ? null : reserv1.trim();
    }

    public String getReserv2() {
        return reserv2;
    }

    public void setReserv2(String reserv2) {
        this.reserv2 = reserv2 == null ? null : reserv2.trim();
    }

    public String getReserv3() {
        return reserv3;
    }

    public void setReserv3(String reserv3) {
        this.reserv3 = reserv3 == null ? null : reserv3.trim();
    }
}