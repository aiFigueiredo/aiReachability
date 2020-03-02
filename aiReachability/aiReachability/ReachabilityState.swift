//
//  ReachabilityState.swift
//  aiReachability
//
//  Created by Duarte Costa on 02/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Foundation

/// Type that represents the reachability current available states
public struct ReachabilityState: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let wifi           = ReachabilityState(rawValue: 1 << 0)
    public static let cellular       = ReachabilityState(rawValue: 1 << 1)
    public static let unreachable    = ReachabilityState(rawValue: 1 << 2)
}
