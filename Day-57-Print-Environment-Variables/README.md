# Day 57 – Print Environment Variables in Kubernetes

## Task / Requirement
The DevOps team needs to validate environment variable configuration inside a Kubernetes Pod. A sample Pod is required to print a greeting message composed using multiple environment variables.

The Pod should run once, print the message, and exit without restarting.

**Requirement details:**
- Pod name: `print-envars-greeting`
- Container name: `print-env-container`
- Image: `bash`
- Environment variables:
  - `GREETING=Welcome to`
  - `COMPANY=Nautilus`
  - `GROUP=Industries`
- Command: `["/bin/sh", "-c", "echo "$(GREETING) $(COMPANY) $(GROUP)""]`
- Restart policy: `Never`
- Kubernetes access: `kubectl` configured on jump host

---

## Steps Performed
- Created a Pod definition with environment variables
- Configured the container to print variables using a shell command
- Set restart policy to `Never` to avoid crash loops
- Applied the Pod manifest to the Kubernetes cluster
- Retrieved logs to verify output

---

## Commands Used

```bash
# Create the pod
kubectl apply -f pod.yaml

# Verify pod status
kubectl get pods

# View pod logs
kubectl logs -f print-envars-greeting
```

---

## Expected Outcome
- Pod `print-envars-greeting` is created successfully
- Container prints the greeting message using environment variables
- Output is displayed in pod logs as: `Welcome to Nautilus Industries`
- Pod completes execution and does not restart
- No `CrashLoopBackOff` occurs

---

## Key Learnings
- Environment variables can be injected directly into Pods
- Containers can access environment variables at runtime
- `restartPolicy: Never` is useful for one-time or batch jobs
- `kubectl logs` is used to capture container output
- Kubernetes Pods can be used for simple task execution and validation