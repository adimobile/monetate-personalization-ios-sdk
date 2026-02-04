//
//  FileActions.swift
//  App
//
//  Created by Tushar Mohod on 29/07/20.
//

import Foundation


public class FileActions {
  
    public func getFilePath() -> URL {
        let fileName = "Temp"
        let documentDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDir.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        return fileURL
    }
    
    public func getPath () -> String {
        let filePath :URL = self.getFilePath()
        return filePath.absoluteString
    }
    
    public func writeToFile(_ writeData:String) {
        let filePath :URL = self.getFilePath()
        do {
            // write to file
           
            Log.debug("\(filePath)")
            var locationsInFile = ""
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path){
                locationsInFile = try String(contentsOf: filePath)
            }
            let data = locationsInFile + "\n" + Date().toString("E dd MM YY HH:mm:ss") + " " + writeData
            try data.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
            //try writeData.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
        } catch let error as NSError {
          
            Log.debug("Fail to write at URL : \(error.localizedDescription)")
        }
    }
    
    func readFromFile() {
        let filePath :URL = self.getFilePath()
        var locationsInFile = ""
        do {
            // Read from file
            try locationsInFile = String(contentsOf: filePath)
        } catch let error as NSError {
            Log.debug("Fail to read at URL : \(error.localizedDescription)")
         
        }
        Log.debug("Content of File : \(locationsInFile)")
    
    }
}
