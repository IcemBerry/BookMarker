import com.alibaba.fastjson.JSON;
import model.User;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cacri on 2017/3/1.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ServiceTest {
    private static Logger logger = Logger.getLogger(ServiceTest.class);

    @Resource
    private UserService userService = null;

    @Test
    public void mainTest(){
        User user = userService.getUserByUserId(1);
        logger.info(JSON.toJSONString(user));
    }

    @Test
    public void InsertTest(){
        List<User> userList = new ArrayList<User>();
        User user = new User();
        user.setUserId(5);
        user.setUserName("TestSource");
        user.setPassword("123456");
        userList.add(user);
        userService.insertUsersByUserList(userList);
    }
}
