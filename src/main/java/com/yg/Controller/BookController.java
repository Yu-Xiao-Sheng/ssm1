package com.yg.Controller;

import com.yg.Bean.Book;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {

    @GetMapping("/bookForm")
    public String bookForm(Book book){
        return "bookForm";
    }
}
