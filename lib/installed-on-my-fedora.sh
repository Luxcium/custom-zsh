(
sudo dnf -x 'xorg-x11-drv-nouveau' update -y
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y kde-plasma-workspaces
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y core
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y administration-tools
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y base-x
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y dial-up-networking-support
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y fonts
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y guest-desktop-agents
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y hardware-support
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y input-methods
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y kde
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y multimedia
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y common-networkmanager-submodules
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y printing-support
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y standard
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y c-development
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y editors
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y libreoffice
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y office-productivity
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y window-managers
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y sound-and-video
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y system-tools
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y kde-desktop-environment
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y admin-tools
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y development-tools
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y headless-management
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y text-internet
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y graphical-internet
sudo dnf -x 'xorg-x11-drv-nouveau' group install -y kde-desktop
sudo dnf -x 'xorg-x11-drv-nouveau' distro-sync -y
sudo dnf remove -y xorg-x11-drv-nouveau
)
