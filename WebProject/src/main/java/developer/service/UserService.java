package developer.service;

import developer.entity.User;

import java.util.Date;
import java.util.List;

public interface UserService {
    void insert(User user);
    void update(User user);
    void delete(int id);
    User getById(int id);
    List<User> getAll();
    List<User> searchUsers(String name);
}
