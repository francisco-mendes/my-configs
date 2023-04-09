# Prompt hook that adds or increases the rank of the current working directory for zoxide
export def pwd-hook () {
    { |_, after: string| zoxide add -- $after }
}

# Change working directory using zoxide to find the closest directory matching the keywords.
export def-env z (
    --interactive (-i): bool, # Whether to use interactive mode
    ...keywords: string # Words to match the directory name 
) {
    let interactive = if $interactive { '-i' } else { '' }
    cd (zoxide query $interactive --exclude ($env.PWD) -- $keywords | str collect | str trim)
}

