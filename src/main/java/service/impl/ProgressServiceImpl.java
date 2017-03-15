package service.impl;

import dao.ProgressMapper;
import model.Progress;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import service.ProgressService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cacri on 2017/3/14.
 */
@Service("progressService")
public class ProgressServiceImpl implements ProgressService {

    @Resource
    private ProgressMapper progressMapper;

    @Override
    public List<Progress> getProgressByUserId(int userId) {
        return progressMapper.selectByUserId(userId);
    }

    @Override
    public Progress getProgressByUserIdAndBookId(int userId,int bookId) {
        return progressMapper.selectProgressByUserIdAndBookId(userId,bookId);
    }


}
