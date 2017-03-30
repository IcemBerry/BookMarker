package model;

import java.util.Date;

public class Note {
    private Integer noteId;

    private Integer userId;

    private Integer bookId;

    private Date noteDate;

    private String note;

    private Integer notePage;

    private Book book;

    public Integer getNoteId() {
        return noteId;
    }

    public void setNoteId(Integer noteId) {
        this.noteId = noteId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Date getNoteDate() {
        return noteDate;
    }

    public void setNoteDate(Date noteDate) {
        this.noteDate = noteDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Integer getNotePage() {
        return notePage;
    }

    public void setNotePage(Integer notePage) {
        this.notePage = notePage;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "Note{" +
                "noteId=" + noteId +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", noteDate=" + noteDate +
                ", note='" + note + '\'' +
                ", notePage=" + notePage +
                ", book=" + book +
                '}';
    }
}