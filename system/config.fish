# ─────────────────────────────────────────────────────────────────────────────
# 1. GLOBAL ENVIRONMENT & PATH (Applies to all shells)
# ─────────────────────────────────────────────────────────────────────────────
# fish_add_path "$HOME/.npm-global/bin"

# ─────────────────────────────────────────────────────────────────────────────
# 2. INTERACTIVE-ONLY SETUP (Skipped for scripts/CI/non-interactive shells)
# ─────────────────────────────────────────────────────────────────────────────
if status is-interactive
    # Starship Prompt
    starship init fish | source
    # Yazi CD integration
    function y
        set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    # SSH Agent
    #if not set -q SSH_AUTH_SOCK
    #    if test -f ~/.ssh/agent.env
    #        source ~/.ssh/agent.env
    #    end

    #    ssh-add -l >/dev/null 2>&1
    #    or begin
    #        ssh-agent -c | sed '/^echo/d' >~/.ssh/agent.env
    #        source ~/.ssh/agent.env
    #    end
    #end

    #if test -f "$HOME/.ssh/id_ed25519"
    #    ssh-add -q "$HOME/.ssh/id_ed25519" 2>/dev/null
    #end
end


