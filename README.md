# aws-iam
AIMを管理するためのTerraformのコード

## Build locally

### Preconditions

* [Homebrew](https://brew.sh/index_ja.html)

### Installation or Upgrade

* install terraform(0.11.0 or more)

```
brew install terraform
terraform --version
> Terraform v0.11.0
```

```
brew upgrade terraform
terraform --version
> Terraform v0.11.0
```

### initialize

```
make remote-enable ENV=dev TARGET=roles
make create-env ENV=dev TARGET=roles
```
