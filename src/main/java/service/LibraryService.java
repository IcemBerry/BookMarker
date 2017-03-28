package service;

import model.Library;
import model.User;

import java.util.List;

/**
 * Created by cacri on 2017/3/10.
 */
public interface LibraryService {

    List<Library> getUserLibraryByUser(User user);

    int insertLibrary(Library library);

    Library getLibraryByUserIdAndBookId(Integer userId, Integer bookId);

    int deleteByLibraryId(Integer libraryId);
}