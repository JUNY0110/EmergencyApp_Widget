//
//  SwiftUIView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/01.
//

import SwiftUI
import AVFoundation

class CameraViewModel: ObservableObject {
    private let model: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView

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
        print("[CameraViewModel]: Photo captured!")
    }
    
    func changeCamera() {
        print("[CameraViewModel]: Camera changed!")
    }
    
    init() {
        model = Camera()
        session = model.session
        cameraPreview = AnyView(CameraPreviewView(session: session))
    }
}
