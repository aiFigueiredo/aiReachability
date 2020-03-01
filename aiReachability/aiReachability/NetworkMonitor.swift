//
//  NetworkMonitor.swift
//  aiReachability
//
//  Created by Jose Miguel Figueiredo on 27/02/2020.
//  Copyright © 2019 Jose Figueiredo. All rights reserved.
//

import Network

/// Class responsible for gathering and storing network state information
/// Uses a `NWPathMonitor` Wrapper to monitorize the network once this object is initialized
public class NetworkMonitor {
    private let monitor = NWPathMonitorWrapper()

    /// Property that stores the last state change recorded
    public var wifiState: NetworkState = .unknown

    /// Property that indicates the last cellular connection state change
    public var cellularState: NetworkState = .unknown

    /// Main initializer for `NetworkMonitor` class
    /// Triggers monitor to start
    public init() {
        start()
    }

    // MARK: - Private Methods

    private func start() {
        let updateCompletion: (NWPath) -> Void = { [weak self] path in
            self?.handleUpdate(path: path)
        }

        let queue = DispatchQueue(label: "Network Monitor")
        monitor.start(queue: queue, completion: updateCompletion)
    }

    private func handleUpdate(path: NWPath) {
        wifiState = path.status == .satisfied ? .connected : .disconnected
        cellularState = path.isExpensive ? .connected : .disconnected
    }
}
