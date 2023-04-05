//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Aleksei Voronovskii on 4/2/23.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {
    var objectWillChange = PassthroughSubject<TimeCounter, Never>()
    var counter = 3
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateCounter),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
