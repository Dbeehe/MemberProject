package com.icia.member.controller;

import com.icia.member.srevice.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/membe r")
public class MemberController {
    @Autowired
    private MemberService memberService;

    
}
