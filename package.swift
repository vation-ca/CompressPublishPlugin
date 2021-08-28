// swift-tools-version:5.3

/**
*  Compress-plugin for Publish
*  Copyright (c) Vation Inc. 2021
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
	name: "CompressPublishPlugin",
	products: [
		.library(
			name: "CompressPublishPlugin",
			targets: ["CompressPublishPlugin"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/johnsundell/publish.git", from: "0.8.0"),
		.package(name: "ShellOut", url: "https://github.com/johnsundell/shellout.git", from: "2.3.0")
	],
	targets: [
		.target(
			name: "CompressPublishPlugin",
			dependencies: ["Publish","ShellOut"]
		)
	]
)
