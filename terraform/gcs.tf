resource "google_storage_bucket" "laravel-bucket" {
  name          = "dot-laravel-bucket"
  location      = "US"
  retention_policy {
    retention_period= 604800
  }
}

resource "google_project_iam_member" "sa-access-bucket" {
  project = var.project_id
  role   = "roles/storage.objectAdmin"
  member = var.ceSA
}


resource "google_storage_bucket_iam_binding" "gcsBucket-binding" {
  bucket = "dot-laravel-bucket"
  role   = "roles/storage.objectAdmin"
  members = [
    var.ceSA,
  ]
}