package controller;

import dto.NoteDTO;
import model.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.BookService;
import service.LibraryService;
import service.NoteService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

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
    public String toUserNote(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "note";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/note", method = RequestMethod.POST)
    public Map<String, Object> getUserNote(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
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

        map.put("noteDTOList", noteDTOList);
        return map;
    }

    @RequestMapping(value = "/addNote", method = RequestMethod.GET)
    public String toAddNote(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return "noteAdd";
        }
        return "redirect:login";
    }

    @ResponseBody
    @RequestMapping(value = "/addNote", method = RequestMethod.POST)
    public Map<String, Object> addNote(HttpSession session, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        Note note = new Note();


        note.setUserId(user.getUserId());
        note.setNotePage(Integer.parseInt(request.getParameter("bookPage")));
        note.setNote(request.getParameter("bookNote"));
        note.setBookId(Integer.parseInt(request.getParameter("bookId")));
        note.setNoteDate(new Date());

        int result = noteService.addNote(note);

        if (result > 0)
            map.put("status", true);
        else
            map.put("status", false);

        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteNote", method = RequestMethod.POST)
    public Map<String, Object> deleteNote(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        int result = noteService.deleteByNoteId(noteId);

        if (result > 0) {
            map.put("status", true);
        }

        return map;
    }
}
