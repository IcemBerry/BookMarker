package controller;

import model.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.BookService;
import service.NoteService;
import service.ProgressService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            for (Note note : noteList){
                if (note.getNote().length()>12){
                    note.setNote(note.getNote().substring(0,9)+"...");
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
}
