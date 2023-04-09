module java {
    export-env {
        let-env JAVA_HOME = "/Users/fmendes/homebrew/opt/openjdk"
        let-env PATH = ($env.PATH | prepend $"($env.JAVA_HOME)/bin")
    }
    alias maven = mvn
}