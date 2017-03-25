package service.impl;

import mapper.BookMapper;
import model.Book;
import org.springframework.stereotype.Service;
import service.BookService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cacri on 2017/3/10.
 */
@Service("bookService")
public class BookServiceImpl implements BookService {

    @Resource
    private BookMapper bookMapper;

    @Override
    public Book getBookByBookId(int bookId) {
        return bookMapper.selectByPrimaryKey(bookId);
    }

    @Override
    public Book getBookByBookName(String bookName) {
        return bookMapper.selectByBookName(bookName);
    }

    @Override
    public int insertBook(Book book) {
        return bookMapper.insert(book);
    }

    @Override
    public List<Book> getAllBooks() {
        return bookMapper.selectAllBooks();
    }
}
