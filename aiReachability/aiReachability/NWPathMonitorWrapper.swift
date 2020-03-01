//
//  NWPathMonitorWrapper.swift
//  aiReachability
//
//  Created by Jose Miguel Figueiredo on 27/02/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Network

internal class NWPathMonitorWrapper {
    private let monitor = NWPathMonitor()

    internal func start(queue: DispatchQueue, completion: @escaping (NWPath) -> Void) {
        monitor.pathUpdateHandler = completion
        monitor.start(queue: queue)
    }
}
