/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.mysql.cj.xdevapi.Type;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author PC
 */
public class Emp_Luong {
    public int id_luong,manv;
    public String ngayluong;
    public int luongcoban, luongtheogio;
    public int sogiolam;
    public int songaynghi;
    public int luongthuong;
    public int luongtong;

    public Emp_Luong(int manv, String ngayluong, int luongcoban, int luongtheogio, int sogiolam, int songaynghi, int luongthuong, int luongtong) {
        this.manv = manv;
        this.ngayluong = ngayluong;
        this.luongcoban = luongcoban;
        this.luongtheogio = luongtheogio;
        this.sogiolam = sogiolam;
        this.songaynghi = songaynghi;
        this.luongthuong = luongthuong;
        this.luongtong = luongtong;
    }

    public Emp_Luong(int id_luong, int manv, String ngayluong, int luongcoban, int luongtheogio, int sogiolam, int songaynghi, int luongthuong, int luongtong) {
        this.id_luong = id_luong;
        this.manv = manv;
        this.ngayluong = ngayluong;
        this.luongcoban = luongcoban;
        this.luongtheogio = luongtheogio;
        this.sogiolam = sogiolam;
        this.songaynghi = songaynghi;
        this.luongthuong = luongthuong;
        this.luongtong = luongtong;
    }

    public Emp_Luong() {
    }

    public int getId_luong() {
        return id_luong;
    }

    public void setId_luong(int id_luong) {
        this.id_luong = id_luong;
    }

    public int getManv() {
        return manv;
    }

    public void setManv(int manv) {
        this.manv = manv;
    }

    public String getNgayluong() {
        return ngayluong;
    }

    public void setNgayluong(String ngayluong) {
        this.ngayluong = ngayluong;
    }

    public int getLuongcoban() {
        return luongcoban;
    }

    public void setLuongcoban(int luongcoban) {
        this.luongcoban = luongcoban;
    }

    public int getLuongtheogio() {
        return luongtheogio;
    }

    public void setLuongtheogio(int luongtheogio) {
        this.luongtheogio = luongtheogio;
    }

    public int getSogiolam() {
        return sogiolam;
    }

    public void setSogiolam(int sogiolam) {
        this.sogiolam = sogiolam;
    }

    public int getSongaynghi() {
        return songaynghi;
    }

    public void setSongaynghi(int songaynghi) {
        this.songaynghi = songaynghi;
    }

    public int getLuongthuong() {
        return luongthuong;
    }

    public void setLuongthuong(int luongthuong) {
        this.luongthuong = luongthuong;
    }

    public int getLuongtong() {
        return luongtong;
    }

    public void setLuongtong(int luongtong) {
        this.luongtong = luongtong;
    }
  
    
}
