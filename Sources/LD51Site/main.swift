import ArgumentParser


let httpPort: Int32 = 8080

struct LD51SiteCLI: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "LD51 Site",
        subcommands: [Http.self],
        defaultSubcommand: Http.self)

    struct Http: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Http server")

        @Argument(help: "IP address to listen on")
        var address: String = "0.0.0.0"

        mutating func run() throws {
            LD51Site.http(address, httpPort)
        }
    }
}

LD51SiteCLI.main()
