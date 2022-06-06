import AVKit

class SoundManager {
  static public let shared = SoundManager()
  
  private var player: AVAudioPlayer?
  
  public func playBlob() {
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
