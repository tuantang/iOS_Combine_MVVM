//
//  Scheduler.swift
//  Services
//
//  Created by Tuan Tang on 09/11/2022.
//

import Combine

public class Scheduler {
    public static var backgroundWorkScheduler: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 5
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    public static let mainScheduler = RunLoop.main
}
