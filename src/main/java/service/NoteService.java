package service;

import model.Note;

import java.util.List;

/**
 * Created by cacri on 2017/3/14.
 */
public interface NoteService {
    List<Note> getNoteByUserIdAndBookId(int userId, int bookId);

    List<Note> getNoteByUserId(int userId);

    int addNote(Note note);
}
