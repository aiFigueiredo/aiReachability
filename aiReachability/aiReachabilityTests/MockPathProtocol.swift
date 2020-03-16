//
//  MockPathProtocol.swift
//  aiReachabilityTests
//
//  Created by Jose Miguel Figueiredo on 14/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import Network
@testable import aiReachability

struct MockPathProtocol: PathProtocol {
    var status: NWPath.Status
    var isExpensive: Bool
}
