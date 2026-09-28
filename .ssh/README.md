# SSH

Only `config` is tracked here. Keys are never stored in this repo, and the
`.gitignore` blocks `id_*` and friends.

## Setup

Create `~/.ssh` before running `stow`, otherwise Stow links the whole directory
into the repo instead of linking `config` into a real `~/.ssh`:

```bash
mkdir -p ~/.ssh && chmod 700 ~/.ssh
```

Then copy the key pair from Bitwarden into place and fix the permissions:

```bash
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

`scripts/setup_ssh_keys.sh` generates a new key instead, if there is nothing to
restore.

Check it works:

```bash
ssh -T git@github.com
```

## What is in config

Host aliases so `ssh <alias>` is enough, with `AddKeysToAgent` and `UseKeychain`
on GitHub so the passphrase is asked for once and then kept in the macOS
keychain.
