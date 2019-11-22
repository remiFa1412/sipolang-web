package com.sipolang.service;

import com.sipolang.model.User;

public interface UserService {
    public User findUserByEmail(String email);
    public void saveUser(User user);
}
