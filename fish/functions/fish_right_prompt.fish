function kubectx_prompt
    if not type -q kubectx
        return
    end

    set -l ctx (kubectx -c 2>/dev/null)
    if test $status -ne 0
        return
    end

    set -l color brblack
    if string match -qr 'prod' -- $ctx
        set color red
    else if string match -qr 'stage|stg|std' -- $ctx
        set color yellow
    end

    set_color $color
    echo -n "⎈ $ctx"
    set_color normal
end


function fish_right_prompt
    kubectx_prompt
end
