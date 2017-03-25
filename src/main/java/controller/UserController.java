package controller;

import model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by cacri on 2017/3/1.
 */

@Controller
@SessionAttributes("user")
public class UserController {
    @Resource
    private UserService userService;

    private static Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, Model model) {
        String userName = request.getParameter("username");
        System.out.println(userName);
        User user = userService.getUserByUserName(userName);
        if (user != null && user.getPassword().equals(request.getParameter("password"))) {
            model.addAttribute("user", user);
            return "redirect:index";
        }
        return "login";
    }
}