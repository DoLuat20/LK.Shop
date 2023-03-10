package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.Product;
import com.service.Service_Product;
import com.service.SessionService;

@Controller
public class Controller_Home {
    @Autowired private Service_Product daoPD;
    
    @Autowired private SessionService session;
    
	@GetMapping({"","home/index"})
	public String home(Model model) {
	    List<Product> list = daoPD.findNewProducts();
        if(list != null) {
            model.addAttribute("items",list);
        }

		return "layout/trangchu";
	}

    @GetMapping("home/galary")
    public String galary(){
        return "layout/galary";
    }
	
	@GetMapping({"admin","admin/home/index"})
	public String admin() {
		return "redirect:/assets/admin/index.html";
	}
	@PostMapping({"user","user/home/index"})
	public String user(){
		return "user";
	}
}
