//
//  NWPathExtensions.swift
//  aiReachability
//
//  Created by Duarte Costa on 02/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Network

extension NWPath {
    var reachabilityState: ReachabilityState {
        var reachabilityState = ReachabilityState()

        if isExpensive { reachabilityState.insert(.cellular) }
        if status == .satisfied { reachabilityState.insert(.wifi) }

        guard !reachabilityState.isEmpty else {
            return .unreachable
        }

        return reachabilityState
    }
}
