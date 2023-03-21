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
	availability_domain = "IFUV:US-ASHBURN-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaanneylhk3ibv2dmorxqgklcloydwnror5b3fs4ag7dlrbsiwkjdea"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.iad.aaaaaaaaxlgss5jier3km4iasesmyfqzylsdddxxffla6jid3mrcakjpdl7q"
	}
	display_name = "instance-20230320-2125"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "16"
		ocpus = "1"
	}
	source_details {
		source_id = "ocid1.image.oc1..aaaaaaaagrmncsysh64fj5hh5pcjr6swo6oyzzbh4woi4q4hsyct6n5eqkuq"
		source_type = "image"
	}
	depends_on = [
		oci_core_app_catalog_subscription.generated_oci_core_app_catalog_subscription
	]
}

	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCB+S4QP+yWVvxiDVQmOcmpvNHGHqeJI7fDJW36TDzNPFACeCFQU/ikhD2LTu/zmrgTrWHtKA0yoehbVbqLr5hKL7TWZPsk4ilEEPaIfZaQkBr1b2+4dR450wC5i3UqyLyzLtGYdMQc0jpTjBlSAJqq2feVaB7YXYioDqdyl3R4u1DTRsSwit7DYb4s65bmn7qIDcPpqJeil0xlc0Y6Y5IYRRLFq5oBZzqEqDrwElbqc+BuJHXEIhdCStm/CUZC5tUgMgLN6lH3XqGvkBa41h/DryMOZNj5ZJClPzEb8fpzq9fr71DElIHPgYwGfTYc2+CVBo106TSYR5ZJBLTKft81 ssh-key-2023-03-20"
	}

resource "oci_core_app_catalog_subscription" "generated_oci_core_app_catalog_subscription" {
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaanneylhk3ibv2dmorxqgklcloydwnror5b3fs4ag7dlrbsiwkjdea"
	eula_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.eula_link}"
	listing_id = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.listing_id}"
	listing_resource_version = "23.1.1-ol7.9-22.08.29-230118-1"
	oracle_terms_of_use_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link}"
	signature = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.signature}"
	time_retrieved = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.time_retrieved}"
}

resource "oci_core_app_catalog_listing_resource_version_agreement" "generated_oci_core_app_catalog_listing_resource_version_agreement" {
	listing_id = "ocid1.appcataloglisting.oc1..aaaaaaaa653zc2e4fsem5hhwinmfgnv3xp4dmbq6c6gvf45okxf6xz3smhiq"
	listing_resource_version = "23.1.1-ol7.9-22.08.29-230118-1"
}
