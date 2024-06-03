terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "glue"
}


module "ss_work" {
  source = "./jobs_module"

  arn                       = "arn:aws:glue:us-east-1:162196492954:job/ss-work"
  connections               = ["Auroraconnection"]
  default_arguments         = {
    "--TempDir"                          = "s3://txm-poc/txm-iseries-poc-artifacts/temporary/"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "false"
    "--enable-metrics"                   = "true"
    "--enable-observability-metrics"     = "true"
    "--enable-spark-ui"                  = "true"
    "--extra-jars"                       = "s3://e-bill-transactionfileprocessing/dependencies/mysql-connector-j-8.1.0.jar"  
    "--file_name"                        = "s3://txm-162196492954-bucket-poc/INBOUND_TMI_Bills_20240119_011502.txt"
    "--job-bookmark-option"              = "job-bookmark-disable"
    "--job-language"                     = "python"
    "--spark-event-logs-path"            = "s3://txm-poc/txm-iseries-poc-artifacts/sparkHistoryLogs/"
  }
  glue_version              = "4.0"
  id                        = "ss-work"
  max_capacity              = 2
  max_retries               = 0
  name                      = "ss-work"
  non_overridable_arguments = {}
  number_of_workers         = 2
  role_arn                  = "arn:aws:iam::162196492954:role/txm-162196492954-glue-permissions-poc"
  tags                      = {
    "awsApplication" = "arn:aws:resource-groups:us-east-1:162196492954:group/txm-162196492954-myapplication-poc/01oga1hd8wdn55vgcjeqazs2j2"
  }
  tags_all                  = {
    "awsApplication" = "arn:aws:resource-groups:us-east-1:162196492954:group/txm-162196492954-myapplication-poc/01oga1hd8wdn55vgcjeqazs2j2"
  }
  timeout                   = 60
  worker_type               = "G.1X"

  command = {
    name            = "glueetl"
    python_version  = "3"
    script_location = "s3://txm-poc/txm-iseries-poc-artifacts/scripts/ss-work.py"
  }

  execution_property = {
    max_concurrent_runs = 2
  }

  notification_property = {
    notify_delay_after = 60
  }
}

module "test_glue_job_poc" {
  source = "./jobs_module"

  arn                       = "arn:aws:glue:us-east-1:162196492954:job/test-glue-job-poc"
  connections               = ["Auroraconnection"]
  default_arguments         = {
    "--TempDir"                          = "s3://txm-poc/txm-iseries-poc-artifacts/temporary/"
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-glue-datacatalog"          = "true"
    "--enable-job-insights"              = "false"
    "--enable-metrics"                   = "true"
    "--enable-observability-metrics"     = "true"
    "--enable-spark-ui"                  = "true"
    "--extra-jars"                       = "s3://e-bill-transactionfileprocessing/dependencies/mysql-connector-j-8.1.0.jar"  
    "--file_name"                        = "s3://txm-162196492954-bucket-poc/INBOUND_TMI_Bills_20240119_011502.txt"
    "--job-bookmark-option"              = "job-bookmark-disable"
    "--job-language"                     = "python"
    "--spark-event-logs-path"            = "s3://txm-poc/txm-iseries-poc-artifacts/sparkHistoryLogs/"
  }
  glue_version              = "4.0"
  id                        = "test-glue-job-poc"
  max_capacity              = 2
  max_retries               = 0
  name                      = "test-glue-job-poc"
  non_overridable_arguments = {}
  number_of_workers         = 2
  role_arn                  = "arn:aws:iam::162196492954:role/txm-162196492954-glue-permissions-poc"
  tags                      = {
    "awsApplication" = "arn:aws:resource-groups:us-east-1:162196492954:group/txm-162196492954-myapplication-poc/01oga1hd8wdn55vgcjeqazs2j2"
  }
  tags_all                  = {
    "awsApplication" = "arn:aws:resource-groups:us-east-1:162196492954:group/txm-162196492954-myapplication-poc/01oga1hd8wdn55vgcjeqazs2j2"
  }
  timeout                   = 60
  worker_type               = "G.1X"

  command = {
    name            = "glueetl"
    python_version  = "3"
    script_location = "s3://txm-poc/txm-iseries-poc-artifacts/scripts/test-glue-job-poc.py"
  }

  execution_property = {
    max_concurrent_runs = 2
  }

  notification_property = {
    notify_delay_after = 60
  }
}
