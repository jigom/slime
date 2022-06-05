import AVKit

class SoundManager {
  static let shared = SoundManager()
  
  var player: AVAudioPlayer?
  
  func playBlob() {
    guard let url = Bundle.module.url(forResource: "Blob", withExtension: ".mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.soloAmbient)
      player = try AVAudioPlayer(contentsOf: url)
      player?.play()
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
