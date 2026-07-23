package com.libzone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.libzone.model.LibraryDatabase;

@Controller
public class HomeController {
    
	
    @RequestMapping("/")
    public ModelAndView home()
    {
        // REAL-TIME DATA from LibraryDatabase
        int totalBooks = LibraryDatabase.books.size();
        int totalMembers = LibraryDatabase.members.size();
        
//        //  Count available books
//        long availableBooks = LibraryDatabase.books.stream()
//                .filter(book -> book.getIsAvailable())
//                .count();
        
//        //  Count issued books
//        long issuedBooks = totalBooks - availableBooks;
//        
//        //Count active transactions (issued but not returned)
//        long activeTransactions = LibraryDatabase.transactions.stream()
//                .filter(transaction -> "ISSUED".equals(transaction.getStatus()))
//                .count();

        ModelAndView mav = new ModelAndView("home");
        mav.addObject("tagline", "Where Every Book Finds Its Zone");
        mav.addObject("totalBooks", totalBooks);           //Real total books
        mav.addObject("totalMembers", totalMembers);       //Real total members
//        mav.addObject("availableBooks", availableBooks);   //Available books count
//        mav.addObject("issuedBooks", issuedBooks);         //Issued books count
//        mav.addObject("activeTransactions", activeTransactions);  //Active issues
        return mav;
    }
    
    
    
    @RequestMapping("/home")
    public ModelAndView showHome() 
    {
        return home();
    }
}