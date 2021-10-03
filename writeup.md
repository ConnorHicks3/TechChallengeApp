
- Deployed test app using kubectl:

  ```
  [TechChallengeApp]$ gcloud container clusters create servian-testapp-1
  [TechChallengeApp]$ kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0
  [TechChallengeApp]$ kubectl expose deployment hello-server --type LoadBalancer --port 80 --target-port 8080

  [TechChallengeApp]$ kubectl get pods
  NAME                            READY   STATUS    RESTARTS   AGE
  hello-server-76d47868b4-rg2t9   1/1     Running   0          40s

  [TechChallengeApp]$ kubectl get service hello-server
  NAME           TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
  hello-server   LoadBalancer   10.3.240.165   34.151.106.70   80:30955/TCP   4m46s
  ```

- Deploying Servian app

  ```
  [TechChallengeApp]$ gcloud builds submit
  ```
