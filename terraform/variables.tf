#Variable declaration
variable "s3_bucket_names" {
  type    = list(any)
  default = ["stephaniechester.live", "www.stephaniechester.live"]
}

# Setting variable for subdomain hostname
variable "subdomain" {
  type    = string
  default = "www.stephaniechester.live"
}

variable "domain_name_root" {
  type    = string
  default = "stephaniechester.live"
}