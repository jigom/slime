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
    LiquidCard(title: title, color: color) {
      SoundManager.shared.playBlob()
      
      self.action()
      
      DispatchQueue.main.asyncAfter(deadline: .now()) {
        blobView.animationSpeed = 5
        blobView.play(fromProgress: pressBlob ? 0 : 0.2, toProgress: pressBlob ? 0.2 : 0){ status in
          pressBlob.toggle()
        }
      }
    }
    .padding()
  }
  
  @ViewBuilder
  func LiquidCard(title: String, color: SwiftUI.Color, onExpand: @escaping () -> ()) -> some View {
    ZStack {
      if #available(iOS 15.0, *) {
        Text(title)
          .font(.system(size: 20))
          .bold()
          .frame(width: UIScreen.main.bounds.height * 0.1 + 75, height: UIScreen.main.bounds.height * 0.1 + 25)
          .background(color)
          .onTapGesture {
            onExpand()
          }
          .mask {
            GeometryReader { proxy in
              let scaleWidth = proxy.size.width / 1000
              let scaleHeight = proxy.size.height / 1200
              
              LottieView(lottieView: $blobView)
                .scaleEffect(x: scaleWidth, y: scaleHeight, anchor: .topLeading)
            }
          }
      } else {
        Text(title)
          .font(.system(size: 20))
          .bold()
          .foregroundColor(Color(.label))
          .frame(width: UIScreen.main.bounds.height * 0.1 + 100, height: UIScreen.main.bounds.height * 0.1 + 50)
          .background(color)
          .onTapGesture {
            onExpand()
          }
          .mask(
            GeometryReader { proxy in
              let scaleWidth = proxy.size.width / 1000
              let scaleHeight = proxy.size.height / 1100
              
              LottieView(lottieView: $blobView)
                .scaleEffect(x: scaleWidth, y: scaleHeight, anchor: .topLeading)
            }
          )
      }
    }
  }
}
