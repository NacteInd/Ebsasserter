provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "kYXC:US-ASHBURN-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaatsew3msijirazpzqlgfnxhk6ozgv4zngo7zqjgi4uqbeualbfltq"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.iad.aaaaaaaatnu7ugilaqge5il4m54ic5synorkco7vkfumsgs2rskv3dul5z4a"
	}
	display_name = "Instance"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"user_data" = "IyEvYmluL2Jhc2gKc3VkbyBta2RpciBob21lL29wYy9zY3JpcHRzCmNkIC9ob21lL29wYy9zY3JpcHRzCnN1ZG8gdG91Y2ggdGVzdDEyLnB5CnN1ZG8gY2htb2QgNzc3IHRlc3QxMi5weQplY2hvICJwcmludCgnSGVsbG8gV29ybGQnKSIgPiB0ZXN0MTIucHk="
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbfJgTLPlvsHeu/KDEnFAh1xBrfQdulhYS5cQg+pSkvEKVj/t4T7iJn/UV6OPxxhxe2Yie7KDTiQKYW4WOGGhfeK2tHzn8++2fyEGXCg+fHaaATJRVuYy9xUCrNM4L96N1qr+jaIksPRWryO7A2q/x6oyXv0PMobxGcJlr1IKOCf8q5twgmUsar5WM0fTScTIG9XU4ovQw3RQZez5uXceAMTHzciPShQVUgsSTY1zlfrkPOA/lZqqbkzKC3blLXHFfkLya2cgMLwTzTw+p+LZfT4w8ZKJY72Lp1bFoWms8O21vyqNSn/Tx3ecaiGYvLN9niMq5j1RxfYfCIa26iQNp ssh-key-2023-03-27"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "8"
		ocpus = "1"
	}
	source_details {
		source_id = "ocid1.image.oc1..aaaaaaaa2tmjsfghebtxme4ry25i2svn66vxrbtjd3rba4ibgbyeu5uh4vvq"
		source_type = "image"
	}
	depends_on = [
		oci_core_app_catalog_subscription.generated_oci_core_app_catalog_subscription
	]
}

resource "oci_core_app_catalog_subscription" "generated_oci_core_app_catalog_subscription" {
	compartment_id = "ocid1.compartment.oc1..aaaaaaaatsew3msijirazpzqlgfnxhk6ozgv4zngo7zqjgi4uqbeualbfltq"
	eula_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.eula_link}"
	listing_id = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.listing_id}"
	listing_resource_version = "Oracle-E-Business-Suite-Vision-Image-12.2.11-19C-ECC-04-14-2022"
	oracle_terms_of_use_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link}"
	signature = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.signature}"
	time_retrieved = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.time_retrieved}"
}

resource "oci_core_app_catalog_listing_resource_version_agreement" "generated_oci_core_app_catalog_listing_resource_version_agreement" {
	listing_id = "ocid1.appcataloglisting.oc1..aaaaaaaa7z2ddhnljspvog5nq3lk4nnymjr76jr4jcgwxq3vqoojh7pqfbaq"
	listing_resource_version = "Oracle-E-Business-Suite-Vision-Image-12.2.11-19C-ECC-04-14-2022"
}
