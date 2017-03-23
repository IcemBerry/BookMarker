package service.impl;

import dao.LibraryMapper;
import model.Library;
import model.User;
import org.springframework.stereotype.Service;
import service.LibraryService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cacri on 2017/3/10.
 */

@Service("libraryService")
public class LibraryServiceImpl implements LibraryService {

    @Resource
    private LibraryMapper libraryMapper;

    @Override
    public List<Library> getUserLibraryByUser(User user) {
        return libraryMapper.selectByUserId(user.getUserId());
    }

    @Override
    public int insertLibrary(Library library) {
        return libraryMapper.insert(library);
    }
}
