def hook [] {
    zoxide add -- (shells | where active == true | get path.0)
}

export def-env z [...rest:string] {
    cd (zoxide query --exclude ($env.PWD) -- $rest | str collect | str trim)
}

export def-env zi  [...rest:string] {
    cd (zoxide query -i -- $rest | str collect | str trim)
}

export env PROMPT_COMMAND {
    let prompt = $env.PROMPT_COMMAND
    { hook; do $prompt } 
}