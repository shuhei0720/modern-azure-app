SELECT 
    BIN_TO_UUID(Notes.BookID) AS BookID,
    BIN_TO_UUID(Notes.NoteID) AS NoteID,
    Notes.Title,
    Notes.Content,
    Notes.CreatedAt,
    Notes.UpdatedAt
FROM 
    Notes
WHERE 
    Notes.NoteID = UUID_TO_BIN(:noteId);