//
//  NetworkExtensions.swift
//  aiReachability
//
//  Created by Jose Miguel Figueiredo on 27/02/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Network

public protocol PathProtocol {
    var status: NWPath.Status { get }
    var isExpensive: Bool { get }
}

extension NWPath: PathProtocol {}

public protocol PathMonitorProtocol {
    var updateHandler: ((PathProtocol) -> Void)? { get set }
    func start(queue: DispatchQueue)
    func cancel()
}

extension NWPathMonitor: PathMonitorProtocol {
    public var updateHandler: ((PathProtocol) -> Void)? {
        get {
            let handler = pathUpdateHandler as? ((PathProtocol) -> Void)
            assert(handler != nil, "Casting is not expected to fail.")
            return handler
        }
        set { pathUpdateHandler = newValue }
    }
}
