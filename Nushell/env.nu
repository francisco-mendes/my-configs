# Nushell Environment Config File

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded

export-env {
    load-env {
        ENV_CONVERSIONS: {
            "PATH": {
                from_string: { |s| $s | split row (char esep) | path expand -n }
                to_string: { |v| $v | path expand -n | str join (char esep) }
            }
            "Path": {
                from_string: { |s| $s | split row (char esep) | path expand -n }
                to_string: { |v| $v | path expand -n | str join (char esep) }
            }
        }
        # Directories to search for scripts when calling source or use
        NU_LIB_DIRS: [
            ($nu.config-path | path dirname | path join 'modules')
        ]
        # Directories to search for plugin binaries when calling register
        NU_PLUGIN_DIRS: [
            ($nu.config-path | path dirname | path join 'plugins')
        ]
        config: {
            show_banner: false
            table: { 
                trim: {
                    methodology: truncating 
                } 
            }
            history: {
                file_format: "sqlite"
            }
            completions: { 
                algorithm: "fuzzy"
            }
            filesize: { 
                metric: true
            }
        }
    }
}

