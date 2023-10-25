package com.example.lab2.respon;

import com.example.lab2.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface KhachHangRespon extends JpaRepository<KhachHang,Integer> {
}
