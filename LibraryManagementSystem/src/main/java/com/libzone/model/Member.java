package com.libzone.model;

import java.util.Date;

public class Member {
    private int memberId;
    private String name;
    private String email;
    private String phone;
    private Date joinDate;
    private int booksIssued;
    
    
    
    // Default Constructor
    public Member() 
    {
        this.joinDate = new Date();
        this.booksIssued = 0;
    }
    
    
    
    // Parameterized Constructor
    public Member(int memberId, String name, String email, String phone) 
    {
        this();
        this.memberId = memberId;
        this.name = name;
        this.email = email;
        this.phone = phone;
    }
    
    
    
    // Getters and Setters
    public int getMemberId()
    {
        return memberId;
    }
    
    public void setMemberId(int memberId) 
    {
        this.memberId = memberId;
    }
    
    public String getName()
    {
        return name;
    }
    
    public void setName(String name)
    {
        this.name = name;
    }
    
    public String getEmail()
    {
        return email;
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }
    
    public String getPhone()
    {
        return phone;
    }
    
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }
    
    public Date getJoinDate() 
    {
        return joinDate;
    }
    
    public void setJoinDate(Date joinDate)
    {
        this.joinDate = joinDate;
    }
    
    public int getBooksIssued()
    {
        return booksIssued;
    }
    
    public void setBooksIssued(int booksIssued)
    {
        this.booksIssued = booksIssued;
    }
    
    
    
    @Override
    public String toString() 
    {
        return "Member [memberId=" + memberId + ", name=" + name + ", email=" + email + 
               ", phone=" + phone + ", booksIssued=" + booksIssued + "]";
    }
    
    
}