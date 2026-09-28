# Scripts

Two interactive helpers for SSH keys. Neither is linked into `$HOME`; they stay
in the repo and are run from here.

```bash
~/.dotfiles/scripts/setup_ssh_keys.sh
~/.dotfiles/scripts/cleanup_ssh_keys.sh
```

## setup_ssh_keys.sh

Generates keys on a new machine and wires them up.

- Creates `~/.ssh` with mode 700 if it does not exist
- Generates an Ed25519 key pair, 600 and 644, named `id_ed25519` by default
- Adds it to the SSH agent, and on macOS to the keychain
- Prints the public key so you can paste it into GitHub or a server
- Offers to generate extra named keys for specific hosts or services

It prompts for an email, which is only used as the key comment.

**Two things to know before running it.** Keys are generated with an empty
passphrase (`ssh-keygen -N ""`), which is convenient with the agent but means the
private key file is usable by anything that can read it. Pass a passphrase
yourself if that matters for the machine. Second, it appends an agent block to
`~/.ssh/config` if one is missing, and in this setup that file is a symlink into
the repo, so check `git status` afterward.

If you already have keys in Bitwarden, you do not need this script. Copy them in
by hand instead, as described in `.ssh/README.md`.

## cleanup_ssh_keys.sh

Removes keys safely, in the right order: out of the agent, out of the macOS
keychain, then off disk. It offers a timestamped backup under `~/.ssh/` first,
lists what exists before deleting, and asks for confirmation. Deleting
everything requires typing `DELETE ALL`.

Deleting a key here does not revoke it. Remove the matching public key from
GitHub and from any server's `authorized_keys` too, or it stays authorized.
