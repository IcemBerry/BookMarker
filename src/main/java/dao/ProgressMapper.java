package dao;

import model.Progress;

public interface ProgressMapper {
    int insert(Progress record);

    int insertSelective(Progress record);
}