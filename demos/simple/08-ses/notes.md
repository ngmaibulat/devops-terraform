```terraform

provider "aws" {
  region = "us-west-2"
}

resource "aws_ses_domain_identity" "example" {
  domain = "example.com"
}

resource "aws_ses_domain_dkim" "example" {
  domain = aws_ses_domain_identity.example.id
}

resource "aws_route53_record" "example_amazonses_verification_record" {
  zone_id = "ABCDEFGHIJKL" # replace with your hosted zone ID
  name    = "_amazonses.${aws_ses_domain_identity.example.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.example.verification_token]
}

resource "aws_route53_record" "example_dkim_record" {
  count   = 3
  zone_id = "ABCDEFGHIJKL" # replace with your hosted zone ID
  name    = "${element(aws_ses_domain_dkim.example.dkim_tokens, count.index)}._domainkey.${aws_ses_domain_identity.example.id}"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.example.dkim_tokens, count.index)}.dkim.amazonses.com"]
}
```
