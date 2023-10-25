package com.example.lab2.service.impl;


import com.example.lab2.model.PhieuGiamGia;
import com.example.lab2.respon.PhieuGiamGiaRespon;
import com.example.lab2.service.PhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;

@Service
public class PhieuGiamGiaServiceImpl implements PhieuGiamGiaService {
    @Autowired
    PhieuGiamGiaRespon phieuGiamGiaRespon;

    @Override
    public Page<PhieuGiamGia> findAll(int page) {
        Pageable pageable = PageRequest.of(page,2);
        return phieuGiamGiaRespon.findAll(pageable);
    }

    @Override
    public void save(PhieuGiamGia phieuGiamGia) {
        phieuGiamGiaRespon.save(phieuGiamGia);
    }

    @Override
    public PhieuGiamGia detail(String ma) {
        return phieuGiamGiaRespon.getById(ma);
    }

    @Override
    public void delete(String ma) {
         phieuGiamGiaRespon.deleteById(ma);
    }

    @Override
    public Page<PhieuGiamGia> findAllByNgayBatDauAfterAndNgayKetThucBeforeAndKhachHang_MaKhachHang(Date bd, Date kt, int ma, int page) {
        Pageable pageable = PageRequest.of(page,2);
        return phieuGiamGiaRespon.findAllByNgayBatDauAfterAndNgayKetThucBeforeAndKhachHang_MaKhachHang(bd,kt,ma,pageable);
    }
}
