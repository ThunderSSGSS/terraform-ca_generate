#___________Tags_______________________#

variable "name" { 
    type        = string 
    description = "Name of the certificate on ACM"
}

variable "environment" {
    type    = string
    default = ""
}

variable "managed_by" {
    type    = string
    default = ""
}

#________________CERTIFICATE_INFOS_________________________#

variable "rsa_key_bits" {
    type        = number
    default     = 2048 # for vpn
    description = "The number of bits on private key"
}

# CA subjects
variable "common_name" { type = string }

variable "organization" { type = string }

# Expires
variable "days" { 
    type        = number 
    default     = 1
    description = "Number of valid days"
}