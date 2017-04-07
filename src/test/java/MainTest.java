import model.Book;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by cacri on 2017/2/13.
 */

public class MainTest {

    private ApplicationContext applicationContext;

    @Before
    public void setUp() throws Exception{
        applicationContext = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
    }

    @Test
    public void testFindBookById(){
        mapper.BookMapper bookMapper = (mapper.BookMapper) applicationContext.getBean("bookMapper");
        Book book = bookMapper.selectByPrimaryKey(1);
        System.out.println(book);
    }
}
