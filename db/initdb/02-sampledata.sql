USE notes;
SET CHARSET UTF8;

-- UUIDを変数に格納
SET @userUUID = UUID_TO_BIN('edf7f32b-e215-2ad1-2358-2bfe8786962f');
SET @bookUUID = UUID_TO_BIN('c3c639ec-929e-f667-2ddb-bd5c3396dc6f');

-- ユーザーのサンプルデータを挿入
-- username: user01
-- email: user01@example.com
-- password: p@ssword01
INSERT INTO Users (UserID, Username, Password, Email)
VALUES (@userUUID, 'user01', '$2b$10$jWu6gnrgsQt03CO2TY.OPucV22gvzsMu9F/oII4Kx4knSIA1ITmze', 'user01@example.com');

-- ブックのサンプルデータを挿入
INSERT INTO Books (BookID, UserID, Title)
VALUES (@bookUUID, @userUUID, 'Sample Book');

-- ノートのサンプルデータを挿入
INSERT INTO Notes (NoteID, BookID, Title, Content)
VALUES (UUID_TO_BIN('83e3d134-878a-9896-a399-0eb1a7566c00'), @bookUUID, 'Sample Note 1', 'This is the content of sample note 1.');

INSERT INTO Notes (NoteID, BookID, Title, Content)
VALUES (UUID_TO_BIN('da81b82a-e9e7-bf49-befc-424b1e6c6845'), @bookUUID, 'Sample Note 2', 'This is the content of sample note 2.');

INSERT INTO Notes (NoteID, BookID, Title, Content)
VALUES (UUID_TO_BIN('f3ae3082-856b-f19d-d819-ba723213ad42'), @bookUUID, 'Sample Note 3', 'This is the content of sample note 3.');