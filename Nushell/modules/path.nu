export-env {
    do-once init-path {
        use local/path-env.nu

        if $env.Path? == null {
            $env.Path = $env.PATH
        }
        if $env.PATH? == null {
            $env.PATH = $env.Path
        }

        merge-env config.hooks.env_change {
            Path: {
                condition: {|_, _| $env.PATH != $env.Path }
                code: {|_, _| $env.PATH = $env.Path }
            }
            PATH: {
                condition: {|_, _| $env.PATH != $env.Path }
                code: {|_, _| $env.Path = $env.PATH }
            }
        }
    }
}