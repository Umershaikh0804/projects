package com.libzone.model;

import java.util.Date;

public class Book
{
    private int bookId;
    private String title;
    private String author;
    private String isbn;
    private boolean isAvailable;
    private Date addedDate;
    
    
    // Default Constructor
    public Book() 
    {
        this.isAvailable = true;
        this.addedDate = new Date();
    }
    
    
    // Parameterized Constructor
    public Book(int bookId, String title, String author, String isbn)
    {
        this();
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }
    
    
    
    // Getters and Setters
    public int getBookId() 
    {
        return bookId;
    }
    
    public void setBookId(int bookId) 
    {
        this.bookId = bookId;
    }
    
    public String getTitle() 
    {
        return title;
    }
    
    public void setTitle(String title)
    {
        this.title = title;
    }
    
    public String getAuthor() 
    {
        return author;
    }
    
    public void setAuthor(String author)
    {
        this.author = author;
    }
    
    public String getIsbn() 
    {
        return isbn;
    }
    
    public void setIsbn(String isbn) 
    {
        this.isbn = isbn;
    }
    
    public boolean getIsAvailable() 
    {
        return isAvailable;
    }
    
    public void setIsAvailable(boolean isAvailable) 
    {
        this.isAvailable = isAvailable;
    }
    
    public Date getAddedDate()
    {
        return addedDate;
    }
    
    public void setAddedDate(Date addedDate) 
    {
        this.addedDate = addedDate;
    }
    
    
    
    @Override
    public String toString() 
    {
        return "Book [bookId=" + bookId + ", title=" + title + ", author=" + author + 
               ", isbn=" + isbn + ", isAvailable=" + isAvailable + "]";
    }
    
}