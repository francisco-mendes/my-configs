let-env ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) }
        to_string: { |v| $v | str collect (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) }
        to_string: { |v| $v | str collect (char esep) }
    }
}

let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]
