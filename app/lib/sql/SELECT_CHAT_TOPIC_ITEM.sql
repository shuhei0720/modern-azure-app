SELECT
  BIN_TO_UUID(TopicID) AS TopicID,
  BIN_TO_UUID(UserID) AS UserID,
  Title,
  CreatedAt
FROM
  ChatTopics
WHERE
  UserID = UUID_TO_BIN(:userId)
  AND
  TopicID = UUID_TO_BIN(:topicId)
;
