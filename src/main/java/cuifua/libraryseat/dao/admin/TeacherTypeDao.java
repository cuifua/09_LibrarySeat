package cuifua.libraryseat.dao.admin;

import cuifua.libraryseat.entity.admin.TeacherType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherTypeDao extends JpaRepository<TeacherType ,Long>
{
}
