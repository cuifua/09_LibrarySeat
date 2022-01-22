package cuifua.libraryseat.service.admin;

import cuifua.libraryseat.bean.PageBean;
import cuifua.libraryseat.dao.admin.UserDao;
import cuifua.libraryseat.entity.admin.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

/**
 * 用户管理service
 * @author Administrator
 *
 */
@Service
public class UserService
{
	@Autowired
	private UserDao userDao;
	
	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	public User find(Long id){
		return userDao.find(id);
	}


	/**
	 * 按照用户名查找用户
	 * @param username
	 * @return
	 */
	public User findByUsername(String username){
		return userDao.findByUsername(username);
	}


	/**
	 * 用户添加/编辑操作
	 * @param user
	 * @return
	 */
	public User save(User user){
		return userDao.save(user);
	}


	/**
	 * 分页查询用户列表
	 * @param user
	 * @param pageBean
	 * @return
	 */
	public PageBean<User> findList(User user,PageBean<User> pageBean)
	{
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("nickName", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","sex");
		Example<User> example = Example.of(user, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<User> findAll = userDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}


	/**
	 * 判断用户名是否存在，添加和编辑均可判断
	 * @param username
	 * @param id
	 * @return
	 */
	public boolean isExistUsername(String username,Long id)
	{
		User user = userDao.findByUsername(username);
		if(user != null){
			//表示用户名存在，接下来判断是否是编辑用户的本身
			if(user.getId().longValue() != id.longValue()){
				return true;
			}
		}
		return false;
	}


	/**
	 * 按照用户id删除
	 * @param id
	 */
	public void delete(Long id){
		userDao.deleteById(id);
	}


	/**
	 * 返回用户总数
	 * @return
	 */
	public long total(){
		return userDao.count();
	}
}
