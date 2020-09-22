( echo "Time,Identity ARN,Event ID,Service,Action,Error,Message";
  aws cloudtrail lookup-events --start-time "2020-05-21T21:00:00Z" --end-time "2020-05-21T22:00:00Z" --query "Events[*].CloudTrailEvent" --output text \
    | jq -r ". | select(.userIdentity.arn == \"arn:aws:sts::281413652694:assumed-role/IAM-Administrator/craig.spargo\" and .eventType == \"AwsApiCall\" and .errorCode != null
    and (.errorCode | ascii_downcase | (contains(\"accessdenied\") or contains(\"unauthorized\"))))
    | [.eventTime, .userIdentity.arn, .eventID, .eventSource, .eventName, .errorCode, .errorMessage] | @csv"
) | column -t -s'",'
