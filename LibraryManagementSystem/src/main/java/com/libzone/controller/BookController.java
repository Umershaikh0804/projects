package com.libzone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.libzone.model.Book;
import com.libzone.model.LibraryDatabase;


@Controller
public class BookController {

	 // Show all books
    @RequestMapping("/books")
    public ModelAndView showAllBooks()
    {
        List<Book> books = LibraryDatabase.books;
        
        ModelAndView mav = new ModelAndView("book-list");
        mav.addObject("books", books);   //like a key value pair
        mav.addObject("totalBooks", books.size());
        return mav;
    }
    
    
    
    // Show add book form
    @RequestMapping("/addBook")
    public ModelAndView showAddBookForm() 
    {
        Book book = new Book();
        book.setBookId(LibraryDatabase.getNextBookId()); // Auto ID set
        
        ModelAndView mav = new ModelAndView("add-book-form");
        mav.addObject("book", book);
        return mav;
    }
    
    
    // Handle book form submission
    @PostMapping("/saveBook")
    public ModelAndView saveBook(Book book) 
    {
        // Add the new book to database
        LibraryDatabase.books.add(book);
        
        ModelAndView mav = new ModelAndView("redirect:/books");
        mav.addObject("message", "Book added successfully!");
        return mav;
    }    
	
}
