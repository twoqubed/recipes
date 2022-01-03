resource "aws_apigatewayv2_api" "recipe_app" {
  name          = "Recipe App"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.recipe_app.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_apigatewayv2_integration" "recipe_app" {
  api_id             = aws_apigatewayv2_api.recipe_app.id
  credentials_arn    = aws_iam_role.api_gateway.arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
  integration_uri    = aws_lambda_function.svelte_app.invoke_arn
  connection_type    = "INTERNET"
}

resource "aws_apigatewayv2_route" "heroku_releases_webhook" {
  api_id    = aws_apigatewayv2_api.recipe_app.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.recipe_app.id}"
}
