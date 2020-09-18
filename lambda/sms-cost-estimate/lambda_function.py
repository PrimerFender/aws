import boto3
import calendar
from datetime import datetime
from decimal import Decimal
import json

# inputs
current_datetime = datetime.now()
current_year = current_datetime.year
current_month = current_datetime.month
last_day_of_current_month = calendar.monthrange(current_year, current_month)[1]
first_date_of_next_month = 1

# Determine End Date, roll over month or year if necessary
if (current_month != 12):
    # Currently January through November
    next_month = current_month + 1
    next_year = current_year
else:
    # Currently December
    next_month = 1
    next_year = current_year + 1

# Taken an integer, prepend 0 if single digit, and return string
def convert_and_prepend_string(input_int):
    if (input_int < 10):
        return '0' + str(input_int)
    else:
        return str(input_int)

current_year = str(current_year)
next_year = str(next_year)
current_month = convert_and_prepend_string(current_month)
next_month = convert_and_prepend_string(next_month)
last_day_of_current_month = convert_and_prepend_string(last_day_of_current_month)
first_date_of_next_month = convert_and_prepend_string(first_date_of_next_month)

start_date = current_year + '-' + current_month + '-' + last_day_of_current_month
end_date = next_year + '-' + next_month + '-' + first_date_of_next_month

def lambda_handler(event, context):
    ce_client = boto3.client('ce')
    sns_client = boto3.client('sns')

    ce_response = ce_client.get_cost_forecast(
        TimePeriod={
            'Start': start_date,
            'End': end_date
        },
        Metric='BLENDED_COST',
        Granularity='MONTHLY'
    )
    
    amount = str(round(Decimal(ce_response['Total']['Amount']), 2))
    body = "This month's bill forecast is: $" + amount
    
    sns_response = sns_client.publish(
        TopicArn='arn:aws:sns:us-east-1:297525426546:NotifyMe',
        Message=body,
        Subject='AWS Cost Forecast Notification'
    )
    
    # return {
    #     'statusCode': 200,
    #     'body': body
    # }
    return sns_response
