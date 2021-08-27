# Connect to Yggdrasil cluster from a clientmd

In your `~/.kube/config` file add:

- Cluster certificate:

```yaml
- cluster:
    certificate-authority-data: <SENSITIVE_DATA>
    server: https://<YGGDRASIL_MASTER_IP>:6443
  name: yggdrasil
```

- Context:

```yaml
- context:
    cluster: yggdrasil
    user: yggdrasil
  name: yggdrasil
```

- User:

```yaml
- name: yggdrasil
  user:
    client-certificate-data: <SENSITIVE_DATA>
    client-key-data: <SENSITIVE_DATA>
```
