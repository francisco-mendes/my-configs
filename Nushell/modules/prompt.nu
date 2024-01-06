export-env {
    load-env {
        STARSHIP_SHELL: "nu"
        STARSHIP_SESSION_KEY: (random chars -l 16)
    
        PROMPT_INDICATOR: ''
        PROMPT_INDICATOR_VI_INSERT: ''
        PROMPT_INDICATOR_VI_NORMAL: ''
        PROMPT_MULTILINE_INDICATOR: {|| ^starship prompt --continuation  }
    
        PROMPT_COMMAND: {||(
            ^starship prompt 
                --cmd-duration $env.CMD_DURATION_MS 
                $"--status=($env.LAST_EXIT_CODE)" 
                --terminal-width (term size).columns
        )}
    
        PROMPT_COMMAND_RIGHT: {||} 
    }
}