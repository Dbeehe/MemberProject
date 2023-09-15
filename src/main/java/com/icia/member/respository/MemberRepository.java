package com.icia.member.respository;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
        System.out.println("insert 전 memberDTO = " + memberDTO);
        sql.insert("Member.save", memberDTO);
        System.out.println("insert 전 memberDTO = " + memberDTO);
        return memberDTO;
    }

    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    public MemberDTO findPass(String memberPassword) {
        return sql.selectOne("Member.findPass", memberPassword);
    }
}
