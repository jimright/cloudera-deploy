# Copyright 2024 Cloudera, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module "cdp_deploy" {
    source = "git::https://github.com/cloudera-labs/cdp-tf-quickstarts.git//gcp"
    
    env_prefix   = var.env_prefix
    gcp_region   = var.gcp_region
    gcp_project  = var.gcp_project
    
    ingress_extra_cidrs_and_ports = var.ingress_extra_cidrs_and_ports

    deployment_template = var.deployment_template
    datalake_scale      = var.datalake_scale   
    
    env_tags = var.env_tags
}