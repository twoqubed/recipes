data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../build/server/serverless.js"
  output_path = "../build/server/lambda.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = "RecipeApp"
  role          = aws_iam_role.recipe_app.arn
  handler       = "serverless.handler"
  runtime       = "nodejs14.x"

  source_code_hash = filebase64sha256(data.archive_file.lambda.output_path)
}
