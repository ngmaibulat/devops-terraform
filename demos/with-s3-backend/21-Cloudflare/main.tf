
# Create a record
resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  value   = "192.168.1.1"
  type    = "A"
  ttl     = 3600
  proxied = false
}


# # Create a page rule
# resource "cloudflare_page_rule" "www" {
#   # ...
# }
