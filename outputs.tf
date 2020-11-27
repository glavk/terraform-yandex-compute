output "compute_instance_internal_ip" {
  description = "The internal IP address of the instance"
  value       = yandex_compute_instance.this.network_interface.0.ip_address
}

output "compute_instance_external_ip" {
  description = "The external IP address of the instance"
  value       = yandex_compute_instance.this.network_interface.0.nat_ip_address
}

output "compute_instance_fqdn" {
  description = "The fully qualified DNS name of this instance"
  value       = yandex_compute_instance.this.fqdn
}
