resource "google_artifact_registry_repository" "repo-grupo1-hack" {
  location = var.region
  repository_id = "grupo-01-384720"
  description = "Imagens Docker"
  format = "DOCKER"
}