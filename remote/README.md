# NixOS config for my personal VPS server

Currentry I am using VPS only for nextcloud instance

## Hosting

[Scaleway][scaleway] is used as a hosting. Ubuntu was initially installed
and then reinstalled to NixOS using [NixOS-Infect][nixos-infect] with a little [patch][nixos-infect-patched]

```sh
curl https://raw.githubusercontent.com/aitvann/nixos-config/master/remote/nixos-infect-patched.sh | NIX_CHANNEL=nixos-21.11 bash -x
```

After rebuilding the system a few more steps are required.

## Wireguard

* Generate key pair

    ```sh
    umask 077
    sudo -i wg genkey > /var/wireguard-privatekey
    sudo -i wg pubkey < /var/wireguard-privatekey > /var/wireguard-publickey
    ```

## Nextcloud

* Add password files

    Add database password

    ```sh
    umask 077
    sudo -i nvim /var/nextcloud-db-pass
    sudo -i chown nextcloud /var/nextcloud-db-pass
    ```

    Add admin password

    ```sh
    umask 077
    sudo -i nvim /var/nextcloud-admin-pass
    sudo -i chown nextcloud /var/nextcloud-admin-pass
    ```

* Download and enable End-To-End Entryption app

Do not forget to rebuild the system one moretime !

```sh
sudo nixos-rebuild switch
```

Many thanks to the original [guide][nixos-nextcloud-guide] !

[scaleway]: https://scaleway.com/
[nixos-infect]: https://github.com/elitak/nixos-infect
[nixos-infect-patched]: nixos-infect-patched.sh
[nixos-nextcloud-guide]: https://jacobneplokh.com/how-to-setup-nextcloud-on-nixos/
