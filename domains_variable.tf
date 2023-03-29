variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment where the Domain will be created"
  validation {
    condition     = length(regexall("^ocid1.compartment.*$", var.compartment_id)) > 0
    error_message = "WLSC-ERROR: The value for compartment_id should start with \"ocid1.compartment.\"."
  }
}

variable "admin_email" {

  type        = string
  description = "Email address of the admin"
  validation {
    condition     = can(regex("^\\S+@\\S+\\.\\S+$", var.admin_email))
    error_message = "Invalid Email address format."
  }
}

variable "display_name" {

  type        = string
  description = "Name of your Domain"
}

variable "first_name" {

  type        = string
  description = "First name"
}

variable "last_name" {

  type        = string
  description = "Last name"

}

variable "admin_username" {

  type        = string
  description = "Username of the Admin"

}