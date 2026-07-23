package com.libzone.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.libzone.model.Book;
import com.libzone.model.LibraryDatabase;
import com.libzone.model.Member;
import com.libzone.model.Transaction;

@Controller
public class TransactionController {

	 // Show issue book form
    @RequestMapping("/issueBook")
    public ModelAndView showIssueBookForm()
    {
        // Get available books and members
        List<Book> availableBooks = LibraryDatabase.books.stream()
                .filter(Book::getIsAvailable)
                .collect(Collectors.toList());
                
        List<Member> allMembers = LibraryDatabase.members;
        
        ModelAndView mav = new ModelAndView("issue-book-form");
        mav.addObject("availableBooks", availableBooks);
        mav.addObject("allMembers", allMembers);
        mav.addObject("transaction", new Transaction());
        return mav;
    }
    
    
    
    // Handle book issue
    @PostMapping("/issueBook")
    public ModelAndView issueBook(@RequestParam int bookId, @RequestParam int memberId)
    {
        Book book = LibraryDatabase.findBookById(bookId);
        Member member = LibraryDatabase.findMemberById(memberId);
        
        ModelAndView mav = new ModelAndView();
        
        if (book != null && member != null && book.getIsAvailable()) 
        {
            // Create transaction
            Transaction transaction = new Transaction(
                LibraryDatabase.getNextTransactionId(), book, member
            );
            
            // Update book status
            book.setIsAvailable(false);
            
            // Update member's issued books count
            member.setBooksIssued(member.getBooksIssued() + 1);
            
            // Save transaction
            LibraryDatabase.transactions.add(transaction);
            
            mav.setViewName("redirect:/transactions");
            mav.addObject("message", "Book '" + book.getTitle() + "' issued to " + member.getName());
        } 
        else 
        {
            mav.setViewName("issue-book-form");
            mav.addObject("error", "Book not available or invalid selection!");
        }
        
        return mav;
    }
    
    
    
    // Show all transactions
    @RequestMapping("/transactions")
    public ModelAndView showAllTransactions()
    {
        List<Transaction> transactions = LibraryDatabase.transactions;
        
        ModelAndView mav = new ModelAndView("transaction-list");
        mav.addObject("transactions", transactions);
        mav.addObject("activeTransactions", 
            transactions.stream().filter(t -> t.getStatus().equals("ISSUED")).count());
        return mav;
    }
    
    
    
    // Show return book form
    @RequestMapping("/returnBook")
    public ModelAndView showReturnBookForm()
    {
        // Get issued books only
        List<Transaction> issuedTransactions = LibraryDatabase.transactions.stream()
                .filter(t -> t.getStatus().equals("ISSUED"))
                .collect(Collectors.toList());
        
        ModelAndView mav = new ModelAndView("return-book-form");
        mav.addObject("issuedTransactions", issuedTransactions);
        return mav;
    }
    
    
    
    // Handle book return
    @PostMapping("/returnBook")
    public ModelAndView returnBook(@RequestParam int transactionId)
    {
        Transaction transaction = LibraryDatabase.transactions.stream()
                .filter(t -> t.getTransactionId() == transactionId)
                .findFirst()
                .orElse(null);
        
        ModelAndView mav = new ModelAndView();
        
        if (transaction != null && transaction.getStatus().equals("ISSUED"))
        {
            // Update transaction
            transaction.setReturnDate(new java.util.Date());
            transaction.setStatus("RETURNED");
            transaction.calculateFine();
            
            // Update book status
            transaction.getBook().setIsAvailable(true);
            
            // Update member's issued books count
            transaction.getMember().setBooksIssued(
                transaction.getMember().getBooksIssued() - 1
            );
            
            mav.setViewName("redirect:/transactions");
            mav.addObject("message", "Book returned successfully!" + 
                (transaction.getFineAmount() > 0 ? 
                 " Fine: ₹" + transaction.getFineAmount() : ""));
        }
        else
        {
            mav.setViewName("return-book-form");
            mav.addObject("error", "Invalid transaction selection!");
        }
        
        return mav;
    }
	
}
