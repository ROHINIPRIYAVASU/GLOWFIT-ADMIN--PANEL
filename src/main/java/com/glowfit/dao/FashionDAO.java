package com.glowfit.dao;

import com.glowfit.model.Fashion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FashionDAO {

    public List<Fashion> getAllFashion() {
        List<Fashion> list = new ArrayList<>();
        String sql = "SELECT * FROM fashion ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void addFashion(Fashion f) {
        String sql = "INSERT INTO fashion (body_type, occasion, recommendation) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, f.getBodyType());
            ps.setString(2, f.getOccasion());
            ps.setString(3, f.getRecommendation());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFashion(int id) {
        String sql = "DELETE FROM fashion WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getCount() {
        String sql = "SELECT COUNT(*) FROM fashion";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Fashion mapRow(ResultSet rs) throws SQLException {
        return new Fashion(
            rs.getInt("id"),
            rs.getString("body_type"),
            rs.getString("occasion"),
            rs.getString("recommendation")
        );
    }
}
