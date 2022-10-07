package org.itsci.vegetable.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.itsci.vegetable.model.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LoginDaoImpl implements LoginDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public Login verifyLogin(Login login) {
        Session session = sessionFactory.getCurrentSession();
        Query<Login> query = session.createQuery("from Login l where l.email=:em", Login.class);
        query.setParameter("em", login.getEmail());
        Login entityLogin = query.getSingleResult();
        if (entityLogin != null && login.getPassword().equals(login.getPassword())) {
            return entityLogin;
        }
        return null;
    }
}
