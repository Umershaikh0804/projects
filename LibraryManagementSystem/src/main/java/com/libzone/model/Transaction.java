package com.libzone.model;

import java.util.Date;

public class Transaction 
{
    private int transactionId;
    private Book book;
    private Member member;
    private Date issueDate;
    private Date dueDate;
    private Date returnDate;
    private double fineAmount;
    private String status; // ISSUED, RETURNED, OVERDUE
    
    
    
    // Default Constructor
    public Transaction()
    {
        this.issueDate = new Date();
        this.status = "ISSUED";
        this.fineAmount = 0.0;
        
        
        // Set due date to 15 days from issue date
        long dueTime = issueDate.getTime() + (15 * 24 * 60 * 60 * 1000L); // 15 days in milliseconds
        this.dueDate = new Date(dueTime);
    }
    
    // Parameterized Constructor for issue
    public Transaction(int transactionId, Book book, Member member) 
    {
        this();
        this.transactionId = transactionId;
        this.book = book;
        this.member = member;
    }
    
    
    // Getters and Setters
    public int getTransactionId()
    {
        return transactionId;
    }
    
    public void setTransactionId(int transactionId)
    {
        this.transactionId = transactionId;
    }
    
    public Book getBook()
    {
        return book;
    }
    
    public void setBook(Book book) 
    {
        this.book = book;
    }
    
    public Member getMember() 
    {
        return member;
    }
    
    public void setMember(Member member) 
    {
        this.member = member;
    }
    
    public Date getIssueDate() 
    {
        return issueDate;
    }
    
    public void setIssueDate(Date issueDate)
    {
        this.issueDate = issueDate;
    }
    
    public Date getDueDate()
    {
        return dueDate;
    }
    
    public void setDueDate(Date dueDate) 
    {
        this.dueDate = dueDate;
    }
    
    public Date getReturnDate()
    {
        return returnDate;
    }
    
    public void setReturnDate(Date returnDate)
    {
        this.returnDate = returnDate;
    }
    
    public double getFineAmount() 
    {
        return fineAmount;
    }
    
    public void setFineAmount(double fineAmount)
    {
        this.fineAmount = fineAmount;
    }
    
    public String getStatus()
    {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
        
    }
    
    
    // Method to calculate fine
    public void calculateFine()
    {
        if (returnDate != null && returnDate.after(dueDate)) 
        {
            long diff = returnDate.getTime() - dueDate.getTime();
            long daysOverdue = diff / (24 * 60 * 60 * 1000);
            this.fineAmount = daysOverdue * 10; // ₹10 per day fine
        }
    }
    
    
    
    @Override
    public String toString()
    {
        return "Transaction [transactionId=" + transactionId + ", book=" + book.getTitle() + 
               ", member=" + member.getName() + ", status=" + status + ", fine=" + fineAmount + "]";
    }
    
}
