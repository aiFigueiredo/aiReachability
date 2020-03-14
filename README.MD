# aiReachability
## Yet another Reachability implementation

aiReachability is an iOS micro framework for gathering network state for cellular and wi-fi connections.
This framework is a wrapper around the [`NWPathMonitor`](https://developer.apple.com/documentation/network/nwpathmonitor) class from Apple's [`Network`](https://developer.apple.com/documentation/network) library and aims to be a simple example on how to gather network state, using native APIs.


[![Platform](https://img.shields.io/cocoapods/p/aiReachability.svg?style=flat)](http://cocoapods.org/pods/aiReachability)
[![Swift](https://img.shields.io/badge/swift-5.1-orange.svg)](https://cocoapods.org/pods/aiReachability)
[![CocoaPods](https://img.shields.io/cocoapods/v/aiReachability.svg)](https://cocoapods.org/pods/aiReachability)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![SPM](https://img.shields.io/badge/swift%20package%20manager-compatible-green.svg)](https://github.com/aiFigueiredo/aiReachability/)
[![apm](https://img.shields.io/apm/l/vim-mode.svg)](https://github.com/aiFigueiredo/aiReachability/blob/master/LICENSE)


## Requirements

* Swift 5.1
* Xcode 11
* iOS 12


## Features
* Gather both wifi and cellular network state synchronosly
* Unit Tests


## Installation

### - [CocoaPods](https://cocoapods.org)

Just add the following line to your `PodFile`:

```ruby
pod 'aiReachability'
```
And then run the following command on the terminal:

```bash
pod install
```

### - [Carthage](https://github.com/Carthage/Carthage)

Just add the entry to your `Cartfile`:

```
github "aiFigueiredo/aiReachability"
```

And then run the following command on the terminal:

```bash
carthage update
```

### - [Swift Package Manager](https://swift.org/package-manager/)

Add the package to your `Package.swift` file, under dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/aiFigueiredo/aiReachability.git", from: "1.0.0")
]
```


## Usage

```swift
import aiReachability

// Instantiate NetworkMonitor Object
let networkMonitor = NetworkMonitor()

// Check wifi network state
print(networkMonitor.wifiState)

// Check cellular network state
print(networkMonitor.cellularState)
```


## Contributing

Feel free to contribute to this project by opening [issues](https://github.com/aiFigueiredo/aiReachability/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) or opening [pull requests](https://github.com/aiFigueiredo/aiReachability/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc).


## License

aiReachability's available under the MIT license. See the [LICENSE](https://github.com/aiFigueiredo/aiReachability/blob/master/LICENSE) file for more information.
