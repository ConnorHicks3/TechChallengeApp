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
  - Contains the following objects:
    - Servian App:
      - 1x Deployment
        - `gcr.io/servian-app-1/app:latest`
        - `postgres:10`
      - 2x Service - ClusterIP
      - 1x Service - LoadBalancer
      - 1x PersistentVolume
  - Apply manifests
    - `kubectl apply -f release/backend.yaml`
    - `kubectl apply -f release/frontend.yaml`


# Reflections
- As always, it's the little things that get you. In my case, I spent a solid day trying to work out why the app wasn't working. I finally found that the listener in the config was set to `localhost` instead of `0.0.0.0`. /shrug
- I noticed the `Job` object and thought that it might be a good thing to use for the initialization part of the app deployment. Then I questioned why I would need a separate object to initialize. Turns out there's an `initContainers` option in the `Deployment` object spec.
