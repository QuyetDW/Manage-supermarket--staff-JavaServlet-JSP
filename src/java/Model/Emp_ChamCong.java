/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Model.Emp_NhanVien;
import java.util.Date;
/**
 *
 * @author PC
 */
public class Emp_ChamCong extends Emp_NhanVien{
    public int id_chamcong;
    public int manv;
    public String ngay;
    public String giovao;
    public String giora;
    public int sogiolam;
    public Emp_NhanVien NhanVien;

    public Emp_ChamCong(int id_chamcong, int manv, String ngay, String giovao, String giora, int sogiolam) {
        this.id_chamcong = id_chamcong;
        this.manv = manv;
        this.ngay = ngay;
        this.giovao = giovao;
        this.giora = giora;
        this.sogiolam = sogiolam;
    }

    public Emp_ChamCong(int manv, String ngay, String giovao, String giora, int sogiolam) {
        this.manv = manv;
        this.ngay = ngay;
        this.giovao = giovao;
        this.giora = giora;
        this.sogiolam = sogiolam;
    }

    public Emp_ChamCong(int id_chamcong, int manv, String ngay, String giovao, String giora, int sogiolam, Emp_NhanVien NhanVien) {
        this.id_chamcong = id_chamcong;
        this.manv = manv;
        this.ngay = ngay;
        this.giovao = giovao;
        this.giora = giora;
        this.sogiolam = sogiolam;
        this.NhanVien = NhanVien;
    }

    public Emp_ChamCong() {
    }

    public int getId_chamcong() {
        return id_chamcong;
    }

    public void setId_chamcong(int id_chamcong) {
        this.id_chamcong = id_chamcong;
    }

    public int getManv() {
        return manv;
    }

    public void setManv(int manv) {
        this.manv = manv;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getGiovao() {
        return giovao;
    }

    public void setGiovao(String giovao) {
        this.giovao = giovao;
    }

    public String getGiora() {
        return giora;
    }

    public void setGiora(String giora) {
        this.giora = giora;
    }

    public int getSogiolam() {
        return sogiolam;
    }

    public void setSogiolam(int sogiolam) {
        this.sogiolam = sogiolam;
    }


    public Emp_NhanVien getNhanVien() {
        return NhanVien;
    }

    public void setNhanVien(Emp_NhanVien NhanVien) {
        this.NhanVien = NhanVien;
    }

     
}
