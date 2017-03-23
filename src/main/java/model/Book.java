package model;

public class Book {
    private Integer bookId;

    private String bookName;

    private String bookISBN;

    private String bookNote;

    private Integer bookPage;

    private String bookAuthor;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookISBN() {
        return bookISBN;
    }

    public void setBookISBN(String bookISBN) {
        this.bookISBN = bookISBN == null ? null : bookISBN.trim();
    }

    public String getBookNote() {
        return bookNote;
    }

    public void setBookNote(String bookNote) {
        this.bookNote = bookNote == null ? null : bookNote.trim();
    }

    public Integer getBookPage() {
        return bookPage;
    }

    public void setBookPage(Integer bookPage) {
        this.bookPage = bookPage;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor == null ? null : bookAuthor.trim();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        if (bookId != null ? !bookId.equals(book.bookId) : book.bookId != null) return false;
        if (bookName != null ? !bookName.equals(book.bookName) : book.bookName != null) return false;
        if (bookISBN != null ? !bookISBN.equals(book.bookISBN) : book.bookISBN != null) return false;
        if (bookNote != null ? !bookNote.equals(book.bookNote) : book.bookNote != null) return false;
        if (bookPage != null ? !bookPage.equals(book.bookPage) : book.bookPage != null) return false;
        return bookAuthor != null ? bookAuthor.equals(book.bookAuthor) : book.bookAuthor == null;
    }

}