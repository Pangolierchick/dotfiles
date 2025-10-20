function fish_prompt
    set -l color_cwd (set_color cyan)
    set -l color_clean (set_color green)
    set -l color_dirty (set_color yellow)
    set -l color_reset (set_color normal)
    set -l color_fail (set_color red)

    echo -n "$color_cwd"(prompt_pwd)"$color_reset"

    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null)
    if test -z "$branch"
        # fallback для detached HEAD
        set branch (command git describe --tags --always 2>/dev/null)
    end

    if test -n "$branch"
        set -l dirty (command git status --porcelain 2>/dev/null)
        if test -n "$dirty"
            echo -n " $color_dirty($branch*)$color_reset"
        else
            echo -n " $color_clean($branch)$color_reset"
        end
    end

    echo -n ' > '
end
