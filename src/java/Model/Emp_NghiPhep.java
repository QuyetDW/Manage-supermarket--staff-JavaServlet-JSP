/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Emp_NghiPhep {
    private int id;
    private int manv;
    private String ngaynghi;
    private String lydo;
    private String trangthai;
    
    public Emp_NghiPhep(){
    }

    public Emp_NghiPhep(int id, int manv, String ngaynghi, String lydo, String trangthai) {
        this.id = id;
        this.manv = manv;
        this.ngaynghi = ngaynghi;
        this.lydo = lydo;
        this.trangthai = trangthai;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getManv() {
        return manv;
    }

    public void setManv(int manv) {
        this.manv = manv;
    }

    public String getNgaynghi() {
        return ngaynghi;
    }

    public void setNgaynghi(String ngaynghi) {
        this.ngaynghi = ngaynghi;
    }

    public String getLydo() {
        return lydo;
    }

    public void setLydo(String lydo) {
        this.lydo = lydo;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    @Override
    public String toString() {
        return "Emp_NghiPhep{" + "id=" + id + ", manv=" + manv + ", ngaynghi=" + ngaynghi + ", lydo=" + lydo + ", trangthai=" + trangthai + '}';
    }
    
}
