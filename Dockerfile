FROM quay.io/fedora/fedora-minimal

RUN dnf -y install golang wget nvim shadow-utils git-core make gcc fzf ripgrep fd-find zoxide zsh zsh-autosuggestions tar python3-pip newsboat; \
    dnf update -y; \
    dnf clean all; \
    python3 -m pip install basedpyright ruff-lsp neovim; \
    GOBIN=/usr/local/bin go install golang.org/x/tools/gopls@latest && rm -rf /root/go; \
    curl -o install.sh https://starship.rs/install.sh && sh install.sh -f; \
    python3 -m pip install basedpyright ruff-lsp neovim
