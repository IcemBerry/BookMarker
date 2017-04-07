package controller;

import model.Library;
import model.Note;
import model.Progress;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.LibraryService;
import service.NoteService;
import service.ProgressService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by cacri on 2017/3/1.
 */

@Controller
public class UserController {
    @Resource
    private UserService userService;
    @Resource
    private LibraryService libraryService;
    @Resource
    private NoteService noteService;
    @Resource
    private ProgressService progressService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpSession session) {
        String userName = request.getParameter("username");
        User user = userService.getUserByUserName(userName);
        if (user != null && user.getPassword().equals(request.getParameter("password"))) {
            user.setLastLoginTime(new Date());
            userService.updateUser(user);
            session.setAttribute("user",user);
            session.setMaxInactiveInterval(1200);
            return "redirect:index";
        }
        return "login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerPage() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(HttpServletRequest request, Model model) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        if (userName != null && !userName.equals("") && password != null && !password.equals("")) {
            User user = new User();
            user.setUserName(userName);
            user.setPassword(password);
            user.setRegisterTime(new Date());
            userService.addUser(user);
        }
        return "login";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public String editUserPage() {
        return "editUser";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public String editUser(HttpSession session, HttpServletRequest request, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null){
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");

            if (oldPassword != null && !oldPassword.equals("") && newPassword != null && !newPassword.equals("") &&oldPassword.equals(user.getPassword())) {
                user.setPassword(newPassword);
                userService.updateUser(user);
            }
        }
        session.removeAttribute("user");
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpSession session){
        session.removeAttribute("user");
        session.invalidate();
        return "login";
    }

    @RequestMapping(value = "/delUser", method = RequestMethod.POST)
    public String delUser(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        if (user != null){
            String doublePassword = request.getParameter("doublePassword");
            String password = doublePassword.substring(doublePassword.length()/2);
            if (password != null && !password.equals("") &&password.equals(user.getPassword())) {
                userService.deleteUser(user.getUserId());
                List<Library> libraryList = libraryService.getUserLibraryByUser(user);
                List<Note> noteList = noteService.getNoteByUserId(user.getUserId());
                List<Progress> progressList = progressService.getProgressByUserId(user.getUserId());
                boolean result = deleteUserInfo(libraryList,noteList,progressList);
                if (result){
                    session.removeAttribute("user");
                    session.invalidate();
                    return "login";
                }else{
                    return "editUser";
                }
            }
        }
        return "login";
    }

    @Transactional
    private boolean deleteUserInfo(List<Library> libraryList, List<Note> noteList, List<Progress> progressList) {
        boolean flag = false;
        if (noteList.size()>0) {
            for (Note note : noteList) {
                noteService.deleteByNoteId(note.getNoteId());
            }
        }
        if (progressList.size()>0){
            for (Progress progress : progressList) {
                progressService.deleteByProgressId(progress.getProgressId());
            }
        }
        if (libraryList.size()>0){
            for (Library library : libraryList) {
                libraryService.deleteByLibraryId(library.getLibraryId());
            }
            flag = true;
        }else {
            flag = false;
        }
        return flag;
    }
}