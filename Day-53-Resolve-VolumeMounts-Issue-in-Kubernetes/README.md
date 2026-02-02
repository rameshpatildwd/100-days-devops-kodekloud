# Day 53 – Resolve VolumeMounts Issue in Kubernetes

## Task / Requirement
An Nginx + PHP-FPM application running on Kubernetes stopped working due to a configuration issue. The application returned HTTP 403 errors and needed investigation.

The task was to identify and fix the issue related to volume mounts and configuration, then deploy the application content so that the website becomes accessible again.

**Requirement details:**
- Pod name: `nginx-phpfpm`
- ConfigMap name: `nginx-config`
- Application stack: Nginx + PHP-FPM
- Copy file: `/home/thor/index.php` → nginx container document root
- Kubernetes access: `kubectl` configured on jump host

---

## Issue Identified
- The Nginx configuration (ConfigMap) was serving content from `/var/www/html`
- The ninx-container was mounted properly to use `/var/www/html/`
- But the PHP-FPM container was mounting the shared volume at `/usr/share/nginx/html`
- Because both containers were not using the same document root path, Nginx could not serve the PHP file correctly
- This mismatch caused the application to return **403 Forbidden**

---

## Fix Applied
- Updated the PHP-FPM container volume mount path to match Nginx’s document root
- Recreated the Pod so the updated configuration could take effect
- Pod definition is maintained in `pod.yaml`
- Nginx configuration is managed using `nginx-configmap.yaml`
- Copied `index.php` into the shared volume inside the Nginx container
- Verified logs and container filesystem
- Confirmed that the website was accessible

---

## Commands Used

```bash
# Check pod status
kubectl get pods

# Describe the problematic pod
kubectl describe pod nginx-phpfpm

# Check logs from both containers
# Observed 403 forbidden error from nginx-container
kubectl logs nginx-phpfpm
kubectl logs nginx-phpfpm -c nginx-container
kubectl logs nginx-phpfpm -c php-fpm-container

# Inspect ConfigMap
kubectl get cm nginx-config
kubectl get cm nginx-config -o yaml     # Noticed shared vol mounted to /var/www/html

# Export pod definition for editing
kubectl get pod nginx-phpfpm -o yaml > pod.yaml

# Edit pod to fix volumeMount path of php-fpm-container to use /var/www/html
vi pod.yaml

# Recreate pod to apply changes
kubectl delete pod nginx-phpfpm
kubectl apply -f pod.yaml

# Verify pod is running
kubectl get pods

# Copy application file into nginx container
kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html/ -c nginx-container

# Verify file inside container
kubectl exec nginx-phpfpm -c nginx-container -- ls -l /var/www/html/

# Accessed application through webiste button

# Check logs again
kubectl logs nginx-phpfpm -c nginx-container
```

---

## Expected Outcome
- Pod `nginx-phpfpm` runs successfully
- Both `Nginx` and `PHP-FPM` containers share the same document root that's defined in the configmap
- `index.php` is present in `/var/www/html`
- Nginx is able to serve PHP content via PHP-FPM
- Website becomes accessible using the Website button
- No `403` errors are observed

---

## Key Learnings
- All containers sharing a volume must use the same mount path
- ConfigMap paths must align with container volume mounts
- A mismatch in document root paths can cause 403 or application failures
- Multi-container Pods require careful coordination of shared volumes
- Pod logs are critical for debugging runtime issues
- Pods must be recreated to apply spec-level changes
- `kubectl cp` is useful for injecting files into running containers