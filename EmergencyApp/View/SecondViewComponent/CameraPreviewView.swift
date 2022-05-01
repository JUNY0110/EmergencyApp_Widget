//
//  CameraPreviewView.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/04/29.
//
import SwiftUI
import AVFoundation

struct CameraPreviewView: UIViewRepresentable {

    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }

    let session: AVCaptureSession

    func makeUIView(context: Context) -> VideoPreviewView {
            let view = VideoPreviewView()

            view.backgroundColor = .black
            view.videoPreviewLayer.videoGravity = .resizeAspectFill
            view.videoPreviewLayer.cornerRadius = 0
            view.videoPreviewLayer.session = session
            view.videoPreviewLayer.connection?.videoOrientation = .portrait

            return view
        }
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
    }
}
