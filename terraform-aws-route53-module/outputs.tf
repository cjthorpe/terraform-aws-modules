output "public_name_servers" {
  value = "${aws_route53_zone.public.name_servers}"
}

output "zone_id" {
  value = aws_route53_zone.public.zone_id
}
