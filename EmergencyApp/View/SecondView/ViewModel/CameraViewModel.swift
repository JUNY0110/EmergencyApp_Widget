//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/01.
//

import SwiftUI
import AVFoundation
import Combine

class CameraViewModel: ObservableObject {
    private let model: Camera
    private let session: AVCaptureSession
    
    private var isCameraBusy = false
    
    let cameraPreview: AnyView
    let hapticImpact = UIImpactFeedbackGenerator()
    
    var currentZoomFactor: CGFloat = 1.0
    var lastScale: CGFloat = 1.0

    private var subscriptions = Set<AnyCancellable>()
    
    @Published var shutterEffect = false
    @Published var recentImage: UIImage?
    @Published var isFlashOn = false
    @Published var isSilentModeOn = false

    func configure() {
        model.requestAndCheckPermissions()
    }

    func switchFlash() {
        isFlashOn.toggle()
    }

    func switchSilent() {
        isSilentModeOn.toggle()
    }

    func capturePhoto() {
        if isCameraBusy == false {
            model.capturePhoto()
            print("[CameraViewModel]: Photo captured!")
            hapticImpact.impactOccurred()
            withAnimation(.easeInOut(duration: 0.1)) {
                shutterEffect = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.easeInOut(duration: 0.1)) {
                    self.shutterEffect = false
                }
            }
        } else {
            print("[CameraViewModel]: Camera's busy.")
        }
    }

    func changeCamera() {
        print("[CameraViewModel]: Camera changed!")
    }
    
    func zoom(factor: CGFloat) {
        let delta = factor / lastScale
        lastScale = factor
        
        let newScale = min(max(currentZoomFactor * delta, 1), 5)
        model.zoom(newScale)
        currentZoomFactor = newScale
    }
    
    func zoomInitialize() {
        lastScale = 1.0
    }
    
    init() {
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
        model.$recentImage.sink { [weak self] (photo) in
            guard let pic = photo else { return }
            self?.recentImage = pic
        }
        .store(in: &self.subscriptions)
    }
}
