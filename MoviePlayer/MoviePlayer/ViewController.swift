//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 이대규 on 2022/09/28.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 내부 파일 mp4
        // 우선 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아온다.
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        // 앱 내부의 파일명을 NSURL 형식으로 변경한다.
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayerExternalMovie(_ sender: UIButton) {
        // 외부 파일 mp4
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz05w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
        
        }
        
        private func playVideo(url: NSURL){
            let playerController = AVPlayerViewController()
            
            let player = AVPlayer(url: url as URL)
            playerController.player = player
            
            self.present(playerController, animated: true){
                player.play()
        }
    }
}

