module "sql-db" {
  source = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version = "8.0.0"

  # The name of the database instance.
  name = "dbhackgr1" 

  # The region of the instance.
  region = var.region

  zone =var.zone

  # The database version of the instance.
  database_version = "MYSQL_8_0"

  # The deletion protection of the instance.
  deletion_protection = false

  project_id=var.project_id
}

resource "google_artifact_registry_repository" "repogrupo1hack" {
  location = var.region
  repository_id = "grupo-01-384720"
  description = "Imagens Docker"
  format = "DOCKER"
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "dbhackgr1instance" {
  name             = "dbhackgr1instance"
  region           = "us-west1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_sql_database" "dbhackgr1" {
  name     = "dbhackgr1"
  instance = google_sql_database_instance.dbhackgr1.name
}

