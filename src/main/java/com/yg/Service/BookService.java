package com.yg.Service;

import com.yg.Bean.Book;

import java.util.List;

public interface BookService {
    Integer saveBook(Book book);

    Book getBook(int id);

    List<Book> getAllBooks();

    Integer updateBook(Book book);

    Integer deleteBook(Integer id);

}
