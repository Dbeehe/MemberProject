package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.srevice.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String saveForm(){
        return "memberPages/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "redirect:/member/Login";
    }

    @GetMapping("/login")
    public String loginForm(){
        return "memberPages/memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session, Model model){
        boolean loginResult = memberService.login(memberDTO);
        if(loginResult){
            session.setAttribute("loginEmail",memberDTO.getMemberEmail());
            model.addAttribute("email",memberDTO.getMemberEmail());
            return "boardPages/boardList"; // redirect로 바꾸기
        }else{
            return "memberPages/memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logoutForm(){
        return "memberPages/memberLogout";
    }

    @PostMapping("/logout")
    public String logout(@RequestParam("memberPassword")String memberPassword ,HttpSession session){
        boolean logoutResult = memberService.findPass(memberPassword);
        if(logoutResult){
            session.removeAttribute("loginEmail");
            return "redirect:/";
        }else {
            return  "redirect:/member/logout";
        }
    }

}
