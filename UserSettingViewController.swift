//
//  MusicViewController.swift
//  SIT206_Assignment2
//
//  Created by 王子璇 on 2018/5/19.
//  Copyright © 2018年 wangzixuan. All rights reserved

import UIKit

class UserSettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var singerimg: UIImageView!
    @IBOutlet weak var nowplayinglabel: UILabel!
    @IBOutlet weak var songprogress: UIProgressView!
    @IBOutlet weak var elapsedtimelabel: UILabel!
    @IBOutlet weak var remainingtimelabel: UILabel!
    @IBOutlet weak var volumslider: UISlider!
    var filterbysinger = "All"
    var musicplayer : MusicPlayer = MusicPlayer (PlayList())
    var timer : Timer!
    var playorresume : Bool = false
    var isplaying : Bool = false
    
    @IBAction func play(_ sender: UIButton) {
        if playorresume == true {
            musicplayer.resume()
        }
        else {
            musicplayer.play(filterBy: filterbysinger)
        }
        updateUI()
        timer = Timer.scheduledTimer(timeInterval: 1,target : self, selector : #selector(self.updaterealtimeUI),
                                     userInfo: nil, repeats: true)
    }
   
    @IBAction func previous(_ sender: UIButton) {
        musicplayer.previous(filterBy: filterbysinger)
        updateUI()
    }
    @IBAction func stop(_ sender: UIButton) {
        musicplayer.stop()
        playorresume = false
        updateUI()
    }
    @IBAction func next(_ sender: UIButton) {
        musicplayer.next(filterBy: filterbysinger)
        updateUI()
    }
    @IBAction func changevolume(_ sender: UISlider) {
        musicplayer.changeVolume(newValue: sender.value)
    }
    
    @objc func updaterealtimeUI(){
        let currentsong = musicplayer.getCurrentSong()
        let progress = Float (currentsong.timeElapsed / currentsong.duration)
        songprogress.setProgress(progress, animated: true)
        let elapsedtime = Int(currentsong.timeElapsed.nextUp)
        let remainingtime = Int(currentsong.duration.nextUp) - elapsedtime
        elapsedtimelabel.text = "\(elapsedtime)"
        remainingtimelabel.text = "\(remainingtime)"
    }
    func updateUI(){
        let currentsong = musicplayer.currentSong
        singerimg.image = UIImage(named : currentsong.singer)
        nowplayinglabel.text = currentsong.title
    }
    
    
}








