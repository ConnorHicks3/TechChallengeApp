# Setup
- VSCode 1.60
  - Install Cloud Code extension
- Google Cloud
  - Enable required APIs
    - Kubernetes Engine API
    - Cloud Build API
  - Create new project *servian-testapp-1*
    - `gcloud projects create servian-app-1`
  - Set active project
    - `gcloud config set project servian-app-1`
  - Create standard GKE cluster
    - `gcloud container clusters create servian-app --zone 'australia-southeast1-a'`

# Build
- Build container images from Dockerfile
  - Generate cloudbuild.yaml configuration
  - Submit build with config
    - `gcloud builds submit --config release/cloudbuild.yaml`

# Deploy
- Create Kubernetes deployment manifest
  - Contains the following:
    - 1x Load Balancer
    - 2x following:
      - 1x TechChallengeApp frontend
      - 1x PostgreSQL database
    - 1x Persistent Volume
