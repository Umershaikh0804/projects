package com.libzone.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.libzone.model.LibraryDatabase;
import com.libzone.model.Member;

@Controller
public class MemberController {

	
	 // Show all members
    @RequestMapping("/members")
    public ModelAndView showAllMembers() 
    {
        List<Member> members = LibraryDatabase.members;
        
        ModelAndView mav = new ModelAndView("member-list");
        mav.addObject("members", members);
        mav.addObject("totalMembers", members.size());
        return mav;
    }
    
    
    
    // Show add member form
    @RequestMapping("/addMember")
    public ModelAndView showAddMemberForm() 
    {
        Member member = new Member();
        member.setMemberId(LibraryDatabase.getNextMemberId()); // Auto ID set
        
        ModelAndView mav = new ModelAndView("add-member-form");
        mav.addObject("member", member);
        return mav;
    }
    
    
    
    // Handle member form submission
    @PostMapping("/saveMember")
    public ModelAndView saveMember(Member member)
    {
        // Add the new member to database
        LibraryDatabase.members.add(member);
        
        ModelAndView mav = new ModelAndView("redirect:/members");
        mav.addObject("message", "Member '" + member.getName() + "' added successfully!");
        return mav;
    }
}
