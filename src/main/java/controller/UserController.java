package controller;

import model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by cacri on 2017/3/1.
 */

@Controller
@RequestMapping("/user")
@SessionAttributes("user")
public class UserController {
    @Resource
    private UserService userService;

    private static Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping("/showUser")
    public String toIndex(HttpServletRequest request, Model model){
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = this.userService.getUserByUserId(userId);
        model.addAttribute("user",user);
        return "showUser";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginPage(){
        return "login";
    }


    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String indexPage(@ModelAttribute("user")User user){
        if (user != null){
            System.out.println(user.getUserName());
        }
        return "index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request, Model model){
        String userName = request.getParameter("username");
        System.out.println(userName);
        User user = userService.getUserByUserName(userName);
        if(user != null && user.getPassword().equals(request.getParameter("password"))){
            model.addAttribute("user",user);
            return "redirect:index";
        }
        return "login";
    }
}