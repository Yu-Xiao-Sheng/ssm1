package com.yg.Bean;

public class Book {
    private int id;
    private String title;
    private String author;
    private Double price;

    public Book() {
    }

    public Book(int id, String title, String author, Double peice) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.price = peice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", peice=" + price +
                '}';
    }
}
