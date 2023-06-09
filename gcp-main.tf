module "sql-db" {
  source = "GoogleCloudPlatform/sql-db/google//modules/mysql"
  version = "8.0.0"

  # The name of the database instance.
  name = "dbhackgr1instance" 

  # The region of the instance.
  region = var.region
 

  zone =var.zone

  # The database version of the instance.
  database_version = "MYSQL_8_0"

  # The deletion protection of the instance.
  deletion_protection = false

  project_id=var.project_id
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "dbhackgr1instance" {
  name             = "dbhackgr1instance"
  region           = "us-west1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "dbhackgr1-tf" {
  name     = "dbhackgr1tf"
  instance = google_sql_database_instance.dbhackgr1instance.name
}

