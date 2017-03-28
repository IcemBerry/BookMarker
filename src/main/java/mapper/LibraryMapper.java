package mapper;

import model.Library;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LibraryMapper {
    int deleteByPrimaryKey(Integer libraryId);

    int insert(Library record);

    int insertSelective(Library record);

    Library selectByPrimaryKey(Integer libraryId);

    Library selectByBookIdAndUserId(@Param("userId") Integer userId, @Param("bookId") Integer bookId);

    List<Library> selectByUserId(Integer userId);

    int updateByPrimaryKeySelective(Library record);

    int updateByPrimaryKey(Library record);
}