package com.icia.member.srevice;

import com.icia.member.dto.BoardDTO;
import com.icia.member.dto.BoardFileDTO;
import com.icia.member.respository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void write(BoardDTO boardDTO) throws IOException {
        if (boardDTO.getBoardFile().isEmpty()) {
            boardDTO.setBoardFileAttached(0);
            boardRepository.write(boardDTO);
        } else {
            boardDTO.setBoardFileAttached(1);
            BoardDTO savedBoard = boardRepository.write(boardDTO);
            for (MultipartFile boardFile : boardDTO.getBoardFile()) {
                String originalFilename1 = boardFile.getOriginalFilename();
                System.out.println("originalFilename1 = " + originalFilename1);
                System.out.println(System.currentTimeMillis());
                String storedFileName1 = System.currentTimeMillis() + "-" + originalFilename1;
                System.out.println("storedFileName1 = " + storedFileName1);
                BoardFileDTO boardFileDTO = new BoardFileDTO();
                boardFileDTO.setOriginalFileName1(originalFilename1);
                boardFileDTO.setStoredFileName1(storedFileName1);
                boardFileDTO.setBoardId(savedBoard.getId());
                String savePath = "D:\\spring_img\\" + storedFileName1;
                boardFile.transferTo(new File(savePath));
                boardRepository.saveFile(boardFileDTO);
            }
        }
    }

    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }

    public BoardDTO findById(Long id) {
        return boardRepository.findById(id);
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }

    public List<BoardFileDTO> findFile(Long id) {
        return boardRepository.findFile(id);
    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }

    public void delete(Long id) {
        boardRepository.delete(id);
    }
}