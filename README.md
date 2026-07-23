# azure_backup_project

# Terraform: Azure Backup Deployment with Multiple LRS Recovery Services Vaults

## 📌 Overview

This Terraform project deploys **multiple Azure Recovery Services Vaults (RSVs)** configured with:

* **Locally Redundant Storage (LRS) Option to turn it to a ZRS or GRS**
* **2 staggered backup policies in each vault**
* **Automated VM backup enabled based on tags**

The goal is to provide a scalable and policy-driven backup architecture across virtual machines in Azure.

---

## 🏗️ Architecture

* Multiple **Recovery Services Vaults (RSVs)**
* Each vault uses **LRS (Locally Redundant Storage)**
* **2 backup policies** with staggered daily schedules and retention(e.g., hourly/daily variations)
* Backup is **automatically enabled on VMs** that match specific tag criteria

---

## ⚙️ Features

* ✅ Deploy multiple RSVs using Terraform modules
* ✅ Configure LRS storage for cost-effective redundancy
* ✅ Define and assign **5 staggered backup policies**
* ✅ Dynamically enable backup for VMs using **Azure tags**
* ✅ Scalable and reusable Terraform structure

---

## 📁 Project Structure

```
.
|___main.tf
|___variables.tf
|___outputs.tf
|___modules/
|   |___rsv/
│   |___backup_policy/
│   |___vm_backup/
└── README.md
```

---

## 📦 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Review Execution Plan

```bash
terraform plan
```

### 3. Apply Configuration

```bash
terraform apply
```

---

## 🗂️ Configuration

### Variables Example

```hcl
rsv_count           = 3
location            = "eastus"
resource_group_name = "rg-backup-01"

backup_tag_key   = "isBackup"
backup_tag_value = "Enable"
```

---

## 🔄 Backup Policies

The deployment creates **5 staggered backup policies**, for example:

| Policy Name | Schedule Type | Start Time | Retention |
| ----------- | ------------- | ---------- | --------- |
| policy-1    | Daily         | 18:00      | 30days    |
| policy-2    | Daily         | 22:00      | 30days    |
| policy-3    | Daily         | 02:00      | 30days    |


This staggered approach distributes backup load and improves performance.

---

## 🏷️ Tag-Based Backup Enablement

VMs are automatically protected if they contain the following tag:

```hcl
tags = {
  isBackup = "Enable"
  isProcessed = "Yes"
}
```

Terraform will:

1. Discover tagged VMs
2. Assign them to a Recovery Services Vault
3. Apply one of the backup policies

---

## 🔁 Module Details

### `rsv` Module

* Creates Recovery Services Vaults
* Configures LRS storage (optional for ZRS and GRS)

### `backup_policy` Module

* Defines 3 backup policies
* Configures retention and schedules

### `vm_backup` Module

* Identifies VMs via tags
* Enables backup protection
* Associates VMs with policies

---

## 📤 Outputs

* Recovery Services Vault IDs
* Backup Policy IDs
* Protected VM list

---

## 🚀 Customization

You can customize:

* Number of RSVs
* RSV Redundancy
* Backup schedules and retention
* Tag key/value for VM selection
* Regions and resource groups

---

## ⚠️ Notes

* Ensure VM agents are installed and running
* Backup only supports supported VM types (Azure IaaS VMs)
* Tag-based selection requires consistent tagging strategy

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 📚 References

* Azure Backup Documentation
* Terraform Azure Provider Docs

---

## 👨‍💻 Author

Maintained as part of infrastructure automation best practices.

---
