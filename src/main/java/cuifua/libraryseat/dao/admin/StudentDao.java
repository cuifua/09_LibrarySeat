package cuifua.libraryseat.dao.admin;

import cuifua.libraryseat.entity.admin.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentDao extends JpaRepository<Student, Long> {

    Student findByUser_Id(Long userId);

}
