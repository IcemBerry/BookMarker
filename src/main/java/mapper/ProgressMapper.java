package mapper;

import model.Progress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProgressMapper {
    List<Progress> selectByUserId(int userId);

    Progress selectProgressByUserIdAndBookId(@Param("userId") int userId, @Param("bookId") int bookId);

    Progress selectProgressById(int progressId);

    int insert(Progress record);

    int insertSelective(Progress record);

    int deleteByProgressId(Integer progressId);

    int updateByPrimaryKeySelective(Progress record);

    int updateByPrimaryKey(Progress record);
}