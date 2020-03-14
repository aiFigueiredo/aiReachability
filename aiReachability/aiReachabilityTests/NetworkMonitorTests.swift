//
//  NetworkMonitorTests.swift
//  aiReachabilityTests
//
//  Created by Jose Miguel Figueiredo on 02/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import XCTest
import Network
@testable import aiReachability

class NetworkMonitorTests: XCTestCase {
    var sut: NetworkMonitor!
    var mockMonitor: MockPathMonitorProtocol!

    override func setUp() {
        mockMonitor = MockPathMonitorProtocol()
    }

    override func tearDown() {
        mockMonitor = nil
        sut = nil
    }

    func testInitialConditions() {
        sut = NetworkMonitor()
        XCTAssertEqual(sut.wifiState, .unknown)
        XCTAssertEqual(sut.cellularState, .unknown)
    }

    func testStart() {
        sut = NetworkMonitor(monitor: mockMonitor)

        XCTAssertEqual(mockMonitor.startCalledCount, 1)
        XCTAssertEqual(mockMonitor.queuePassed?.label, "Network Monitor")
    }

    private func validateUpdateHandler(status: NWPath.Status,
                                       isExpensive: Bool,
                                       file: StaticString = #file,
                                       line: UInt = #line) {
        sut = NetworkMonitor(monitor: mockMonitor)

        guard let updateHandler = mockMonitor.updateHandler else {
            XCTFail("updateHandler must not be nil", file: file, line: line)
            return
        }

        let mockPath = MockPathProtocol(status: status, isExpensive: isExpensive)
        updateHandler(mockPath)

        let expectedWifiState: NetworkState = mockPath.status == .satisfied ? .connected : .disconnected
        let expectedCellularState: NetworkState = mockPath.isExpensive ? .connected : .disconnected
        XCTAssertEqual(sut.wifiState, expectedWifiState, file: file, line: line)
        XCTAssertEqual(sut.cellularState, expectedCellularState, file: file, line: line)
    }

    func testUpdateHandler_satisfiedAndIsExpensiveTrue_wifiConnectedCellularConnected() {
        validateUpdateHandler(status: .satisfied, isExpensive: true)
    }

    func testUpdateHandler_satisfiedAndIsExpensiveFalse_wifiConnectedCellularDisconnected() {
        validateUpdateHandler(status: .satisfied, isExpensive: false)
    }

    func testUpdateHandler_requiresConnectionAndIsExpensiveTrue_wifiDisconnectedCellularConnected() {
        validateUpdateHandler(status: .requiresConnection, isExpensive: true)
    }

    func testUpdateHandler_requiresConnectionAndIsExpensiveTrue_wifiDisconnectedCellularDisconnected() {
        validateUpdateHandler(status: .requiresConnection, isExpensive: false)
    }

    func testUpdateHandler_unsatisfiedAndIsExpensiveTrue_wifiDisconnectedCellularConnected() {
        validateUpdateHandler(status: .unsatisfied, isExpensive: true)
    }

    func testUpdateHandler_unsatisfiedAndIsExpensiveTrue_wifiDisconnectedCellularDisconnected() {
        validateUpdateHandler(status: .unsatisfied, isExpensive: false)
    }
}
