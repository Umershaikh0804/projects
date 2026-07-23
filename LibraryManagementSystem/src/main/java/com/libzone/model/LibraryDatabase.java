package com.libzone.model;

import java.util.ArrayList;
import java.util.List;

public class LibraryDatabase
{
    // Static lists for in-memory storage
    public static List<Book> books = new ArrayList<>();
    public static List<Member> members = new ArrayList<>();
    public static List<Transaction> transactions = new ArrayList<>();
    
    
    // Counter for IDs
    private static int bookIdCounter = 1;
    private static int memberIdCounter = 1;
    private static int transactionIdCounter = 1;
    
    
    // Initialize with sample data
    static
    {
        // Add sample books
        books.add(new Book(bookIdCounter++, "Java Programming", "James Gosling", "978-0134685991"));
        books.add(new Book(bookIdCounter++, "Spring MVC Guide", "Rod Johnson", "978-1118310330"));
        books.add(new Book(bookIdCounter++, "Database Systems", "Ramez Elmasri", "978-0133970777"));
        books.add(new Book(bookIdCounter++, "Head First Java", "Kathy Sierra", "978-0596009205"));
        books.add(new Book(bookIdCounter++, "Clean Code", "Robert Martin", "978-0132350884"));
        
        // Add sample members
        members.add(new Member(memberIdCounter++, "Amit Kumar", "amit@email.com", "9876543210"));
        members.add(new Member(memberIdCounter++, "Priya Singh", "priya@email.com", "9876543211"));
        members.add(new Member(memberIdCounter++, "Rahul Sharma", "rahul@email.com", "9876543212"));
        members.add(new Member(memberIdCounter++, "Neha Gupta", "neha@email.com", "9876543213"));
    }
    
    
    // Method to get next book ID
    public static int getNextBookId()
    {
        return bookIdCounter++;
    }
    
    // Method to get next member ID
    public static int getNextMemberId()
    {
        return memberIdCounter++;
    }
    
    // Method to get next transaction ID
    public static int getNextTransactionId()
    {
        return transactionIdCounter++;
    }
    
    
    // Method to find book by ID
    public static Book findBookById(int bookId)
    {
        for (Book book : books)
        {
            if (book.getBookId() == bookId)
            {
                return book;
            }
        }
        return null;
    }
    
    
    
    // Method to find member by ID
    public static Member findMemberById(int memberId) 
    {
        for (Member member : members) 
        {
            if (member.getMemberId() == memberId) 
            {
                return member;
            }
        }
        return null;
    }
}