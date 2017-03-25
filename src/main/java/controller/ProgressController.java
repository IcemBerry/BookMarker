package controller;

import dto.ProgressDTO;
import model.Book;
import model.Library;
import model.Progress;
import model.User;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;
import service.ProgressService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by cacri on 2017/3/10.
 */
@Controller
public class ProgressController {
    @Resource
    private ProgressService progressService;
    @Resource
    private BookService bookService;
    @Resource
    private LibraryService libraryService;


    @RequestMapping(value = "/progress", method = RequestMethod.GET)
    public String toProgress(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "progress";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/progress", method = RequestMethod.POST)
    public Map<String, Object> getProgress(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");

        List<Library> libraryList = libraryService.getUserLibraryByUser(user);
        List<ProgressDTO> progressDTOList = new ArrayList<ProgressDTO>();
        List<Book> unOpenedBookList = new ArrayList<Book>();
        List<Book> tempBookList = new ArrayList<Book>();

        for (Library library : libraryList) {
            tempBookList.add(bookService.getBookByBookId(library.getBookId()));
        }

        for (Book book : tempBookList) {
            Progress progress = progressService.getProgressByUserIdAndBookId(user.getUserId(), book.getBookId());
            ProgressDTO progressDTO = new ProgressDTO();
            if (progress != null) {
                progressDTO.setBookName(book.getBookName());
                progressDTO.setBookId(book.getBookId());
                progressDTO.setBookPage(book.getBookPage());
                progressDTO.setProgress(progress.getProgress());
                int progressPercent = (int)Math.round((double)progress.getProgress() / (double)book.getBookPage() * 100);
                progressDTO.setProgressPercent(progressPercent);
                progressDTOList.add(progressDTO);
            } else {
                unOpenedBookList.add(book);
            }
        }

        map.put("unOpenedBookList", unOpenedBookList);
        map.put("progressDTOList", progressDTOList);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addProgress", method = RequestMethod.POST)
    public Map<String,Object> addProgress(HttpSession session,HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        if (user != null) {
            Progress progress = new Progress();
            progress.setBookId(bookId);
            progress.setUserId(user.getUserId());
            progress.setProgress(1);
            progress.setProgressDate(new Date());
            int result = progressService.insertProgress(progress);
            if (result > 0) {
                map.put("status", true);
            } else {
                map.put("status", false);
                map.put("errorMsg", "DB ERROR");
            }
        } else {
            map.put("status", false);
            map.put("errorMsg", "Login ERROR");
        }
        return map;
    }
}
