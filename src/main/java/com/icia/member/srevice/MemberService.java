package com.icia.member.srevice;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import com.icia.member.respository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        /*
            - 파일 있다.
            1. fileAttached=1, board_table에 저장 후 id값 받아오기
            2. 파일원본 이름 가져오기
            3. 저장용 이름 만들기
            4. 파일 저장용 폴더에 파일 저장 처리
            5. board_file_table에 관련 정보 저장
            - 파일 없다.
                fileAttached=0, 나머지는 기존 방식과 동일
         */
        if(memberDTO.getMemberProfile().isEmpty()){
            // 파일 없다
            memberDTO.setFileAttached(0);
            memberRepository.save(memberDTO);
        }else {
            // 파일 있다.
            memberDTO.setFileAttached(1);
            // 게시글 저장 후 id값 활용을 위해 리턴 받음.
            MemberDTO savedMember = memberRepository.save(memberDTO);
            // 파일만 따로 가져오기
            MultipartFile memberProfile = memberDTO.getMemberProfile();
            // 파일 이름 가져오기
            String originalFilename = memberProfile.getOriginalFilename();
            System.out.println("originalFilename = " + originalFilename);
            // 저장용 이름 만들기
            System.out.println(System.currentTimeMillis());
            String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
            System.out.println("storedFileName = " + storedFileName);
            // BoardFileDTO 세팅
            MemberFileDTO memberFileDTO = new MemberFileDTO();
            memberFileDTO.setOriginalFileName(originalFilename);
            memberFileDTO.setStoredFileName(storedFileName);
            memberFileDTO.setMemberId(savedMember.getId());
            // 파일 저장용 폴더에 파일 저장 처리
            String savePath = "D:\\spring_img\\" + storedFileName;
            memberProfile.transferTo(new File(savePath));
            // board_file_table 저장 처리
            memberRepository.saveFile(memberFileDTO);
        }
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

    public boolean findPass(String memberPassword) {
        MemberDTO dto = memberRepository.findPass(memberPassword);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }


}
