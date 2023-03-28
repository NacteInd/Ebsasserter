resource "oci_identity_domain" "test_domain" {
    compartment_id = "ocid1.compartment.oc1..aaaaaaaatsew3msijirazpzqlgfnxhk6ozgv4zngo7zqjgi4uqbeualbfltq"
    description = "domain"
    display_name = "Terraform"
    home_region = "us-ashburn-1"
    license_type = "oracle-apps-premium"
    admin_email = "sysadmin@test.com"
    admin_first_name = "SysAd"
    admin_last_name = "Admin"
    admin_user_name = "Sysadmin"
    is_notification_bypassed = false
}


