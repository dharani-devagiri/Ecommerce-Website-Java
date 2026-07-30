package com.ecommerce;

public class Product {

    private int id;
    private String name;
    private String category;
    private double price;
    private String image;
    private String description;


    public Product(int id, String name, String category,
                   double price, String image, String description) {

        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.description = description;

    }


    public int getId() {
        return id;
    }


    public String getName() {
        return name;
    }


    public String getCategory() {
        return category;
    }


    public double getPrice() {
        return price;
    }


    public String getImage() {
        return image;
    }


    public String getDescription() {
        return description;
    }

}