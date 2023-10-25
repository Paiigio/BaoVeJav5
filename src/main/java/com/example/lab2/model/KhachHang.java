package com.example.lab2.model;

import jakarta.persistence.*;
import lombok.Data;

@Table(name="KhachHang")
@Entity
@Data
public class KhachHang {
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int maKhachHang;
    private String tenKhachHang;
}
