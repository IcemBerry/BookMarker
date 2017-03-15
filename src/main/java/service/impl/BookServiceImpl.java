package service.impl;

import dao.BookMapper;
import model.Book;
import org.springframework.stereotype.Service;
import service.BookService;

import javax.annotation.Resource;

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
}
