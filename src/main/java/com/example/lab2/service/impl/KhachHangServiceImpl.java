package com.example.lab2.service.impl;

import com.example.lab2.model.KhachHang;
import com.example.lab2.respon.KhachHangRespon;
import com.example.lab2.service.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class KhachHangServiceImpl  implements KhachHangService {
    @Autowired
    KhachHangRespon khachHangRespon;
    @Override
    public List<KhachHang> getAll() {
        return khachHangRespon.findAll();
    }
}
