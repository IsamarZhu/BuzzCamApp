//
//  VideoPlayerView.swift
//  BuzzCam App
//
//  Created by Responsive Environments on 4/5/24.
//

import SwiftUI
import AVKit

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private let opacityGradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAudioSession()
        
        if let fileURL = Bundle.main.url(forResource: "patagonia_vid_1", withExtension: "mp4") {
            let player = AVPlayer(url: fileURL)
            player.actionAtItemEnd = .none
            player.play()
            
            playerLayer.player = player
            playerLayer.videoGravity = .resizeAspectFill
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: player.currentItem)

            layer.addSublayer(playerLayer)
            
            addOpacityGradient()
        }
        else {
            print("video not found")
        }
        
    }
    
    private func configureAudioSession() {
        do {
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(.ambient, options: [.mixWithOthers])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
        }
    }
    
    private func addOpacityGradient() {
            opacityGradientLayer.colors = [
                UIColor.clear.cgColor,           // Fully transparent
                UIColor(red: 54/255, green: 58/255, blue: 1/255, alpha: 1).cgColor // 70% opacity
            ]
        opacityGradientLayer.startPoint = CGPoint(x: 0.5, y: 0.9) // Top-center
            opacityGradientLayer.endPoint = CGPoint(x: 0.5, y: 1)   // Bottom-center
            opacityGradientLayer.frame = bounds
            opacityGradientLayer.zPosition = 1 // Above the video layer
            layer.addSublayer(opacityGradientLayer)
        }
        
    
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
        opacityGradientLayer.frame = bounds
    }
}
