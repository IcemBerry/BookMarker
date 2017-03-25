package dto;

/**
 * Created by cacri on 2017/3/24.
 */
public class NoteDTO {
    private int noteId;
    private int bookId;
    private String bookName;
    private int notePage;
    private String note;

    public int getNoteId() {
        return noteId;
    }

    public void setNoteId(int noteId) {
        this.noteId = noteId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getNotePage() {
        return notePage;
    }

    public void setNotePage(int notePage) {
        this.notePage = notePage;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
