package developer.service;

import developer.dao.UserDao;
import developer.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Inject
    private UserDao userDao;

    @Transactional
    public void insert(User user) {
        userDao.insert(user);
    }

    @Transactional
    public void update(User user) {
        userDao.update(user);
    }

    @Transactional
    public void delete(int id) {
        userDao.delete(id);
    }

    public User getById(int id) {
        return userDao.findOne(id);
    }

    public List<User> getAll() {
        return userDao.getAll();
    }

    public List<User> searchUsers(String name) {
        return userDao.searchUsers(name);
    }
}
