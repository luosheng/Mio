//
//  ProjectCoordinator.swift
//  Mio
//
//  Created by Luo Sheng on 2022/9/12.
//

import Foundation
import SwiftTerm
import XTerm

protocol ProjectCoordinatorDelegate {
  func didUpdateRunningState(_ running: Bool)
  func didReceivedDataString(_ data: String)
}

class ProjectCoordinator: LocalProcessDelegate, XTermViewDelegate {
  
  var process: LocalProcess!
  unowned var view: XTermView! {
    didSet {
      view.delegate = self
    }
  }
  var delegate: ProjectCoordinatorDelegate?
  
  init() {
    setup()
  }
  
  private func setup() {
    self.process = LocalProcess(delegate: self)
  }
  
  private func getWinSize() -> winsize {
    let frame: CGRect = view.frame
    let terminalSize = view.size
    return winsize(ws_row: UInt16(terminalSize.rows), ws_col: UInt16(terminalSize.cols), ws_xpixel: UInt16(frame.width), ws_ypixel: UInt16(frame.height))
  }
  
  public func startProcess(executable: String = "/bin/bash", args: [String] = [], environment: [String] = [], execName: String? = nil) {
    guard !self.process.running else {
      return
    }
    process.startProcess(
      executable: executable,
      args: args,
      environment: Terminal.getEnvironmentVariables() + environment,
      execName: execName
    )
    delegate?.didUpdateRunningState(true)
  }
  
  public func terminate() {
    guard self.process.running else {
      return
    }
    process.terminate()
  }
  
  // MARK: - LocalProcessDelegate
  
  func processTerminated(_ source: SwiftTerm.LocalProcess, exitCode: Int32?) {
    delegate?.didUpdateRunningState(false)
  }
  
  func dataReceived(slice: ArraySlice<UInt8>) {
    guard let string = String(bytes: slice, encoding: .utf8) else {
      return
    }
    Task {
      await view.write(string)
    }
    delegate?.didReceivedDataString(string)
  }
  
  func getWindowSize() -> winsize {
    return winsize()
  }
  
  // MARK: - XTermViewDelegate
  
  func onData(_ data: String) {
    process.send(data: ArraySlice(data.utf8))
  }
  
  func didUpdateSize(_ size: XTerm.TermSize) {
    guard process.running else {
      return
    }
    var size = getWinSize()
    let _ = PseudoTerminalHelpers.setWinSize(masterPtyDescriptor: process.childfd, windowSize: &size)
  }
  
}
