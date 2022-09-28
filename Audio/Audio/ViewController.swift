//
//  ViewController.swift
//  Audio
//
//  Created by 이대규 on 2022/09/14.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate,AVAudioRecorderDelegate {
    
    // AVAudioPlayer 인스턴스 변수
    var audioPlayer : AVAudioPlayer!
    
    // 재생할 오디오의 파일명 변수
    var audioFile : URL!
    
    // 최대볼륨,실수형 상수
    var MAX_VOLUME : Float! = 10.0
    
    // 타이머를 위한 변수
    var progressTimer : Timer!
    
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector: Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    // audioRecorder 인스턴스를 추가한다
    var audioRecorder : AVAudioRecorder!
    // 현재 '녹음 모드' 라는것을 나타낼 isRecordMode를 추가한다. 기본값은 false로하여 처음 앱을 실행했을때
    // 녹음모드가 아닌 재생모드가 나타나도록 한다.
    var isRecordMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       selectAudioFile()
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else {
            initRecord()
        }
        
    }
    
    func selectAudioFile() {
        if !isRecordMode {
            // 재생 모드일 때는 오디오 파일인 "Sicilian_Breeze.mp3"가 선택됨
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {
            // 녹음 모드 일때는 새 파일인 "recordFile.m4a"가 생성 된다.
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initRecord() {
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 32000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord : \(error)")
        }
        
        audioRecorder.delegate = self
        // AudioRecorder의 델리게이트(Delegate)를 self로 설정한다.
        slVolume.value = 1.0
        // 볼륨 슬라이더 값을 1.0으로 설정한다
        audioPlayer.volume = slVolume.value
        // audioPlayer의 볼륨도 슬라이더 값과 동일한 1.0으로 설정한다
        lblEndTime.text = convertNSTimeInterval2String(0)
        // 총 재생 시간을 0으로 바꾼다
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        // [Play],[Pause] 및 [Stop] 버튼을 비활성화 설정한다.
        setPlayButtons(false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord,
                                                            mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategofy : \(error)")
        }
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive : \(error)")
        }
        
        
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError {
            print("Error-initPlay : \(error)")
            
        }
        
        
        
        // 슬라이더의 최대 볼륨을 상수 MAX_VOLUME인 10.0으로 초기화 한다
        slVolume.maximumValue = MAX_VOLUME
        // 슬라이더의 볼륨을 1.0으로 초기화 함
        slVolume.value = 1.0
        // 프로그레스 뷰의 진행을 0으로 초기화
        pvProgressPlay.progress = 0
        
        // audioPlayer의 델리게이트를 self로 한다
        audioPlayer.delegate = self
        // prepareToPlay()를 실행한다
        audioPlayer.prepareToPlay()
        // audioPlayer의 볼륨을 방금 앞에서 초기화한 슬라이더(slVolume)의 볼륨 값 1.0으로 한다
        audioPlayer.volume = slVolume.value
        
        // 오디오 파일의 재생 시간인 audioPlayer.duration값을 convertNSTimeInterval2String 함수를 이용해 lblEndTime의
        // 텍스트에 출력해줌
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        // lblCurrentTime의 텍스트에는 convertNSTimeInterval2String함수를 이용하여 00:00이 출력되도록 0의 값을 입력한다
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    // "00:00" 형태로 바꾸기 위해 TimeInterval 값을 받아ㅏ 문자열로 돌려내는 함수를 생성
    func convertNSTimeInterval2String(_ time:TimeInterval) -> String {
        // 재생 시간의 매개변수인 time 값을 60으로 나눈 몫을 정수 값으로 변환하여 상수 min값에 초기화
        let min  = Int(time/60)
        // time값을 60으로 나눈 나머지를 정수값으로 변환하여 sec에 초기화
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        // 두값을 이용해 "%02d:%02d" 형태의 문자열(String)로 변환하여 상수 strTime에 초기화 한다.
        let strTime = String(format:"%02d:%02d",min,sec)
        return strTime
    }

    @IBAction func btnPlayAudio(_ sender: UIButton) {
        // audioPlayer.play함수를 실행해 오디오를 재생한다.
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updatePlayTime() {
        // 재생시간인 audioPlayer.currentTime을 레이블 lblCurrentTime에 나타낸다
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        // 프로그레스 뷰인 pvProgress Play의 진행 상황에 audioPlayer.currentTime을 audioPlayer.duration으로 나눈 값으로 표시
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
    }
    @IBAction func btnStopAudio(_ sender: Any) {
        audioPlayer.stop()
        // 오디오를 정지하고 다시 재생하면 처음부터 재생해야 하므로 audioPlayer.currentTime을 0으로한다
        audioPlayer.currentTime = 0
        // 재생 시간도 00:00로 초기화하기 위해 convertNSTimeInterval2String(0)을 활용한다.
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: true, stop: false)
        // 타이머도 무효화 한다.
        progressTimer.invalidate()
        
    }
    @IBAction func slhangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // 타이머를 무효화 한다
        progressTimer.invalidate()
        // play버튼은 활성화 되고 나머지 일지정지 정지 버튼은 비활성화
        setPlayButtons(true, pause: false, stop: false)
    }
    
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        // if 문 스위치가 on되었을때는 녹음모드 이므로 오디오 재생을 중지하고 현재 재생시간을 00:00으로 만들고
        // isrecordMode값을 참(true)으로 설정하고,[Recode]버튼과 녹음 시간을 활성화로 설정한다.
        if sender.isOn {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        } else {
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text! = convertNSTimeInterval2String(0)
        }
        selectAudioFile()
        
            if !isRecordMode {
                initPlay()
            } else {
                initRecord()
            }
        
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        // 만약에 버튼 이름이 "Record"이면 녹음을 하고 버튼 이름을 'stop'으로 변경한다.
        if (sender as AnyObject).titleLabel?.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            // 녹음할때 타이머가 작동하도록 progressTimer에 Timer.schduledTimer 함수를 사용하는데,0.1초 간격으로 타이머를 생성한다.
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {
            // 그렇지 않ㅇ면 현재 녹음 중이므로 녹음을 중단하고 버튼 이름을 'Stop'으로 변경한다. 그리고 [Play]버튼을 활성화하고
            // 방금 녹음한 파일로 재생을 초기화 한다.
            audioRecorder.stop()
            // 녹음이 중지되면 타이머를 무효로 한다.
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
    
}

