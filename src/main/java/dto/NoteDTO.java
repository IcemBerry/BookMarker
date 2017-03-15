package dto;

import model.Book;
import model.Note;

import java.util.List;

/**
 * Created by cacri on 2017/3/15.
 */
public class NoteDTO {
    private Book book;
    private List<Note> noteList;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public List<Note> getNoteList() {
        return noteList;
    }

    public void setNoteList(List<Note> noteList) {
        this.noteList = noteList;
    }
}
