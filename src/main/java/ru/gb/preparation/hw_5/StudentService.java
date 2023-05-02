package ru.gb.preparation.hw_5;

import java.util.List;
import java.util.function.Supplier;


public class StudentService {

    private final StudentDao dao;

    public StudentService() {
        this.dao = new StudentDao();
    }

    public void add(Student student) {
        dao.openSessionWithTransaction();
        dao.persist(student);
        dao.closeSessionAndTransaction();
    }

    public void delete(Student student) {
        dao.openSessionWithTransaction();
        dao.delete(student);
        dao.closeSessionAndTransaction();
    }

    public void update(Student student) {
        dao.openSessionWithTransaction();
        dao.update(student);
        dao.closeSessionAndTransaction();
    }

    public Student findById(Long id) {
        dao.openSessionWithTransaction();
        Student student = dao.findById(id);
        dao.closeSessionAndTransaction();
        return student;
    }

    public void addThousand(Supplier<Student> supplier, int amount) {
        dao.openSessionWithTransaction();
        for (int i = 0; i < amount; i++) {
            dao.persist(supplier.get());
        }
        dao.closeSessionAndTransaction();
    }

    public List<Student> findAll() {
        List<Student> students;
        dao.openSessionWithTransaction();
        students = dao.findAll();
        dao.closeSessionAndTransaction();
        return students;
    }

    public void deleteAll() {
        dao.openSessionWithTransaction();
        dao.deleteAll();
        dao.closeSessionAndTransaction();
    }
}
