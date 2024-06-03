resource "aws_glue_job" "this" {
    arn                       = var.arn
    connections               = var.connections
    default_arguments         = var.default_arguments
    glue_version              = var.glue_version
    id                        = var.id
    max_capacity              = var.max_capacity
    max_retries               = var.max_retries
    name                      = var.name
    non_overridable_arguments = var.non_overridable_arguments
    number_of_workers         = var.number_of_workers
    role_arn                  = var.role_arn
    tags                      = var.tags
    tags_all                  = var.tags_all
    timeout                   = var.timeout
    worker_type               = var.worker_type

    command {
        name            = var.command.name
        python_version  = var.command.python_version
        script_location = var.command.script_location
    }

    execution_property {
        max_concurrent_runs = var.execution_property.max_concurrent_runs
    }

    notification_property {
        notify_delay_after = var.notification_property.notify_delay_after
    }
}
