package com.yg.Service;

import com.yg.Bean.Book;
import com.yg.Dao.BookMapper;

import java.util.List;

public class BookServiceImpl implements BookService{

    private BookMapper bookMapper;

    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public Integer saveBook(Book book) {
        return bookMapper.saveBook(book);
    }

    @Override
    public Book getBook(int id) {
        return bookMapper.findById(id);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookMapper.findAll();
    }

    @Override
    public Integer updateBook(Book book) {
        return bookMapper.update(book);
    }

    @Override
    public Integer deleteBook(Integer id) {
        return bookMapper.delete(id);
    }
}
