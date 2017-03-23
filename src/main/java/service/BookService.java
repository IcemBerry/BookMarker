package service;

import model.Book;

import java.util.List;

/**
 * Created by cacri on 2017/3/10.
 */
public interface BookService {
    Book getBookByBookId(int bookId);
    Book getBookByBookName(String bookName);
    int insertBook(Book book);
    List<Book> getAllBooks();
}
