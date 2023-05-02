package ru.gb.preparation.hw_5;

import lombok.Data;
import org.hibernate.Session;
import org.hibernate.Transaction;

import static ru.gb.preparation.hw_5.SessionFactorySingleton.getSessionFactory;

import java.util.List;

@Data
public class StudentDao implements iDao<Student, Long> {

    private Session currentSession;
    private Transaction currentTransaction;

    public void openSessionWithTransaction() {
        currentSession = getSessionFactory().openSession();
        currentTransaction = currentSession.beginTransaction();
    }

    public void closeSessionAndTransaction() {
        currentTransaction.commit();
        currentSession.close();
    }


    @Override
    public void persist(Student student) {
        currentSession.persist(student);
    }

    @Override
    public void delete(Student student) {
        currentSession.remove(student);
    }

    @Override
    public void update(Student student) {
        currentSession.merge(student);

    }

    @Override
    public Student findById(Long id) {
        return currentSession.get(Student.class, id);
    }

    @Override
    public List<Student> findAll() {
        return currentSession.createSelectionQuery("from Student ")
                .stream()
                .map(o -> (Student) o)
                .toList();
    }

    @Override
    public void deleteAll() {
        findAll().forEach(this::delete);
    }
}
