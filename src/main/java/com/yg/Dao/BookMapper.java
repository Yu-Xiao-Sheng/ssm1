package com.yg.Dao;

import com.yg.Bean.Book;

import java.util.List;

public interface BookMapper {
    int saveBook(Book book);

    Book findById(int id);

    List<Book> findAll();

    Integer update(Book book);

    Integer delete(Integer id);
}
