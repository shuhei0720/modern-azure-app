SELECT 
    BIN_TO_UUID(BookID) AS BookID,
    BIN_TO_UUID(UserID) AS UserID,
    Title,
    CreatedAt,
    UpdatedAt
FROM 
    Books
WHERE 
    UserID = UUID_TO_BIN(:userId)
;
