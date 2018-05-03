# tf-dd-prov-monitor-template
**Sample** of  
Templating Datadog Monitor using Terraform Datadog Provider

## Description

- Write the Datadog Monitor message in "here document"
- Manage notification in groups

### Files

```
├── README.md
├── datadog_key.auto.tfvars      # api keys
├── datadog_monitor.auto.tfvars  # define notify group
├── datadog_monitor.tf           # define provider
├── datadog_monitor_template.tf  # define template
├── monitor_ec2_sample.tf        # monitor sample
└── templates
    ├── message.tmpl             # message common part sample
    └── notify.tmpl              # message notification part sample
```

## Requirements

- [Provider: Datadog \- Terraform by HashiCorp](https://www.terraform.io/docs/providers/datadog/index.html)
- [Provider: Template \- Terraform by HashiCorp](https://www.terraform.io/docs/providers/template/index.html)

## Reference

- [Managing Datadog with Terraform](https://www.datadoghq.com/blog/managing-datadog-with-terraform/)

## Usage

### 1) download

```
$ git clone https://github.com/htnosm/tf-dd-prov-monitor-template.git
$ cd tf-dd-prov-monitor-template
```

### 2) edit datadog_key.auto.tfvars

Input Your Datadog API Key & Application Key.

### 3) terraform init

```
$ terraform init
# Check the terraform plan command ends successfull.
$ terraform plan
```

### 4) edit files

Edit various files according to the purpose.

- e.g.)
  - Edit datadog_monitor.auto.tfvars to define a notification group
  - Edit templates/message.tmpl to notification body template
  - Edit templates/notify.tmpl to notification template
  - Add * .tf and increase various definitions
