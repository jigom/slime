import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  @Binding public var lottieView: AnimationView
  
  internal func makeUIView(context: Context) -> UIView {
    let view = UIView()
    
    view.backgroundColor = .clear
    addLottieView(to: view)

    return view
  }
  
  internal func updateUIView(_ uiView: UIView, context: Context) { }
  
  private func addLottieView(to rootView: UIView){
    lottieView.currentProgress = 1
    lottieView.backgroundColor = .clear
    lottieView.translatesAutoresizingMaskIntoConstraints = false
    
    let constraints = [
      lottieView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
      lottieView.heightAnchor.constraint(equalTo: rootView.heightAnchor),
    ]
    
    rootView.addSubview(lottieView)
    rootView.addConstraints(constraints)
  }
}
