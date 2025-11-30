INSERT INTO
  ChatTopics (TopicID, UserID, Title)
VALUES
  (UUID_TO_BIN(:topicId), UUID_TO_BIN(:userId), :title)
;
