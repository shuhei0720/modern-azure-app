SELECT
  BIN_TO_UUID(Notes.BookID) AS BookID,
  BIN_TO_UUID(Notes.NoteID) AS NoteID,
  Books.Title as BookTitle,
  Notes.Title as NoteTitle,
  Notes.CreatedAt,
  Notes.UpdatedAt
FROM
  (
    SELECT
      *
    FROM
      Notes
    WHERE
      Notes.BookID
      IN
      (SELECT Books.BookID FROM Books WHERE UserID = UUID_TO_BIN(:userId))
  ) AS Notes
LEFT JOIN
  (SELECT * FROM Books WHERE UserId = UUID_TO_BIN(:userId)) AS Books
ON
  Notes.BookID = Books.BookID
ORDER BY
  Notes.CreatedAt DESC
;
