package controller;

import model.Book;
import model.Library;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cacri on 2017/3/10.
 */
@Controller
public class LibraryController {

    @Resource
    private LibraryService libraryService;

    @Resource
    private BookService bookService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String getUserLibrary(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Library> libraryList = libraryService.getUserLibraryByUser(user);
            List<Book> bookList = new ArrayList<Book>();
            for (Library library : libraryList) {
                Book book = bookService.getBookByBookId(library.getBookId());
                bookList.add(book);
            }
            model.addAttribute("bookList", bookList);
            return "index";
        }
        return "redirect:login";
    }

//    @ResponseBody
//    @RequestMapping(value = "/index", method = RequestMethod.POST)
//    public Map<String, Object> getLibrary(HttpSession session) {
//        System.out.println("IN USEING...");
//        Map<String, Object> map = new HashMap<String, Object>();
//        User user = (User) session.getAttribute("user");
//        List<Library> libraryList = libraryService.getUserLibraryByUser(user);
//        List<Book> bookList = new ArrayList<Book>();
//        for (Library library : libraryList) {
//            Book book = bookService.getBookByBookId(library.getBookId());
//            bookList.add(book);
//        }
//        map.put("bookList",bookList);
//        return map;
//    }
}
