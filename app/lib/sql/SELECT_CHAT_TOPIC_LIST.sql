SELECT
  BIN_TO_UUID(TopicID) AS TopicID,
  Title,
  CreatedAt
FROM
  ChatTopics
WHERE
  UserID = UUID_TO_BIN(:userId);