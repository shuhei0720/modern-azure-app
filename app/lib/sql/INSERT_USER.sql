INSERT INTO
  Users (UserID, Username, Password, Email)
VALUES
  (UUID_TO_BIN(:userId), :username, :password, :email);
