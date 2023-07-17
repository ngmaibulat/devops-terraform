
data "aws_route53_zone" "selected" {
  name = "ngmapi.com"
}

resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "DemoAPI"
  description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_resource" "MyDemoResource" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  parent_id   = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "MyDemoMethod" {
  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id   = aws_api_gateway_resource.MyDemoResource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "MyDemoIntegration" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id = aws_api_gateway_resource.MyDemoResource.id
  http_method = aws_api_gateway_method.MyDemoMethod.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/${YOUR-LAMBDA-ARN}/invocations"
}

resource "aws_api_gateway_deployment" "MyDemoDeployment" {
  depends_on  = [aws_api_gateway_integration.MyDemoIntegration]
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  stage_name  = "test"
}

resource "aws_api_gateway_domain_name" "MyDemoDomainName" {
  certificate_arn = "<YOUR-CERTIFICATE-ARN>"
  domain_name     = "<YOUR-DOMAIN-NAME>"
}

resource "aws_api_gateway_base_path_mapping" "MyDemoBasePathMapping" {
  api_id      = aws_api_gateway_rest_api.MyDemoAPI.id
  stage_name  = aws_api_gateway_deployment.MyDemoDeployment.stage_name
  domain_name = aws_api_gateway_domain_name.MyDemoDomainName.domain_name
}

resource "aws_route53_record" "MyDemoRecord" {
  name    = aws_api_gateway_domain_name.MyDemoDomainName.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.selected.zone_id

  alias {
    name                   = aws_api_gateway_domain_name.MyDemoDomainName.cloudfront_domain_name
    zone_id                = aws_api_gateway_domain_name.MyDemoDomainName.cloudfront_zone_id
    evaluate_target_health = false
  }
}
