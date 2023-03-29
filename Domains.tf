resource "oci_identity_domain" "test_domain" {
    compartment_id = var.compartment_id
    description = "domain"
    display_name = var.display_name
    home_region = "us-ashburn-1"
    license_type = "oracle-apps-premium"
    admin_email = var.admin_email
    admin_first_name = var.first_name
    admin_last_name = var.last_name
    admin_user_name = var.admin_username
    is_notification_bypassed = false
}

