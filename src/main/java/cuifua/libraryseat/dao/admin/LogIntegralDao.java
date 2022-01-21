package cuifua.libraryseat.dao.admin;

import cuifua.libraryseat.entity.admin.LogIntegral;
import cuifua.libraryseat.entity.admin.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogIntegralDao  extends JpaRepository<LogIntegral, Long> {
    List<LogIntegral> findByStudent(Student student);

    List<LogIntegral> findByStudent_Id(Long id);
}
