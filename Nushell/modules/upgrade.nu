# Updates as much software as possible that is installed through the usual package managers

export def main () {
    if not (which winget | is-empty) {
        winget upgrade --all
    }
    if not (which brew | is-empty) {
        brew update
        brew upgrade
    }
    if not (which rustup | is-empty) {
        rustup update
    }
    if not (which cargo | is-empty) {
        cargo install-update --all
    }
}