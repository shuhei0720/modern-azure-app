SELECT
  BIN_TO_UUID(UserID) AS UserID,
  Username,
  Password,
  Email,
  CreatedAt
FROM
  Users
WHERE
  Email = :email
;