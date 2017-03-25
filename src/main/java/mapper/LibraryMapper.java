package mapper;

import model.Library;

import java.util.List;

public interface LibraryMapper {
    int deleteByPrimaryKey(Integer libraryId);

    int insert(Library record);

    int insertSelective(Library record);

    Library selectByPrimaryKey(Integer libraryId);

    List<Library> selectByUserId(Integer userId);

    int updateByPrimaryKeySelective(Library record);

    int updateByPrimaryKey(Library record);
}