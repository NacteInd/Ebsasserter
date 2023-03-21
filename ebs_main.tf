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
	display_name = "<<Image Name>>"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}

	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTOkiuf5GdUqrE2oPca9epAZmMHMlo1Outs57b7jPB97omGHR+sJOPmjoK10fTL6sfieUJyiY+lPUusZywcwYJPJhAf2YEi/w5JdETrSkHllcr3yZzM0/2wUMFXeYep4B5U5Yx5/dKAIv+YcVXFZClFzCeDhUYe4V5XC5GGXWegUdAyTQrQiHAFCgx9AUQ+O6MnoxWyXkwjIlxiNF4t0JhPI5RwHWd+/hYrQvd+lKNO2Y6UZFOa+cAOreBnq3D3UOjq3261OKfCt4xOYRBKr5C4Rrd2BhdzS4wDKepXVFPOiQ+JYUa96DpI8KEkskMzmou8y9kpPhKIIlKO6Hu4dyP ssh-key-2023-03-21"
	}
	shape = "VM.Standard.E4.Flex"
	shape_config {
		memory_in_gbs = "16"
		ocpus = "1"
	}
	source_details {
		source_id = "ocid1.image.oc1..aaaaaaaa2tmjsfghebtxme4ry25i2svn66vxrbtjd3rba4ibgbyeu5uh4vvq"
		source_type = "image"
	}
}
