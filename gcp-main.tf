module "sql-db" {
  source = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version = "8.0.0"

  # The name of the database instance.
  name = "module-dbhackgr1"

  # The machine type of the instance.
  machine_type = "db-f1-micro"

  # The region of the instance.
  region = var.region

  # The database version of the instance.
  database_version = "MYSQL_8_0"

  # The deletion protection of the instance.
  deletion_protection = false
}

resource "google_artifact_registry_repository" "repo-grupo1-hack" {
  location = var.region
  repository_id = "grupo-01-384720"
  description = "Imagens Docker"
  format = "DOCKER"
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "dbhackgr1-instance" {
  name             = "dbhackgr1-instance"
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

