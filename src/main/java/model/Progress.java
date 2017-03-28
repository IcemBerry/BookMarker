package model;

import java.util.Date;

public class Progress {
    private Integer progressId;

    private Integer bookId;

    private Integer userId;

    private Date progressDate;

    private Integer progress;

    private Book book;

    public Integer getProgressId() {
        return progressId;
    }

    public void setProgressId(Integer progressId) {
        this.progressId = progressId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getProgressDate() {
        return progressDate;
    }

    public void setProgressDate(Date progressDate) {
        this.progressDate = progressDate;
    }

    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}