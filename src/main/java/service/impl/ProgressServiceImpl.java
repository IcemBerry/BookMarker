package service.impl;

import mapper.ProgressMapper;
import model.Progress;
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

    @Override
    public int insertProgress(Progress progress) {
        return progressMapper.insert(progress);
    }


}
