if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# For yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

## Start ssh-agent if not already running
# if not set -q SSH_AUTH_SOCK
#    eval (ssh-agent -c) >/dev/null 2>&1
#end

## Add your default key (suppress error if already added)
#ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1

## Environment Variables
