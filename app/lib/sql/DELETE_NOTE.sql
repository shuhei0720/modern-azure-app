DELETE FROM
    Notes
WHERE
    NoteID = UUID_TO_BIN(:noteId)
;