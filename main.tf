#__________________RSA_KEY________________________________#

resource "tls_private_key" "key" {
    algorithm = "RSA"
    rsa_bits  = var.rsa_key_bits
}

#________________CERTIFICATE_CA____________________________#

resource "tls_self_signed_cert" "ca" {
    #key_algorithm   = "RSA"
    private_key_pem = tls_private_key.key.private_key_pem

    subject {
        common_name  = var.common_name
        organization = var.organization
    }

    validity_period_hours = 24 * var.days

    allowed_uses = [
        "key_encipherment",
        "digital_signature",
        "server_auth"
    ]
}

#________________CERTIFICATE_EXPORT_______________________________#

resource "aws_acm_certificate" "cert" {
    private_key         = tls_self_signed_cert.ca.private_key_pem
    certificate_body    = tls_self_signed_cert.ca.cert_pem
    
    tags = {
        Name        = var.name
        Environment = var.environment
        Managed_by  = var.managed_by
    }
}