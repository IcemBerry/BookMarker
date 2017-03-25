package service;

import model.User;

import java.util.List;

/**
 * Created by cacri on 2017/2/9.
 */
public interface UserService {

    User getUserByUserId(int userId);
    User getUserByUserName(String userName);
}
