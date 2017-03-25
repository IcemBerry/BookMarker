package controller;

import dto.NoteDTO;
import model.Book;
import model.Library;
import model.Note;
import model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;
import service.NoteService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cacri on 2017/3/15.
 */
@Controller
public class NoteController {

    @Resource
    private NoteService noteService;

    @Resource
    private LibraryService libraryService;

    @Resource
    private BookService bookService;

    @RequestMapping(value = "/note", method = RequestMethod.GET)
    public String toUserLibrary(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "note";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/note", method = RequestMethod.POST)
    public Map<String,Object> getUserLibrary(HttpSession session) {
        Map<String,Object> map = new HashMap<String,Object>();
        User user = (User) session.getAttribute("user");
        List<NoteDTO> noteDTOList = new ArrayList<NoteDTO>();
        List<Note> noteList = noteService.getNoteByUserId(user.getUserId());
        for (Note note : noteList) {
            NoteDTO noteDTO = new NoteDTO();
            noteDTO.setBookId(note.getBookId());
            noteDTO.setNoteId(note.getNoteId());
            noteDTO.setNotePage(note.getNotePage());
            noteDTO.setNote(note.getNote());

            Book book = bookService.getBookByBookId(note.getBookId());
            noteDTO.setBookName(book.getBookName());

            noteDTOList.add(noteDTO);
        }

        map.put("noteDTOList",noteDTOList);
        return map;
    }
}
