use utils.nu *

export-env {
    merge-env PackageManagers {
        Brew: {|| brew update -q; brew upgrade -q; brew cleanup -q }
        Winget: {|| winget upgrade --all }
        Rustup: {|| rustup update }
        Cargo: {
            condition: {|| 'install-update' in (cargo --list | lines | skip 1 | str replace -r '.*?(\S+).*' '$1') }
            code: {|| cargo install-update --all }
        }
    }
}

def upgrade-inner (name, condition, code) {
    if $condition {
        print $"(ansi gb)Upgrading (ansi gu)($name)(ansi reset)\n"
        do $code
        print ""
    } else {
        print $"(ansi ub)Skipping (ansi uu)($name)(ansi reset)"
    }
}

def upgrade-one (name, mng) {
    try {
        upgrade-inner $name (do $mng.condition) $mng.code
    } catch {
        upgrade-inner $name (not (which $name | is-empty)) $mng
    }
}

# Updates software installed through all known package managers
export def all () {
    $env.PackageManagers
        | sort
        | transpose name mng 
        | each { |it| upgrade-one $it.name $it.mng }
        | ignore
}

# Updates software installed though the given package managers
export def main (
    ...which: string    # which package managers to run updates
) {
    $env.PackageManagers
        | sort
        | select $which 
        | transpose name mng 
        | each { |it| upgrade-one $it.name $it.mng }
        | ignore
}       

