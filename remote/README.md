# NixOS config for my personal VPS server

Currentry I am using VPS only for nextcloud instance

## Hosting

[Scaleway][scaleway] is used as a hosting. Ubuntu was initially installed
and then reinstalled to NixOS using [NixOS-Infect][nixos-infect] with a little [patch][nixos-infect-patched]

```sh
curl https://raw.githubusercontent.com/aitvann/nixos-config/master/remote/nixos-infect-patched.sh | NIX_CHANNEL=nixos-21.11 bash -x
```

## Nextcloud

After rebuilding the system additional PostgreSQL maintenance is required

```sh
sudo -i nextcloud-occ db:add-missing-indices
sudo -i nextcloud-occ maintenance:mode --on
sudo -i nextcloud-occ db:convert-filecache-bigint
sudo -i nextcloud-occ maintenance:mode --off
```

Do not forget to rebuild the system one moretime !

Passwords for database and admin are not used because data entrypted
on client side anyway

```sh
sudo nixos-rebuild switch
```

Many thanks to the original [guide][nixos-nextcloud-guide] !

[scaleway]: https://scaleway.com/
[nixos-infect]: https://github.com/elitak/nixos-infect
[nixos-infect-patched]: nixos-infect-patched.sh
[nixos-nextcloud-guide]: https://jacobneplokh.com/how-to-setup-nextcloud-on-nixos/
