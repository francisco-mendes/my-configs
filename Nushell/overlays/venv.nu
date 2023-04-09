module venv {
    export-env {
        let-env VIRTUAL_ENV = ([$env.PWD, "venv/bin"] | path join)
        let-env PATH = ($env.PATH | prepend $env.VIRTUAL_ENV)
    }
}