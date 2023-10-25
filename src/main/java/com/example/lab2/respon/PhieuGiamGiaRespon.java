package com.example.lab2.respon;

import com.example.lab2.model.PhieuGiamGia;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.sql.Date;

@Repository
public interface PhieuGiamGiaRespon extends JpaRepository<PhieuGiamGia,String> {
    Page<PhieuGiamGia> findAll(Pageable pageable);
    Page<PhieuGiamGia> findAllByNgayBatDauAfterAndNgayKetThucBeforeAndKhachHang_MaKhachHang(Date bd,Date kt,int ma,Pageable pageable);
    Page<PhieuGiamGia> findAllByMaPhieu(int ma,Pageable pageable);
}
