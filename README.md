# apigee-app-engine-demo
 This repo is for training purposes for GCP and Apigee X.

## Launch multipass with initial config

```shell
multipass launch --name gcp-tools --cpus 2 --memory 4G --disk 20G --cloud-init ./utils/multipass/gcp-config.yaml
```