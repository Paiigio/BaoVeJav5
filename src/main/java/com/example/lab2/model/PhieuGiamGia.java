package com.example.lab2.model;

import jakarta.persistence.*;
import lombok.Data;
import java.sql.Date;


@Table(name = "PhieuGiamGia")
@Entity
@Data
public class PhieuGiamGia {
    @Id
    private String maPhieu;
    private String tenPhieu;
    private Date ngayBatDau;
    private Date ngayKetThuc;
    private Double giaTriGiam;
    private Double giaTriGiamToiDa;
    private int trangThai;
    @ManyToOne
    @JoinColumn(name="NguoiSoHuu")
    private KhachHang khachHang;
}
