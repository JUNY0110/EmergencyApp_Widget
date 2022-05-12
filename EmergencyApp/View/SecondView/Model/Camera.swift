//
//  Camera.swift
//  EmergencyApp
//
//  Created by 지준용 on 2022/05/01.
//
import SwiftUI
import AVFoundation

class Camera: NSObject, ObservableObject {
    
    var session = AVCaptureSession()
    var videoDeviceInput: AVCaptureDeviceInput!
    let output = AVCapturePhotoOutput()
    var photoData = Data(count: 0)
    
    var flashMode: AVCaptureDevice.FlashMode = .off

    @Published var recentImage: UIImage?
    
    func setUpCamera() {
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                for: .video, position: .back) {
            do {
                videoDeviceInput = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(videoDeviceInput) {
                    session.addInput(videoDeviceInput)
                }

                if session.canAddOutput(output) {
                    session.addOutput(output)
                    output.isHighResolutionCaptureEnabled = true
                    output.maxPhotoQualityPrioritization = .quality
                }
                session.startRunning()
            } catch {
                print(error)
            }
        }
    }
    
    func requestAndCheckPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] authStatus in
                if authStatus {
                    DispatchQueue.main.async {
                        self?.setUpCamera()
                    }
                }
            }
        case .restricted:
            break
        case .authorized:
            setUpCamera()
        default:
            print("Permession declined")
        }
    }

    func capturePhoto() {

        print("어쩌꼬")

        let photoSettings = AVCapturePhotoSettings()

        self.output.capturePhoto(with: photoSettings, delegate: self)
        print("[Camera]: Photo's taken")
        
    }
    
    func savePhoto(_ imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        print("[Camera]: Photo's saved")
    }
    
    func zoom(_ zoom: CGFloat){
         let factor = zoom < 1 ? 1 : zoom
         let device = self.videoDeviceInput.device
         
         do {
             try device.lockForConfiguration()
             device.videoZoomFactor = factor
             device.unlockForConfiguration()
         }
         catch {
             print(error.localizedDescription)
         }
     }
}

extension Camera: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }

    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {

        guard let imageData = photo.fileDataRepresentation() else { return }

        self.recentImage = UIImage(data: imageData)
        self.savePhoto(imageData)

        print("[CameraModel]: Capture routine's done")
    }
}



