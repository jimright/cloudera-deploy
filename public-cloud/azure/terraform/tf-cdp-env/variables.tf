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

# ------- Global settings -------
variable "azure_region" {
  type        = string
  description = "Region which Cloud resources will be created"
}

variable "env_prefix" {
  type        = string
  description = "Shorthand name for the environment. Used in resource descriptions"
}

variable "env_tags" {
  type        = map(any)
  description = "Tags applied to pvovisioned resources"

  default = null
}

# ------- CDP Environment Deployment -------
variable "deployment_template" {
  type = string

  description = "Deployment Pattern to use for Cloud resources and CDP"
}

variable "datalake_scale" {
  type = string

  description = "The scale of the datalake. Valid values are LIGHT_DUTY, ENTERPRISE."

  validation {
    condition     = (var.datalake_scale == null ? true : contains(["LIGHT_DUTY", "ENTERPRISE", "MEDIUM_DUTY_HA"], var.datalake_scale))
    error_message = "Valid values for var: datalake_scale are (LIGHT_DUTY, ENTERPRISE, MEDIUM_DUTY_HA)."
  }

  default = null

}

variable "ingress_extra_cidrs_and_ports" {
  type = object({
    cidrs = list(string)
    ports = list(number)
  })
  description = "List of extra CIDR blocks and ports to include in Security Group Ingress rules"

  default = null
}