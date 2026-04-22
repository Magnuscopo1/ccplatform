package com.backend.dao;
import com.backend.util.DBConnection;
import com.common.model.Product;

import java.sql.*;
import java.util.*;

public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM store_items");
            while (rs.next()) {
                list.add(new Product(rs.getInt("item_id"), rs.getString("item_name"), rs.getDouble("item_price"), rs.getString("item_image_url"), rs.getString("item_category")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public Product getProductById(int id) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM store_items WHERE item_id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return new Product(rs.getInt("item_id"), rs.getString("item_name"), rs.getDouble("item_price"), rs.getString("item_image_url"), rs.getString("item_category"));
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}