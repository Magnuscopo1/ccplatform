package com.common.model;

public class Product {
    private int id;
    private String name, image, category;
    private double price;

    public Product(int id, String name, double price, String image, String category) {
        this.id = id; this.name = name; this.price = price; this.image = image; this.category = category;
    }
    public int getId() { return id; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public String getImage() { return image; }
}