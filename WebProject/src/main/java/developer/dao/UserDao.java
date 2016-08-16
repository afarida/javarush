package developer.dao;

import developer.entity.User;

import java.util.Date;
import java.util.List;

public interface UserDao {
    void insert(User user);
    void update(User user);
    void delete(int id);
    User findOne(int id);
    List<User> getAll();
    List<User> searchUsers(String name);
}
