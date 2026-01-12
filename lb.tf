resource "google_compute_backend_service" "backend" {
  name     = "cloudrun-backend"
  protocol = "HTTP"
 
  backend {
    group = google_compute_region_network_endpoint_group.cr_neg.id
  }
}
 
resource "google_compute_url_map" "urlmap" {
  name            = "cloudrun-urlmap"
  default_service = google_compute_backend_service.backend.id
}
 
resource "google_compute_target_http_proxy" "proxy" {
  name    = "cloudrun-proxy"
  url_map = google_compute_url_map.urlmap.id
}
 
resource "google_compute_global_forwarding_rule" "rule" {
  name       = "cloudrun-rule"
  port_range = "80"
  target     = google_compute_target_http_proxy.proxy.id
}
