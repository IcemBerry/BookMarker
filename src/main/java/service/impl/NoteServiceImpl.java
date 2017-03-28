package service.impl;

import mapper.NoteMapper;
import model.Note;
import org.springframework.stereotype.Service;
import service.NoteService;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by cacri on 2017/3/14.
 */
@Service("noteService")
public class NoteServiceImpl implements NoteService {

    @Resource
    private NoteMapper noteMapper;

    @Override
    public List<Note> getNoteByUserIdAndBookId(int userId, int bookId) {
        return noteMapper.selectByUserIdAndBookId(userId,bookId);
    }

    @Override
    public List<Note> getNoteByUserId(int userId) {
        return noteMapper.selectByUserId(userId);
    }

    @Override
    public int addNote(Note note) {
        return noteMapper.insert(note);
    }
}
