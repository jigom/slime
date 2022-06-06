import SwiftUI
import Lottie

public struct SlimeButton: View {
  public enum BlobSpeed {
    case slow
    case normal
    case fast
  }
  
  @State private var pressBlob = false
  @State private var blobView = AnimationView(name: "Blob", bundle: .module)
  
  @State public var title = ""
  @State public var scale: CGFloat = 1.0
  @State public var blobColor = Color.yellow
  @State public var titleColor = Color.red
  @State public var speed = BlobSpeed.normal
  @State public var loop = false
  
  public let action: (() -> Void)?
  
  public var body: some View {
    liquidBlob(title: title, blobColor: blobColor, titleColor: titleColor) {
      SoundManager.shared.playBlob()
      
      blobView.play(fromProgress: pressBlob ? 0 : 0.5, toProgress: pressBlob ? 0.5 : 1)
      
      pressBlob.toggle()
      
      if let action = self.action {
        action()
      }
    }
    .scaleEffect(x: scale, y: scale)
  }
  
  @ViewBuilder
  private func liquidBlob(title: String, blobColor: SwiftUI.Color, titleColor: SwiftUI.Color, action: @escaping () -> ()) -> some View {
    if #available(iOS 15.0, *) {
      Text(title)
        .font(.title)
        .bold()
        .foregroundColor(titleColor)
        .frame(width: 300, height: 300)
        .background(blobColor)
        .onTapGesture {
          action()
        }
        .onAppear {
          switch speed {
          case .slow:
            blobView.animationSpeed = 1
          case .normal:
            blobView.animationSpeed = 3
          case .fast:
            blobView.animationSpeed = 5
          }
          
          if loop {
            blobView.play()
            blobView.loopMode = .autoReverse
          }
        }
        .mask {
          LottieView(lottieView: $blobView)
            .scaleEffect(x: 0.29, y: 0.27, anchor: .topLeading)
        }
    } else {
      Text(title)
        .font(.title)
        .bold()
        .foregroundColor(titleColor)
        .frame(width: 300, height: 300)
        .background(blobColor)
        .onTapGesture {
          action()
        }
        .mask(
          LottieView(lottieView: $blobView)
            .scaleEffect(x: 0.29, y: 0.27, anchor: .topLeading)
        )
    }
  }
}

struct SlimeButton_Previews: PreviewProvider {
  static var previews: some View {
    SlimeButton(title: "Slime", scale: 1.5, blobColor: .red, titleColor: .yellow, speed: .slow, loop: true) {
      print("Fluctuating")
    }
  }
}
