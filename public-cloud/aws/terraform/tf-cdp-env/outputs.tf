output "cdp_environment_name" {
  value = module.cdp_deploy.cdp_environment_name
  description = "CDP Environment Name"

}

output "cdp_environment_crn" {
  value = module.cdp_deploy.cdp_environment_crn
  description = "CDP Environment CRN"

}

output "aws_vpc_id" {
  value = module.cdp_deploy.aws_vpc_id
  description = "AWS VPC ID"
}