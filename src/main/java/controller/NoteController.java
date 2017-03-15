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
import service.BookService;
import service.LibraryService;
import service.NoteService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    public String getUserLibrary(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<NoteDTO> noteDTOList = new ArrayList<NoteDTO>();
        if (user != null) {
            List<Library> bookList = libraryService.getUserLibraryByUser(user);
            for (Library library : bookList){
                NoteDTO noteDTO = new NoteDTO();
                List<Note> noteList = noteService.getNoteByUserIdAndBookId(user.getUserId(),library.getBookId());
                Book book = bookService.getBookByBookId(library.getBookId());
                if (noteList.size() > 0){
                    noteDTO.setBook(book);
                    noteDTO.setNoteList(noteList);
                    noteDTOList.add(noteDTO);
                }
            }
            model.addAttribute("noteList", noteDTOList);
            return "note";
        }
        return "redirect:login";
    }
}
