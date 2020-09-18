# λ SMS-Cost-Estimate

Sends an SMS message with the estimated AWS Cost for the month

## Overview

1. Scheduled CloudWatch Rule triggers Lambda Function
1. Lambda Function calculates cost via Cost Explorer API and
1. Publishes message to SNS Topic
1. SMS client is subscribed to SNS Topic and received the cost in a text message
