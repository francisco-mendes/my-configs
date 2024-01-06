
use utils.nu *

export-env { 
    do-once zoxide {
        append-env config.hooks.env_change.PWD {|_, dir| zoxide add -- $dir }
    }
}

def complete (context: string) {
    $context | split words | skip 1 | zoxide query -l $in | lines | where {|it| $it != $env.PWD}
}

# Jump to a directory using only keywords.
export def --env z (...rest: string@complete) {
    zoxide query --exclude $env.PWD -- $rest | cd $in
}

# Jump to a directory using interactive search.
export def --env zi () {
    zoxide query --interactive | cd $in
}

