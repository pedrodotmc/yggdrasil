# Configure self-hosted runner

1. Add self-hosted runner in repo: [GitHub Documentation](https://docs.github.com/es/actions/hosting-your-own-runners/adding-self-hosted-runners#adding-a-self-hosted-runner-to-a-repository).

2. Create a new SSH key pair to be used in the pipeline:

```bash
ssh-keygen -t ecdsa -b 521 -C "my-super-key@email.com"
```

3. Add public key to GitHub.

4. Add private key to GitHub secrets.

