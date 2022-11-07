output "cert_pem" {
    value = tls_self_signed_cert.ca.cert_pem
}

output "private_key_pem" {
    value = tls_private_key.key.private_key_pem
}

output "cert_arn" {
    value = aws_acm_certificate.cert.arn
}