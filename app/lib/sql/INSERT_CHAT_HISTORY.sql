INSERT INTO
  ChatHistory (UserID, TopicID, Role, Message)
VALUES
  (UUID_TO_BIN(:userId), UUID_TO_BIN(:topicId), :role, :message)
;