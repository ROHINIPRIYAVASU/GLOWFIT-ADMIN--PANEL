package com.glowfit.dao;

import com.glowfit.model.Skincare;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SkincareDAO {

    public List<Skincare> getAllSkincare() {
        List<Skincare> list = new ArrayList<>();
        String sql = "SELECT * FROM skincare ORDER BY id DESC";
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

    public void addSkincare(Skincare s) {
        String sql = "INSERT INTO skincare (skin_type, routine, cleanser, moisturizer) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getSkinType());
            ps.setString(2, s.getRoutine());
            ps.setString(3, s.getCleanser());
            ps.setString(4, s.getMoisturizer());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSkincare(int id) {
        String sql = "DELETE FROM skincare WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getCount() {
        String sql = "SELECT COUNT(*) FROM skincare";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Skincare mapRow(ResultSet rs) throws SQLException {
        return new Skincare(
            rs.getInt("id"),
            rs.getString("skin_type"),
            rs.getString("routine"),
            rs.getString("cleanser"),
            rs.getString("moisturizer")
        );
    }
}
