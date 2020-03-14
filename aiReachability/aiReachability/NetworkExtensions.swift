//
//  NetworkExtensions.swift
//  aiReachability
//
//  Created by Jose Miguel Figueiredo on 27/02/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Network

@available(iOS 12.0, *)
public protocol PathProtocol {
    var status: NWPath.Status { get }
    var isExpensive: Bool { get }
}

@available(iOS 12.0, *)
extension NWPath: PathProtocol {}

@available(iOS 12.0, *)
public protocol PathMonitorProtocol {
    var updateHandler: ((PathProtocol) -> Void)? { get set }
    func start(queue: DispatchQueue)
    func cancel()
}

@available(iOS 12.0, *)
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
