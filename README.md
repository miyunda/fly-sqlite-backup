# Backup your SQLite database on Fly.io to an S3 bucket.

![Status badge](https://github.com/miyunda/fly-sqlite-backup-s3/actions/workflows/backup.yml/badge.svg)

English | [中文](https://miyunda.com/flysqlitebackup/#b-%E6%AD%A3%E6%96%87%E5%BC%80%E5%A7%8B)

## Getting Started

This guide provides instructions on how to backup your Fly.io SQLite database to an S3 bucket.

### Prerequisites

To proceed, you will need to set up the following Github Secrets:

- [x] APP_NAME
- [x] AWS_ACCESS_KEY_ID
- [x] AWS_S3_ENDPOINT
- [x] AWS_S3_REGION
- [x] AWS_SECRET_ACCESS_KEY
- [x] BUCKET_NAME 
- [x] FLY_API_TOKEN
- [x] REPO_TOKEN
#### APP_NAME
This refers to your application.

#### AWS_*
These details can be obtained from your storage service provider. Write-Only (WO) permission is recommended. If this doesn’t work, you can try Read-Write (RW) permission.

#### BUCKET_NAME
The format will be either `S3://<bucket-name>` or `S3://<bucket-name>/<folder-name>/`. If you’re using the latter, ensure the folder is created before running Github Actions.

#### FLY_API_TOKEN
This can be obtained from [Fly.io Deploy Tokens](https://fly.io/docs/reference/deploy-tokens/). If deploy tokens don’t work, try using [Fly.io API Tokens](https://fly.io/docs/flyctl/tokens/).

#### REPO_TOKEN
Once your repository is created, you will need a repo token.
 You can get this from [Fine-grained personal access tokens](https://github.com/settings/tokens?type=beta). Select your new repository from **Repository** drop-down list. The permission should be **Actions** RW.

### Usage

Fork this repository or create your own. Copy the “backup.sh” and “.github/workflows/backup.yml” files. Modify the cron job to suit your needs.

```yaml
  schedule:
    - cron: '5 3 * * *'
```
Above cron job will run every day at 3:05 AM UTC.

## Authors

* **miyunda** - *Initial work* 

## License

This project is licensed under the GPL-3.0 license.
