resource "google_storage_bucket" "laravel-bucket" {
  name          = "dot-laravel-bucket"
  location      = "US"
  retention_days = 7
  
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_binding" "sa-access-bucket" {
  bucket = "dot-laravel-bucket"
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:20489990413-compute@developer.gserviceaccount.com",
  ]
}