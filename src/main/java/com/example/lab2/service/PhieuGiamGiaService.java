package com.example.lab2.service;


import com.example.lab2.model.PhieuGiamGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.sql.Date;

public interface PhieuGiamGiaService  {
    Page<PhieuGiamGia> findAll(int page);
    public  void save(PhieuGiamGia phieuGiamGia);
    PhieuGiamGia detail(String ma);
    void delete(String ma);
    Page<PhieuGiamGia> findAllByNgayBatDauAfterAndNgayKetThucBeforeAndKhachHang_MaKhachHang(Date bd, Date kt, int ma, int  page);


}
