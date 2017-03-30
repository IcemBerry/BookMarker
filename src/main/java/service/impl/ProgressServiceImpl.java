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
    public Progress getProgressByProgressId(int progressId) {
        return progressMapper.selectProgressById(progressId);
    }

    @Override
    public int insertProgress(Progress progress) {
        return progressMapper.insert(progress);
    }

    @Override
    public int deleteByProgressId(Integer progressId) {
        return progressMapper.deleteByProgressId(progressId);
    }

    @Override
    public int updateProgress(Progress progress) {
        return progressMapper.updateByPrimaryKeySelective(progress);
    }


}
