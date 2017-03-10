package controller;

import model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by cacri on 2017/3/10.
 */
@Controller
@SessionAttributes({"user","library","book","progress"})
public class ProgressController {

    private static Logger logger = Logger.getLogger(ProgressController.class);

    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    public String indexPage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "progress";
        }
        return "redirect:login";
    }
}
