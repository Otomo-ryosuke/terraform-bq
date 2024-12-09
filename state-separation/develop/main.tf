resource "google_bigquery_dataset" "example_dataset" {
  dataset_id    = "example_dataset_${var.environment}"
  friendly_name = "Example Dataset ${var.environment}"
  location      = "asia-northeast1"
  project       = var.project_id

  labels = {
    environment = var.environment
  }
}

resource "google_bigquery_table" "example_table" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.example_dataset.dataset_id
  table_id   = "example_table"

  deletion_protection = false

  schema = jsonencode([
    {
      name = "id",
      type = "INTEGER",
      mode = "REQUIRED"
    },
    {
      name = "name",
      type = "STRING",
      mode = "NULLABLE"
    }
  ])
}
