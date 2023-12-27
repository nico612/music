//
//  LogManager.swift
//  Music
//
//  Created by apple on 2023/12/26.
//

import CocoaLumberjack

public struct LogManager {
    
    public static let manager = LogManager()
    
    private init(){
        DDLog.add(DDOSLogger.sharedInstance) // 输出到控制台
        
        // 配置文件输出
//        let fileLogger: DDFileLogger = DDFileLogger() // 文件记录器
//        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24) // 日志滚动频率，每天一个文件
//        fileLogger.logFileManager.maximumNumberOfLogFiles = 7 // 最大日志文件数
//        DDLog.add(fileLogger) // 输出到文件
    }
}
