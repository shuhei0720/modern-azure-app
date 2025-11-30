SELECT 
  ChatID,
  Role,
  Message,
  CreatedAt
FROM 
  ChatHistory
WHERE 
  UserID = UUID_TO_BIN(:userId)
  AND
  TopicID = UUID_TO_BIN(:topicId)
ORDER BY 
  ChatID ASC
;