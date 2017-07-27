import Foundation
import CommandLineKit
import Rainbow


let cli = CommandLineKit.CommandLine()

let projectOption = StringOption(
    shortFlag: "p",
    longFlag: "project",
    helpMessage: "Root path of your Xcode project. Default is current folder."
)
let resourceExtensionsOption = MultiStringOption(
    shortFlag: "r",
    longFlag: "resource-extensions",
    helpMessage: "Resource file extensions need to be searched. Default is 'imageset jpg png gif'"
)
let fileExtensionsOption = MultiStringOption(
    shortFlag: "f",
    longFlag: "file-extensions",
    helpMessage: "In which types of files we should search for resource usage. Default is 'm mm swift xib storyboard'"
);
let excludePaths = MultiStringOption(
    shortFlag: "e",
    longFlag: "exclude",
    helpMessage: "Exclude paths from search."
)
let help = BoolOption(
    shortFlag: "h",
    longFlag: "help",
    helpMessage: "Prints a help message."
)

cli.addOptions(projectOption, resourceExtensionsOption, fileExtensionsOption, help)
cli.formatOutput = { s, type in
    var str: String
    switch(type) {
    case .error:
        str = s.red.bold
    case .optionFlag:
        str = s.green.underline
    case .optionHelp:
        str = s.blue
    default:
        str = s
    }
    
    return cli.defaultFormat(s: str, type: type)
}

do {
    try cli.parse()
} catch {
    cli.printUsage(error)
    exit(EX_USAGE)
}

if help.value {
    cli.printUsage()
    exit(EX_OK)
}

let project = projectOption.value ?? "."
let resourceExtensions = resourceExtensionsOption.value ?? ["imageset", "jpg", "png", "gif"]
let fileExtensions = fileExtensionsOption.value ?? [".swift", ".m", ".mm", "xib", "storyboard"]
let excludes = excludePaths.value ?? []











