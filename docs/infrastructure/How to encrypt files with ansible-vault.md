# How to encrypt files with ansible-vault

1. If ANSIBLE_VAULT_SECRET is not created in GitHub secrets, add it.

2. Encrypt the file with:

```bash
ansible-vault encrypt ./ansible/templates/sshd_config
```

3. Edit file with:

```bash
EDITOR=nano ansible-vault edit ./ansible/templates/sshd_config
```
