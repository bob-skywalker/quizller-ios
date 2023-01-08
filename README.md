# Quizzller

[Quizzller](https://apps.apple.com/us/app/quizzller/id1661875403) is an internet based quiz app similar to Quizlet, the popular education app that has more than 50 million downloads Worldwide. 
**Key Features:**

* Engage user to make logical choices in a multiple choice fashion

* Learn varies topics ranging from geography to biology to history and much more...

* Instant feedback & sound effect when user makes a right choice / or a wrong choice

* Shuffle logic built-in, so user will get different set of questions each time they play 

## Technologies, Libraries, APIs

**Libraries:**

* Google Question Bank randomly selected 70 questions

**Front-end:**

* Swift
* UIKit
* Swift Struct
* Computed Properties
* StoryBoard

**Module Bundler** 

* Cocoapod
* UIKit 
* AVAudioPlayer 


# Aplication Preview

## Quizzller Layout

![Quizzller Layout](https://i.postimg.cc/GtGFyzLs/460x0w.webp)


## Code Snippet

**Swift dynamic button with sound feedback** 
```swift
  @IBAction func bmgButtonPressed(_ sender: UIButton) {
        if let player = player, player.isPlaying{
            bgmButton.setTitle("play sound", for: .normal)
            bgmButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            player.stop()
            
        } else {
            bgmButton.setTitle("stop sound", for: .normal)
            bgmButton.setImage(UIImage(systemName: "stop.circle"), for: .normal)
            let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else{
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                player.play()
            }
            catch{
                print("something went wrong")
            }
        }
    }
```
