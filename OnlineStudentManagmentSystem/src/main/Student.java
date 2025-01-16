package main;

public class Student {
    private String name;
    private String email;
    private String phone;
    private String course;
    private int yearOfStudy;

    public Student(String name, String email, String phone, String course, int yearOfStudy) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.course = course;
        this.yearOfStudy = yearOfStudy;
    }

    // Getters for each field
    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getCourse() {
        return course;
    }

    public int getYearOfStudy() {
        return yearOfStudy;
    }
}
