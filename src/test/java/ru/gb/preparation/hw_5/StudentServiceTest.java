package ru.gb.preparation.hw_5;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Random;

import static org.junit.jupiter.api.Assertions.*;

class StudentServiceTest {

    private static StudentService service;
    private static Random rnd;

    @BeforeAll
    public static void init() {
        service = new StudentService();
        rnd = new Random();
    }

    @BeforeEach
    public void clean() {
        service.deleteAll();
    }

    @Test
    void add() {
        service.add(generateStudent());
        assertEquals(1, service.findAll().size());
    }

    @Test
    void delete() {
//        given
        Student student = generateStudent();
        service.add(student);

//        when
        service.delete(student);

//        then
        assertEquals(0, service.findAll().size());
    }

    @Test
    void update() {
        //        given
        Student student = generateStudent();
        service.add(student);
        String newName = "Maike";
        Mark newMark = Mark.A;

        //  when
        Student changing = service.findAll().get(0);
        long id = changing.getId();
        changing.setMark(newMark);
        changing.setName(newName);
        service.update(changing);

//        then
        Student changed = service.findById(id);
        assertEquals(changing, changed);
    }

    @Test
    void findById() {
//        given
        Student student = generateStudent();
        service.add(student);

//        when
        Student expected = service.findAll().get(0);
        long id = expected.getId();

//        then
        Student checking = service.findById(id);
        assertEquals(expected, checking);
    }


    @Test
    void findAll() {
//        when
        int amount = 1000;
        service.addThousand(
                StudentServiceTest::generateStudent,
                amount);
//        then
        assertEquals(amount, service.findAll().size());
    }

    @Test
    void deleteAll() {
//        given
        int amount = 1000;
        service.addThousand(
                StudentServiceTest::generateStudent,
                amount);
//        when
        service.deleteAll();

//        then
        assertEquals(0, service.findAll().size());

    }

    private static Student generateStudent() {
        return new Student("Student #" + rnd.nextInt(), Mark.getRandomMark());
    }

}