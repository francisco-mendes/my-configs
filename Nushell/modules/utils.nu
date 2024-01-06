# Insert a new value in a singleton list or append the value to the previous one
export def append-to (
    path: cell-path     # the name of the column to update or insert
    expr: any           # the new value to append to the cell(s)
) {
    $in | upsert $path ($in | get -i $path | append $expr)
}

# Merges an environment update from a record.
export def --env merge-env (
    path: cell-path     # the name of the environment variable to merge to
    update: record      # the record to use for updates
    --sensitive(-s)     # whether the environment variable is case sensitive
) {
    {} | upsert $path ($env | get -i --sensitive=($sensitive) $path | default {} | merge $update) | load-env
}

# Appends a value to an environment variable.
export def --env append-env (
    path: cell-path     # the name of the environment variable to merge to
    update: any         # the value to append 
    --sensitive(-s)     # whether the environment variable is case sensitive
) {
    {} | upsert $path ($env | get -i --sensitive=($sensitive) $path | append $update) | load-env
}


# Run the closure with the given tag. Only one invocation per tag will be executed.
export def --env do-once (
    tag: cell-path      # unique tag for the closure
    command: any        # the code to run
) {
    if ($env.__once__guards__tags? | get -i $tag) == null {
        $env.__once__guards__tags = ($env.__once__guards__tags? | default {} | insert $tag true)
        do $command
    }
}

export def --env do-external (
    command: string       
    args: string
) {
    run-external --redirect-stdout --redirect-stderr --trim-end-newline $command ($args | split row -r '\s+')
}