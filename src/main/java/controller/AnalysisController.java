package controller;

import model.Note;
import model.Progress;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;
import service.NoteService;
import service.ProgressService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cacri on 2017/3/16.
 */
@Controller
public class AnalysisController {
    @Resource
    private BookService bookService;
    @Resource
    private LibraryService libraryService;
    @Resource
    private ProgressService progressService;
    @Resource
    private NoteService noteService;

    @RequestMapping(value = "/analysis", method = RequestMethod.GET)
    public String getAnalysisPage(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "analysis";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/analysis", method = RequestMethod.POST)
    public Map<String,Object> getBookDetail(HttpSession session) {
        Map<String,Object> map = new HashMap<String,Object>();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            List<Note> noteList = noteService.getNoteByUserId(user.getUserId());
            for (Note note : noteList){
                note.setBook(bookService.getBookByBookId(note.getBookId()));
            }
            List<Progress> progressList = progressService.getProgressByUserId(user.getUserId());
            for (Progress progress : progressList){
                progress.setBook(bookService.getBookByBookId(progress.getBookId()));
            }
            map.put("noteList",noteList);
            map.put("progressList",progressList);
        }
        return map;
    }
}
