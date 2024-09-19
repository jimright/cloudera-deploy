module "cdp_deploy" {
    source = "git::https://github.com/cloudera-labs/cdp-tf-quickstarts.git//aws"
    
    env_prefix = var.env_prefix
    aws_region = var.aws_region
    
    ingress_extra_cidrs_and_ports = var.ingress_extra_cidrs_and_ports

    deployment_template = var.deployment_template
    datalake_scale      = var.datalake_scale   
    
    env_tags = var.env_tags
}