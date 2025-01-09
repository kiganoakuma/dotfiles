# ~/.config/nushell/config.nu
source ~/.config/nushell/yazi.nu
source ~/.config/nushell/env.nu
source ~/.config/nushell/prompt.nu
# Load completions
$env.config = {
    show_banner: false  # Disable the welcome message
    # History configurations - similar to your zsh setup
    history: {
        max_size: 5000
        sync_on_enter: true     # similar to sharehistory
        file_format: "plaintext"
        isolation: false         # similar to sharehistory
    }
    
    # Completion settings
    completions: {
        case_sensitive: false    # similar to your matcher-list
        quick: true             # similar to menu no
        partial: true
        algorithm: "fuzzy"      # enables fuzzy matching
    },
    
    # Color configurations
    ls: {
        use_ls_colors: true
    }

}

# Aliases - similar to your zsh aliases
alias ll = ls -l    # detailed view
alias la = ls -a    # show hidden files
alias lt = ls -t    # sort by modification time
alias c = clear
alias py = python3
alias python = python3
def gl [] { 
    git log --pretty=format:"%h|%an|%ad|%s" | lines | split column "|" commit_id author date message
}
alias nv = nvim


# Initialize zoxide
zoxide init nushell | save -f ~/.config/nushell/zoxide.nu
source ~/.config/nushell/zoxide.nu

# Custom keybindings
# Note: Nushell's keybinding syntax is different
$env.config.keybindings = [
    {
        name: history_search_backward
        modifier: control
        keycode: char_p
        mode: [emacs vi_normal vi_insert]
        event: { send: MenuUp }
    }
    {
        name: history_search_forward
        modifier: control
        keycode: char_n
        mode: [emacs vi_normal vi_insert]
        event: { send: MenuDown }
    }
]
