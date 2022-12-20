package com.emirozturk.benzerbul.Service;

import com.emirozturk.benzerbul.Model.User;
import com.emirozturk.benzerbul.Model.Response;

import java.util.List;

public interface IUserService {
    Response<List<User>> getUsers();
    Response<User> login(String username, String password);
    Response<User> addUser(User user);
    Response<User> removeUser(String username);
    Response<User> updateUser(int id, User user);

    Response<User> addMusicToUser(String username, int id);
}
