package service.impl;

import dao.UserMapper;
import model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.UserService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cacri on 2017/2/9.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User getUserByUserId(int userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Transactional
    public int insertUsersByUserList(List<User> userList) {
        for (User user : userList) {
            int affectedCount = userMapper.insert(user);
            if (affectedCount == 1) {
                return 1;
            }
            return 0;
        }
        return 0;
    }
}