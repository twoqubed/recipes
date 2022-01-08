# API Gateway

resource "aws_iam_role" "api_gateway" {
  name = "RecipeApp_ApiGateway"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "api_gateway" {
  name = "policy"
  role = aws_iam_role.api_gateway.name

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow"
        "Action" : [
          "lambda:InvokeFunction"
        ]
        "Resource" : [
          aws_lambda_function.svelte_app.arn
        ]
      }
    ]
  })
}

# Lambda function

resource "aws_iam_role" "lambda" {
  name = "RecipeApp_LambdaFunction"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda" {
  name = "policy"
  role = aws_iam_role.lambda.name

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow"
        "Action" : [
          "dynamodb:BatchGetItem",
          "dynamodb:BatchWriteItem",
          "dynamodb:ConditionCheckItem",
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:ListTables",
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:UpdateItem"
        ]
        "Resource" : [
          aws_dynamodb_table.recipes.arn,
          "${aws_dynamodb_table.recipes.arn}/index/*"
        ]
      }
    ]
  })
}
