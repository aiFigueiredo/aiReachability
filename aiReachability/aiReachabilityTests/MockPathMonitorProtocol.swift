//
//  MockPathMonitorProtocol.swift
//  aiReachabilityTests
//
//  Created by Jose Miguel Figueiredo on 14/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

@testable import aiReachability

class MockPathMonitorProtocol: PathMonitorProtocol {
    var queuePassed: DispatchQueue?
    var startCalledCount = 0
    var cancelCalledCount = 0

    // MARK: - Stubs

    var updateHandler: ((PathProtocol) -> Void)?

    func start(queue: DispatchQueue) {
        startCalledCount += 1
        queuePassed = queue
    }

    func cancel() {
        cancelCalledCount += 1
    }
}
