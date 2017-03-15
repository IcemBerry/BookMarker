package controller;

import model.Book;
import model.Progress;
import model.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import service.BookService;
import service.ProgressService;
import service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by cacri on 2017/3/10.
 */
@Controller
public class ProgressController {
    @Resource
    private ProgressService progressService;
    @Resource
    private BookService bookService;

    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    public String indexPage(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        int doneSumNum;
        if (user != null) {
            List<Progress> progresses = progressService.getProgressByUserId(user.getUserId());
            List<Progress> progressList = new ArrayList<Progress>();
            for (Progress progress : progresses) {
                Book book = bookService.getBookByBookId(progress.getBookId());
                if (progress.getProgress() < book.getBookPage()) {
                    progress.setBook(book);
                    progressList.add(progress);
                }
            }
            if (progresses.size()>progressList.size()){
                doneSumNum = progresses.size()-progressList.size();
            }else{
                doneSumNum = 0;
            }
            model.addAttribute("progressList", progressList);
            model.addAttribute("done", doneSumNum);
            return "progress";
        }
        return "redirect:login";
    }
}
