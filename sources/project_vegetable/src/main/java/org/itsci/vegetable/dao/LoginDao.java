package org.itsci.vegetable.dao;

import org.itsci.vegetable.model.Login;

public interface LoginDao {
    Login verifyLogin(Login login);
}
