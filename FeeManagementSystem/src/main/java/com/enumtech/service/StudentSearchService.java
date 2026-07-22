package com.enumtech.service;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.enumtech.dao.GetStudent;
import com.enumtech.dto.SearchResult;
import com.enumtech.entity.DayScholar;
import com.enumtech.entity.Hostalite;
import com.enumtech.entity.Student;

public class StudentSearchService {

    public SearchResult search(
            String[] types,
            String state,
            String city,
            String course,
            String sortBy,
            String order,
            Integer limit) {

        // 1️⃣ Fetch all students (Hibernate)
        List<Student> students = GetStudent.getAllStudents();

        // 2️⃣ Apply STREAMS
        Stream<Student> stream = students.stream();

        // Student Type
        if (types != null) {
        	
        	// Below line only gets printed when Pipeline added & note when actual Execution starts.
        	System.out.println("Type stream executed");
            stream = stream.filter(s ->
                    Arrays.stream(types).anyMatch(t ->
                            (t.equals("HOSTALITE") && s instanceof Hostalite)  || (t.equals("DAYSCHOLAR") && s instanceof DayScholar)
                    ));
        }

        // Location
        if (state != null && !state.isEmpty()) {
        	System.out.println("State stream executed");
        	stream = stream.filter(s -> state.equalsIgnoreCase(s.getState()));
        }

        if (city != null && !city.isEmpty()) {
        	System.out.println("City stream executed");
        	stream = stream.filter(s -> city.equalsIgnoreCase(s.getCity()));
        }

        // Course
        if (course != null && !course.isEmpty()) {
        	System.out.println("Course stream executed");
        	stream = stream.filter(s -> course.equalsIgnoreCase(s.getCourse()));
        	
        }

        // Fees %
//        if (minPercent != null)
//            stream = stream.filter(s -> (s.getTotalFees() * 100 / s.getBaseFees()) >= minPercent);
//
//        if (maxPercent != null)
//            stream = stream.filter(s -> (s.getTotalFees() * 100 / s.getBaseFees()) <= maxPercent);

        // Sorting
        if ("fees".equals(sortBy)) {
        	System.out.println("Sorting stream executed");
            stream = "desc".equals(order)
                    ? stream.sorted(Comparator.comparing(Student::getTotalFees).reversed())
                    : stream.sorted(Comparator.comparing(Student::getTotalFees));
        }

        // Limit
        if (limit != null) {
        	System.out.println("Limit stream executed");
        	stream = stream.limit(limit);
        }

        System.out.println("STREAMS EXECUTION STARTS");
        List<Student> filtered = stream.toList();

        // 3️⃣ METADATA (STREAMS AGAIN)
        SearchResult result = new SearchResult();
        result.students = filtered;
        result.total = filtered.size();
        result.hostaliteCount =
                (int) filtered.stream().filter(s -> s instanceof Hostalite).count();
        result.dayScholarCount =
                (int) filtered.stream().filter(s -> s instanceof DayScholar).count();

        result.courseCount =
                filtered.stream()
                        .collect(Collectors.groupingBy(
                                Student::getCourse,
                                Collectors.counting()));

        return result;
    }
}
