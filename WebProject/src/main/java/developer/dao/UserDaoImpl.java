package developer.dao;

import developer.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    @Inject
    private SessionFactory sessionFactory;

    @Transactional
    public void insert(User user) {
        if (user.getCreatedDate() == null) {
            Calendar calendar = Calendar.getInstance();
            Date now = calendar.getTime();
            user.setCreatedDate(new Timestamp(now.getTime()));
        }
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Transactional
    public void update(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Transactional
    public void delete(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, new Integer(id));
        if (null != user) {
            session.delete(user);
        }
    }

    @Transactional
    public User findOne(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        session.flush();
        User user = (User) session.get(User.class, new Integer(id));
        return user;
    }

    @Transactional
    public List<User> getAll() {
        Session session = this.sessionFactory.getCurrentSession();
        return session.createQuery("from User").list();
    }

    @Transactional
    public List<User> searchUsers(String name) {
        Session session = sessionFactory.getCurrentSession();

        String query = getQuery(name);

        return session.createQuery(query).list();
    }

    private String getQuery(String name)
    {
        String queryStart = "from User";

        StringBuilder queryEnd = new StringBuilder("");

        if (name != null)
            queryEnd.append("name like '%" + name + "%'");

        return queryStart + ("".equals(queryEnd) ? "" : " where ") + queryEnd.toString();
    }
}
