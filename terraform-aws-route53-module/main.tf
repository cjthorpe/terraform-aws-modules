# Need hosted zone creating.

resource "aws_route53_zone" "public" {
  name = var.hz_name
}

resource "aws_route53_record" "public" {
  allow_overwrite = true
  name            = var.record_name
  records         = [
    "${aws_route53_zone.public.name_servers.0}",
    "${aws_route53_zone.public.name_servers.1}",
    "${aws_route53_zone.public.name_servers.2}",
    "${aws_route53_zone.public.name_servers.3}"
  ]
  ttl             = var.ttl
  type            = var.type
  zone_id         = aws_route53_zone.public.zone_id
}
