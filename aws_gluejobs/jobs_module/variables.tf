variable "arn" {
    description = "The ARN of the Glue job."
    type        = string
}

variable "connections" {
    description = "The list of connections used by the Glue job."
    type        = list(string)
}

variable "default_arguments" {
    description = "The default arguments for the Glue job."
    type        = map(string)
}

variable "glue_version" {
    description = "The version of Glue to use."
    type        = string
}

variable "id" {
    description = "The ID of the Glue job."
    type        = string
}

variable "max_capacity" {
    description = "The maximum capacity for the Glue job."
    type        = number
}

variable "max_retries" {
    description = "The maximum number of retries for the Glue job."
    type        = number
}

variable "name" {
    description = "The name of the Glue job."
    type        = string
}

variable "non_overridable_arguments" {
    description = "Non-overridable arguments for the Glue job."
    type        = map(string)
}

variable "number_of_workers" {
    description = "The number of workers for the Glue job."
    type        = number
}

variable "role_arn" {
    description = "The ARN of the IAM role for the Glue job."
    type        = string
}

variable "tags" {
    description = "Tags for the Glue job."
    type        = map(string)
}

variable "tags_all" {
    description = "All tags for the Glue job."
    type        = map(string)
}

variable "timeout" {
    description = "The timeout for the Glue job."
    type        = number
}

variable "worker_type" {
    description = "The type of worker for the Glue job."
    type        = string
}

variable "command" {
    description = "The command for the Glue job."
    type = object({
        name            = string
        python_version  = string
        script_location = string
    })
}

variable "execution_property" {
    description = "The execution properties for the Glue job."
    type = object({
        max_concurrent_runs = number
    })
}

variable "notification_property" {
    description = "The notification properties for the Glue job."
    type = object({
        notify_delay_after = number
    })
}
