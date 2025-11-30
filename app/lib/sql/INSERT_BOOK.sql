INSERT INTO
  Books (UserID, BookID, Title)
VALUES
  (UUID_TO_BIN(:userId), UUID_TO_BIN(:bookId), :title)
;