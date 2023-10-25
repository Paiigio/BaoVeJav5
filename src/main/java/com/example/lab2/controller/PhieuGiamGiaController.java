package com.example.lab2.controller;


import com.example.lab2.model.PhieuGiamGia;
import com.example.lab2.service.KhachHangService;
import com.example.lab2.service.PhieuGiamGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/phieu-giam-gia")
public class PhieuGiamGiaController {
    @Autowired
    PhieuGiamGiaService phieuGiamGiaService;
    @Autowired
    KhachHangService khachHangService;
    @GetMapping("/hien-thi")
    private String hienThi(Model model, @RequestParam(value = "page", defaultValue = "0") int page){
        Page<PhieuGiamGia> list= phieuGiamGiaService.findAll(page);
        model.addAttribute("list",list);
        model.addAttribute("listKH", khachHangService.getAll());
        return "index";
    }
    @GetMapping("/view-update/{maPhieu}")
    private String viewupdate(Model model, @PathVariable("maPhieu") String ma){
        PhieuGiamGia phieuGiamGia= phieuGiamGiaService.detail(ma);
        model.addAttribute("listKH", khachHangService.getAll());
        model.addAttribute("s",phieuGiamGia);
        return "update";
    }
    @GetMapping("/delete/{maPhieu}")
    private String delete(@PathVariable("maPhieu") String ma){
        phieuGiamGiaService.delete(ma);
        return "redirect:/phieu-giam-gia/hien-thi";
    }
    @PostMapping("/update")
    private String update(Model model,@ModelAttribute("s") PhieuGiamGia phieuGiamGia){
        phieuGiamGiaService.save(phieuGiamGia);
        return "redirect:/phieu-giam-gia/hien-thi";
    }
    @GetMapping("/search")
    private String timKiem(@RequestParam("BD")String bd,@RequestParam("KT") String kt,@RequestParam("maKhachHang")
    int ma,@RequestParam(value = "page", defaultValue = "0") int page,Model model) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date= sdf.parse(bd);
        Date date1= sdf.parse(kt);
        java.sql.Date BD = new java.sql.Date(date.getTime());
        java.sql.Date KT = new java.sql.Date(date1.getTime());
        Page<PhieuGiamGia> list=phieuGiamGiaService.findAllByNgayBatDauAfterAndNgayKetThucBeforeAndKhachHang_MaKhachHang(BD,KT,ma,page);
        model.addAttribute("list",list);
        model.addAttribute("listKH", khachHangService.getAll());
       return "index";
    }
}
