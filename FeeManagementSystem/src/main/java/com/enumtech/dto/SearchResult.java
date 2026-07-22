package com.enumtech.dto;

import java.util.List;
import java.util.Map;

import com.enumtech.entity.Student;

public class SearchResult {
    public List<Student> students;
    public int total;
    public int hostaliteCount;
    public int dayScholarCount;
    public Map<String, Long> courseCount;
}

