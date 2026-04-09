#!/usr/bin/env bash
set -uo pipefail

# ── Neovim dependency installer ──────────────────────────────────────
# Installs all system-level dependencies required by the nvim config.
# Supports macOS (Homebrew) and Linux (apt / dnf).

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

info()  { printf "${GREEN}[+]${NC} %s\n" "$*"; }
warn()  { printf "${YELLOW}[!]${NC} %s\n" "$*"; }
error() { printf "${RED}[x]${NC} %s\n" "$*"; exit 1; }

# ── Detect package manager ───────────────────────────────────────────
SUDO=""
if [ "$(id -u)" -ne 0 ]; then
  SUDO="sudo"
fi

if command -v brew &>/dev/null; then
  PM="brew"
elif command -v apt-get &>/dev/null; then
  PM="apt"
elif command -v dnf &>/dev/null; then
  PM="dnf"
else
  error "No supported package manager found (brew, apt, dnf)"
fi

info "Detected package manager: $PM"

if [ "$PM" = "apt" ]; then
  info "Updating apt package index ..."
  $SUDO apt-get update
fi

install_pkg() {
  local pkg="$1"
  local name="${2:-$pkg}"

  if command -v "$name" &>/dev/null; then
    info "$name already installed, skipping"
    return
  fi

  info "Installing $pkg ..."
  case "$PM" in
    brew) brew install "$pkg" ;;
    apt)  $SUDO apt-get install -y "$pkg" ;;
    dnf)  $SUDO dnf install -y "$pkg" ;;
  esac
}

# ── Core dependencies ────────────────────────────────────────────────
info "── Core ──"
install_pkg git git
install_pkg curl curl

# neovim (>= 0.11 required for vim.pack, vim.lsp.config)
if command -v nvim &>/dev/null; then
  NVIM_VER="$(nvim --version | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"
  NVIM_MINOR="$(echo "$NVIM_VER" | cut -d. -f2)"
  if [ "$NVIM_MINOR" -ge 11 ]; then
    info "nvim $NVIM_VER already installed, skipping"
  else
    warn "nvim $NVIM_VER is too old (need >= 0.11), upgrading ..."
  fi
fi

if ! command -v nvim &>/dev/null || [ "${NVIM_MINOR:-0}" -lt 11 ]; then
  info "Installing Neovim (latest stable) ..."
  case "$PM" in
    brew)
      brew install neovim
      ;;
    apt|dnf)
      NVIM_TAG="$(curl -sfL https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | cut -d'"' -f4)"
      ARCH="$(uname -m)"
      case "$ARCH" in
        x86_64)  NVIM_ARCH="nvim-linux-x86_64" ;;
        aarch64|arm64) NVIM_ARCH="nvim-linux-arm64" ;;
        *) error "Unsupported architecture: $ARCH" ;;
      esac
      info "Downloading neovim $NVIM_TAG ($NVIM_ARCH) ..."
      curl -fLo "/tmp/${NVIM_ARCH}.tar.gz" \
        "https://github.com/neovim/neovim/releases/download/${NVIM_TAG}/${NVIM_ARCH}.tar.gz"
      $SUDO tar xzf "/tmp/${NVIM_ARCH}.tar.gz" -C /opt
      $SUDO ln -sf "/opt/${NVIM_ARCH}/bin/nvim" /usr/local/bin/nvim
      rm -f "/tmp/${NVIM_ARCH}.tar.gz"
      info "Installed nvim $NVIM_TAG to /usr/local/bin/nvim"
      ;;
  esac
fi

# ── Fuzzy finding / search (fzf-lua, live_grep, FindFiles) ───────────
info "── Fuzzy finding & search ──"
install_pkg fzf fzf
install_pkg ripgrep rg
case "$PM" in
  apt)  install_pkg fd-find fdfind ;;
  dnf)  install_pkg fd-find fd ;;
  brew) install_pkg fd fd ;;
esac
# apt installs fd as 'fdfind' -- symlink it
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
  $SUDO ln -sf "$(command -v fdfind)" /usr/local/bin/fd
  info "Symlinked fdfind -> fd"
fi

# ── Language toolchains ──────────────────────────────────────────────
info "── Language toolchains ──"

# Node / npm -- needed by Mason for many LSPs & prettier
case "$PM" in
  brew) install_pkg node node ;;
  apt)  install_pkg nodejs node; install_pkg npm npm ;;
  dnf)  install_pkg nodejs node; install_pkg npm npm ;;
esac

# Rust toolchain -- rust-analyzer, crates.nvim, blink.cmp prefer_rust
if ! command -v rustup &>/dev/null; then
  info "Installing Rust toolchain via rustup ..."
  curl --proto '=https' --tlsv1.2 -Sf https://sh.rustup.rs | sh -s -- -y
  # shellcheck disable=SC1091
  source "$HOME/.cargo/env" 2>/dev/null || true
else
  info "rustup already installed, skipping"
fi

# Python
install_pkg python3 python3
install_pkg python3-venv python3-venv

# Build toolchain -- cargo compiles from source; bindgen requires libclang
case "$PM" in
  apt)  $SUDO apt-get install -y build-essential libclang-dev ;;
  dnf)  $SUDO dnf groupinstall -y "Development Tools"; $SUDO dnf install -y clang-devel ;;
  brew) ;; # Xcode CLT provides cc + libclang
esac

# Tree sitter
cargo install tree-sitter-cli

# UV 
curl -LsSf https://astral.sh/uv/install.sh | sh

# ── Done ─────────────────────────────────────────────────────────────
echo ""
info "All dependencies installed."
info "Open nvim and run :Mason to install any remaining LSP servers."
info "Treesitter parsers will install automatically on first launch."
