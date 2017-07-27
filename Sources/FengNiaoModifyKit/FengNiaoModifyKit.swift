import Foundation
import PathKit


public struct FileInfo {
    let path: String
}


public struct FengNiaoModify {
    
    let projectPath: Path
    let excludedPaths: [Path]
    let resourceExtensions: [String]
    let searchInFileExtensions: [String]
    
    public init(projectPath: String, excludePaths: [String], resourceExtensions: [String], searchInFileExtensions: [String]) {
        let path = Path(projectPath).absolute();
        self.projectPath = path
        self.excludedPaths = excludePaths.map{ path + Path($0) }
        self.resourceExtensions = resourceExtensions
        self.searchInFileExtensions = searchInFileExtensions
    }
    
    public func unusedResource() -> [FileInfo] {
        fatalError()
    }
    
    public func delete() -> () {
        
    }
    
    func stringInUser() -> [String] {
        return []
    }
    
    func resourceInUser() -> [String: String] {
        fatalError()
    }
    
    
}
