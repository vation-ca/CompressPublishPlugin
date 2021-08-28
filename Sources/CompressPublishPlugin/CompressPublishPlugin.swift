//
//  Compress+Step.swift
//
//
//  Created by Stephen Hume on 2021-04-12.
//

import Foundation
import Publish
import ShellOut

extension Plugin {
  static var compressFiles: Self {
	Plugin(name: "Precompress Output files for server") { context in
	  do {
		let basefolder = try (context.folder(at: "Sources").parent?.path)!
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.html", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.xml", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.txt", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.pdf", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.ico", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.css", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
		try shellOut(
		  to: "find",
		  arguments: [
			basefolder + "Output/", "-type", "f", "-name", "*.svg", "-exec", "gzip", "-kf", "{}",
			"\\;",
		  ], at: basefolder)
	  } catch {
		let error = error as! ShellOutError
		print(error.message)  // Prints STDERR
		print(error.output)  // Prints STDOUT
	  }
	}
  }
}
