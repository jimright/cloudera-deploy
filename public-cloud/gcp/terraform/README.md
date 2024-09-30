# CDP Public Cloud - Environment and Data Services Example

Constructs a CDP Public Cloud Environment, Datalake and specified Data Services on Azure.

> Uses the [cdp-tf-quickstarts](https://github.com/cloudera-labs/cdp-tf-quickstarts) Terraform module, called via Ansible, to generate the Azure infrastructure pre-requisite resources and the CDP environment and datalake. The [cloudera.cloud](https://github.com/cloudera-labs/cloudera.cloud) Ansible collection is used to deploy the data services.

> **NOTE:** This deployment example does not use a `definition.yml` based configuration file. Instead a standard Ansible extra vars configuration file is used.

## Requirements

To run, you need:

* Docker (or a Docker alterative)
* Google Cloud credentials (set via `GOOGLE_APPLICATION_CREDENTIALS` env var)
* CDP credentials (set via `CDP_ACCESS_KEY_ID`, `CDP_PRIVATE_KEY` env vars)

## Set Up

First, set up your `ansible-navigator` aka `cdp-navigator` environment -- follow the instructions in the [NAVIGATOR document](https://github.com/cloudera-labs/cldr-runner/blob/main/NAVIGATOR.md) in `cloudera-labs/cldr-runner`.

Then, clone this project and change your working directory.

```bash
git clone https://github.com/cloudera-labs/cloudera-deploy.git; cd cloudera-deploy/public-cloud/azure/terraform
```

## Configure

Set the required environment variables:

```bash
export GOOGLE_APPLICATION_CREDENTIALS=location-of-credentials-json-file
export CDP_ACCESS_KEY_ID=your-cdp-access-key-id
export CDP_PRIVATE_KEY=your-cdp-private-id
```

Tweak the `config.yml` parameters to your liking. Notably, you should add and/or change:

```yaml
name_prefix:    ex01      # Keep this short (4-7 characters)
infra_region:   eastus # CSP region for infra
gcp_project_id: ex-project

deployment_template: public # Specify the deployment pattern below. Options are public, semi-private or private

```

> [!NOTE]
> You can override these parameters with any typical Ansible _extra variables_ flags, i.e. `-e name_prefix=ex03`. See the [cldr-runner FAQ](https://github.com/cloudera-labs/cldr-runner/blob/main/FAQ.md#how-do-i-add-extra-variables-and-tags-to-ansible-navigator) for details.

### SSH Keys

This definition will create a new SSH keypair on the host of the name `<name_prefix>-ssh-key.{pem,pub}`. This is stored in the `./tf-cdp-env` directory. A AWS Keypair will be created using the generated public key.

## Execute

Then set up the CDP Public Cloud by running the playbook:

```bash
ansible-navigator run setup.yml -e @./config.yml
```

### Terraform resource files

The Terraform root module resource files run by the playbook is in the `./tf-cdp-env/` sub-directory.

Standard Terraform commands - e.g. `terraform output`, `terraform console`, can be run from within these directories.

## Tear Down

The cleanup is split into two separate playbooks - one to remove all Data Hubs and the second to remove the Cloudera Environment and infrastructure.

Tear down datahubs by running the following command:

```bash
ansible-navigator run teardown-cdp-dh.yml -e @./config.yml
```

Tear down the CDP environment and infrastructure by running the command below:

```bash
ansible-navigator run teardown-cdp-env.yml -e @./config.yml
```
