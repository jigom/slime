import SwiftUI
import Lottie

public struct SlimeButton: View {
  @State var pressBlob = false
  @State var blobView = AnimationView(name: "Blob", bundle: .module)
  
  let title: String
  let color: SwiftUI.Color
  let action: () -> Void
  
  public init(title: String, color: SwiftUI.Color, action: @escaping () -> Void) {
    self.title = title
    self.color = color
    self.action = action
  }
  
  public var body: some View {
    liquidBlob(title: title, color: color) {
      SoundManager.shared.playBlob()
      
      blobView.animationSpeed = 5
      blobView.play(fromProgress: pressBlob ? 0 : 0.1, toProgress: pressBlob ? 0.1 : 0)
      
      pressBlob.toggle()
      self.action()
    }
  }
  
  @ViewBuilder
  func liquidBlob(title: String, color: SwiftUI.Color, action: @escaping () -> ()) -> some View {
    if #available(iOS 15.0, *) {
      Text(title)
        .font(.system(size: 20))
        .bold()
        .frame(width: 160, height: 110)
        .background(color)
        .onTapGesture {
          action()
        }
        .mask {
          LottieView(lottieView: $blobView)
            .scaleEffect(x: 0.15, y: 0.1, anchor: .topLeading)
        }
    } else {
      Text(title)
        .font(.system(size: 20))
        .bold()
        .foregroundColor(Color(.label))
        .frame(width: 160, height: 110)
        .background(color)
        .onTapGesture {
          action()
        }
        .mask(
          LottieView(lottieView: $blobView)
            .scaleEffect(x: 0.15, y: 0.1, anchor: .topLeading)
        )
    }
  }
}

struct SlimeButton_Previews: PreviewProvider {
  static var previews: some View {
    SlimeButton(title: "슬라임", color: .blue) {
      print("꿀렁꿀렁")
    }
  }
}
