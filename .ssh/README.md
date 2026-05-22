## SSH setup

- Symlinks `~/.ssh/config` to `.dotfiles/.ssh/config`
- SSH keys are managed via Bitwarden
- Copy the private and public keys from Bitwarden into:

  - `~/.ssh/id_ed25519`
  - `~/.ssh/id_ed25519.pub`

- Ensure correct permissions:

  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/id_ed25519
  chmod 644 ~/.ssh/id_ed25519.pub
