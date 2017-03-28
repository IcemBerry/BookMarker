package controller;

import model.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;
import service.NoteService;
import service.ProgressService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LibraryController {

    @Resource
    private LibraryService libraryService;

    @Resource
    private BookService bookService;

    @Resource
    private ProgressService progressService;

    @Resource
    private NoteService noteService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String toUserLibrary(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "index";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public Map<String, Object> getUserLibrary(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        List<Library> libraryList = libraryService.getUserLibraryByUser(user);
        List<Book> bookList = new ArrayList<Book>();
        for (Library library : libraryList) {
            Book book = bookService.getBookByBookId(library.getBookId());
            bookList.add(book);
        }
        map.put("bookList", bookList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addBookFromLib", method = RequestMethod.POST)
    public Map<String, Object> addBookFromLib(HttpSession session, HttpServletRequest request) {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Library library = new Library();
            library.setBookId(bookId);
            library.setUserId(user.getUserId());
            int result = libraryService.insertLibrary(library);
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

    @ResponseBody
    @RequestMapping(value = "/getUserBook", method = RequestMethod.POST)
    public Map<String, Object> getLibrary(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        List<Library> libraryList = libraryService.getUserLibraryByUser(user);
        List<Integer> bookList = new ArrayList<Integer>();
        for (Library library : libraryList) {
            bookList.add(library.getBookId());
        }
        map.put("bookList", bookList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteUserBook", method = RequestMethod.POST)
    public Map<String, Object> deleteLibrary(HttpSession session, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        int bookId = Integer.parseInt(request.getParameter("bookId"));

        Library library = libraryService.getLibraryByUserIdAndBookId(user.getUserId(), bookId);
        List<Note> noteList = noteService.getNoteByUserIdAndBookId(user.getUserId(), bookId);
        Progress progress = progressService.getProgressByUserIdAndBookId(user.getUserId(), bookId);

        boolean result = deleteUserBookInfo(library,noteList,progress);

        if (result) {
            map.put("status", true);
        }

        return map;
    }

    @Transactional
    private boolean deleteUserBookInfo(Library library, List<Note> noteList, Progress progress) {
        boolean flag = false;
        if (noteList.size()>0) {
            for (Note note : noteList) {
                noteService.deleteByNoteId(note.getNoteId());
            }
        }
        if (progress != null){
            progressService.deleteByProgressId(progress.getProgressId());
        }
        if (library !=null){
            libraryService.deleteByLibraryId(library.getLibraryId());
            flag = true;
        }else {
            flag = false;
        }
        return flag;
    }
}