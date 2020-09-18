# λ Lambda

## Updating Lambda functions from cli

👉 Tested using `aws-cli/2.0.1 Python/3.7.3`

```bash
# From within the functions root directory, run this command to create a zip file so the main Python file is at the root.
cd ./sms-cost-estimate/
zip -r ../sms-cost-estimate.zip ./
```

👉 Once the zip file is created, you can update the function either in the AWS Console or the CLI

```bash
# Back to root directory where zip file was created
cd ../
aws lambda update-function-code --function-name SMS-Cost-Estimate --zip-file fileb://sms-cost-estimate.zip
```

[Source](https://aws.amazon.com/premiumsupport/knowledge-center/build-python-lambda-deployment-package/)