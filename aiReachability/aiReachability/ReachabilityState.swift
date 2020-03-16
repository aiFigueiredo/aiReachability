//
//  ReachabilityState.swift
//  aiReachability
//
//  Created by Duarte Costa on 02/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Foundation
import Network

/// Type that represents the current available network interfaces
public struct ReachabilityState: OptionSet {
    public let rawValue: Int

    /// Main initializer for `ReachabilityState` struct
    /// - Parameter rawValue: The raw value of the reachability state
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Initializer for `ReachabilityState` struct
    /// - Parameter path: The object with network properties to be evaluated
    public init(path: PathProtocol) {
        var reachabilityState = ReachabilityState()

        if path.isExpensive { reachabilityState.insert(.cellular) }
        if path.status == .satisfied { reachabilityState.insert(.wifi) }

        guard !reachabilityState.isEmpty else {
            self = .unreachable
            return
        }

        self = reachabilityState
    }

    public static let wifi = ReachabilityState(rawValue: 1 << 0)
    public static let cellular = ReachabilityState(rawValue: 1 << 1)
    public static let unreachable = ReachabilityState(rawValue: 1 << 2)
}
