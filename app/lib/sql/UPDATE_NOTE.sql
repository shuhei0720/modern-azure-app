UPDATE Notes
SET 
    BookID = UUID_TO_BIN(:bookId),
    Title = :title,
    Content = :content,
    UpdatedAt = CURRENT_TIMESTAMP
WHERE 
    NoteID = UUID_TO_BIN(:noteId)
;
