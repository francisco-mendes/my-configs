export env STARSHIP_SHELL { "nu" }
export env STARSHIP_SESSION_KEY { (random chars -l 16) }
export env PROMPT_MULTILINE_INDICATOR { { 
    ^starship prompt --continuation 
} }

export env PROMPT_INDICATOR { '' }
export env PROMPT_INDICATOR_VI_INSERT { '' }
export env PROMPT_INDICATOR_VI_NORMAL { '' }
export env PROMPT_MULTILINE_INDICATOR { '' }

export env PROMPT_COMMAND { { 
    let input = ([$env.CMD_DURATION_MS, $env.LAST_EXIT_CODE] | into int | math abs)
    ^starship prompt --cmd-duration $input.0 --status $input.1
} }
export env PROMPT_COMMAND_RIGHT { { '' } } 