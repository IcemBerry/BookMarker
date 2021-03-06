package service;

import model.Progress;

import java.util.List;

/**
 * Created by cacri on 2017/3/14.
 */
public interface ProgressService {
    List<Progress> getProgressByUserId(int userId);

    Progress getProgressByUserIdAndBookId(int userId, int bookId);

    Progress getProgressByProgressId(int progressId);

    int insertProgress(Progress progress);

    int deleteByProgressId(Integer progressId);

    int updateProgress(Progress progress);
}
