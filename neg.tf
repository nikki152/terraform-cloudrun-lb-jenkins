resource "google_compute_region_network_endpoint_group" "cr_neg" {
  name                  = "cloudrun-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"
 
  cloud_run {
    service = data.google_cloud_run_service.cloudrun.name
  }
}
 
