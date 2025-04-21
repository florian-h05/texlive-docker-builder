# Select the installation scheme. 'scheme-small' is a minimal installation scheme.
selected_scheme scheme-small
# Directory where TeX Live will be installed.
TEXDIR /usr/local/texlive/2024
# User-specific configuration directory for TeX Live.
TEXMFCONFIG /texmf-config
# User-specific directory for personal macro files.
TEXMFHOME /texmf
# Directory for locally installed add-ons and configuration files.
TEXMFLOCAL /usr/local/texlive/texmf-local
# System-wide configuration directory for TeX Live.
TEXMFSYSCONFIG /usr/local/texlive/2024/texmf-config
# System-wide variable data directory for TeX Live.
TEXMFSYSVAR /usr/local/texlive/2024/texmf-var
# User-specific variable data directory for TeX Live.
TEXMFVAR /texmf-var

# Install binaries for the x86_64-linux architecture.
binary_x86_64-linux 1

# Adjust the PATH variable automatically.
instopt_adjustpath 1
# Adjust the repository configuration.
instopt_adjustrepo 1
# Do not use letter-size paper as the default.
instopt_letter 0
# Do not create a portable installation.
instopt_portable 0
# Restrict the use of the --shell-escape option for security.
instopt_write18_restricted 1
# Disable automatic backups of the TeX Live Package Database (tlpkg).
tlpdbopt_autobackup 0
# Directory where automatic backups will be stored.
tlpdbopt_backupdir tlpkg/backups
# Automatically create format files.
tlpdbopt_create_formats 1
# Disable desktop integration (e.g., menu shortcuts).
tlpdbopt_desktop_integration 0
# Associate TeX-related file extensions with TeX Live.
tlpdbopt_file_assocs 1
# Do not automatically generate updmap.cfg (for font configuration).
tlpdbopt_generate_updmap 0
# Do not install documentation files.
tlpdbopt_install_docfiles 0
# Do not install source files.
tlpdbopt_install_srcfiles 0
# Enable post-installation code execution.
tlpdbopt_post_code 1
# System-wide directory for TeX Live binaries.
tlpdbopt_sys_bin /usr/local/bin
# System-wide directory for TeX Live info pages.
tlpdbopt_sys_info /usr/local/share/info
# System-wide directory for TeX Live man pages.
tlpdbopt_sys_man /usr/local/share/man
# Enable multi-user support on Windows.
tlpdbopt_w32_multi_user 1
