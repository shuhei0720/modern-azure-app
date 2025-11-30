INSERT INTO
    Notes (NoteID, BookID, Title, Content)
VALUES
    (UUID_TO_BIN(:noteId), UUID_TO_BIN(:bookId), :title, :content)
;
