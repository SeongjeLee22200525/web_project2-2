package com.webservice.webproject22.dao;

import com.webservice.webproject22.common.JDBCUtil;
import com.webservice.webproject22.vo.BoardVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {

    // INSERT
    public int insertBoard(BoardVO vo) {
        String sql = "INSERT INTO BOARD(title, writer, category, content) VALUES(?,?,?,?)";

        try {
            Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getCategory());
            pstmt.setString(4, vo.getContent());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    // UPDATE
    public int updateBoard(BoardVO vo) {
        String sql = "UPDATE BOARD SET title=?, writer=?, category=?, content=? WHERE id=?";

        try {
            Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getCategory());
            pstmt.setString(4, vo.getContent());
            pstmt.setInt(5, vo.getId());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    // DELETE
    public int deleteBoard(BoardVO vo) {
        String sql = "DELETE FROM BOARD WHERE id=?";

        try {
            Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, vo.getId());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // SELECT ONE
    public BoardVO selectBoard(BoardVO vo) {
        String sql = "SELECT * FROM BOARD WHERE id=?";
        BoardVO board = null;

        try {
            Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, vo.getId());
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                board = new BoardVO(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getString("category"),
                        rs.getString("content"),
                        rs.getString("regdate"),
                        rs.getInt("cnt")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return board;
    }


    // SELECT LIST
    public List<BoardVO> selectBoardList(String category, String title) {
        List<BoardVO> list = new ArrayList<>();
        String sql = "SELECT * FROM BOARD WHERE 1=1";

        if (category != null && !category.isEmpty()) {
            sql += " AND category = ?";
        }

        if (title != null && !title.isEmpty()) {
            sql += " AND title LIKE ?";
        }

        sql += " ORDER BY id DESC";

        try {
            Connection conn = JDBCUtil.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);

            int idx = 1;

            if (category != null && !category.isEmpty()) {
                pstmt.setString(idx++, category);
            }

            if (title != null && !title.isEmpty()) {
                pstmt.setString(idx++, "%" + title + "%");
            }

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardVO vo = new BoardVO(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("writer"),
                        rs.getString("category"),
                        rs.getString("content"),
                        rs.getString("regdate"),
                        rs.getInt("cnt")
                );
                list.add(vo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
