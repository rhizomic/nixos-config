* Choose NixOS 23.05... Installer

* Go through GUI, setting your username to `rhizomic`

* Reboot

Edit `/etc/nixos/configuration.nix`:

```
sudo nano /etc/nixos/configuration.nix
```

* Change `environment.systemPackages` to:

```
environment.systemPackages = with pkgs; [
  vim
  wget
  git
];
```

* Exit `nano`

* Run `sudo nixos-rebuild switch`

* Edit `/etc/nixos/configuration.nix`, this time with `vim`:

```
sudo vim /etc/nixos/configuration.nix
```

* Ensure `networking.networkmanager.enable = true;`

* Ensure `users.users.rhizomic.extraGroups` contains `"networkmanager"`:

```
  users.users.rhizomic = {
    isNormalUser = true;
    description = "rhizomic";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
```

* Run `sudo nixos-rebuild switch`

* If a connection to a wireless network is needed, run `nmtui` and activate it

* Run:

```
cd ~
git clone https://github.com/rhizomic/nixos-config.git
cd nixos-config
cp /etc/nixos/hardware-configuration.nix .
```

* Check that the boot configuration in `~/nixos-config/configuration.nix`
  matches what's in `/etc/nixos/configuration.nix`:

```
# Example
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
```

* Run:

```
sudo nixos-rebuild switch --flake .#202308091237
```

* Take a break

* If you didn't set your username as `rhizomic` during the installation, you'll
need to do the following:

```
# Log out
exit

# Log in as root

# Set the password for rhizomic
passwd rhizomic

# Log out
exit

# Log in as rhizomic

# Copy over the config
cd ~
sudo cp -R /home/$INITIAL_USER/nixos-config .
sudo chown -R rhizomic:users nixos-config
```

* `reboot`

* Log in as `rhizomic`

* Set up SSH keys:

```
ssh-keygen -t ed25519 -C "whatever"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

* If you need to copy the SSH key (for e.g., GitHub):

```
cat ~/.ssh/id_ed25519.pub
```
