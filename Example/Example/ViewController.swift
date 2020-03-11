//
//  ViewController.swift
//  Example
//
//  Created by Jose Miguel Figueiredo on 01/03/2020.
//  Copyright © 2020 Jose Miguel Figueiredo. All rights reserved.
//

import UIKit
import aiReachability

class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var wifiStateLabel: UILabel!
    @IBOutlet weak var cellularStateLabel: UILabel!

    // MARK: - Private Property

    private let networkMonitor = NetworkMonitor()

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        networkMonitor.networkUpdateHandler = { status in
            self.wifiStateLabel.text = status.contains(.wifi) ? "Connected" : "Disconnected"
            self.cellularStateLabel.text = status.contains(.cellular) ? "Connected" : "Disconnected" 
        }
        
        setUpLabels()
    }

    // MARK: - Private Methods

    private func setUpLabels() {
        wifiStateLabel.text = networkMonitor.wifiState.toString()
        cellularStateLabel.text = networkMonitor.cellularState.toString()
    }

    // MARK: - IBActions

    @IBAction private func updateTapped(_ sender: Any) {
        setUpLabels()
    }
}

extension NetworkState {
    func toString() -> String {
        switch self {
        case .unknown:
            return "Unknown"
        case .connected:
            return "Connected"
        case .disconnected:
            return "Disconnected"
        }
    }
}
