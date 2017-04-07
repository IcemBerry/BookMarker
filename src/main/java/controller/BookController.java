package controller;

import model.*;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import service.BookService;
import service.LibraryService;
import service.NoteService;
import service.ProgressService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by cacri on 2017/3/10.
 */
@Controller
public class BookController {

    @Resource
    private BookService bookService;
    @Resource
    private ProgressService progressService;
    @Resource
    private NoteService noteService;
    @Resource
    private LibraryService libraryService;

    @RequestMapping(value = "/book", method = RequestMethod.GET)
    public String getBookDetail(HttpSession session, Model model, @RequestParam("bookId") int bookId) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Book book = bookService.getBookByBookId(bookId);
            Progress progress = progressService.getProgressByUserIdAndBookId(user.getUserId(), bookId);
            List<Note> noteList = noteService.getNoteByUserIdAndBookId(user.getUserId(), bookId);
            if (progress == null) {
                progress = new Progress();
                progress.setProgress(0);
                progress.setProgressDate(new Date());
            }
            for (Note note : noteList) {
                if (note.getNote().length() > 12) {
                    note.setNote(note.getNote().substring(0, 9) + "...");
                }
            }
            model.addAttribute("book", book);
            model.addAttribute("progress", progress);
            model.addAttribute("progressPercent", (Math.round((float) progress.getProgress() / book.getBookPage() * 100)));
            model.addAttribute("noteList", noteList);
            return "book";
        }
        return "redirect:login";
    }


    @RequestMapping(value = "/addBook", method = RequestMethod.GET)
    public String toAddBook(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "bookAdd";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public Map<String,Object> addBook(HttpSession session, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Book book = new Book();
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile("cover");

            String bookISBN = multipartRequest.getParameter("bookISBN");
            book.setBookISBN(bookISBN);

            book.setBookName(multipartRequest.getParameter("bookName"));
            book.setBookNote(multipartRequest.getParameter("bookNote"));
            book.setBookPage(Integer.parseInt(multipartRequest.getParameter("bookPage")));
            book.setBookAuthor(multipartRequest.getParameter("bookAuthor"));

            String realPathDir = request.getSession().getServletContext().getRealPath("/assets/cover/");
            String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
            if (bookISBN != null && !bookISBN.trim().equals("")){
                if (suffix.equals(".jpg") && multipartFile.getSize() <= 204800) {
                    String fileName = realPathDir + bookISBN + suffix;
                    File file = new File(fileName);
                    try {
                        multipartFile.transferTo(file);
                        int result = bookService.insertBook(book);
                        if (result >0) {
                            map.put("status",true);
                        } else {
                            map.put("status",false);
                            map.put("errorMsg","SQL ERROR");
                        }
                    } catch (IllegalStateException e) {
                        e.printStackTrace();
                        map.put("status",false);
                        map.put("errorMsg","IllegalStateException");
                    } catch (IOException e) {
                        e.printStackTrace();
                        map.put("status",false);
                        map.put("errorMsg","IOException");
                    }
                } else {
                    map.put("status",false);
                    map.put("errorMsg","请检查上传文件是否符合要求！");
                }
            }else {
                map.put("status",false);
                map.put("errorMsg","ISBN编号为必填项！");
            }
        }
        return map;
    }

    @RequestMapping(value = "/toBookLibrary", method = RequestMethod.GET)
    public String toBookLibrary(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "bookLibrary";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/getAllBook", method = RequestMethod.POST)
    public Map<String, Object> getAllBook(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        List<Book> bookList = bookService.getAllBooks();
        List<Library> libraryList = libraryService.getUserLibraryByUser(user);
        for (Library tempLibrary : libraryList) {
            Book book = bookService.getBookByBookId(tempLibrary.getBookId());
            bookList.remove(book);
        }
        map.put("bookList", bookList);
        return map;
    }
}