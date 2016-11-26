//
//  QrViewController.swift
//  
//
//  Created by henghao.jiao on 16/9/28.
//
//

import UIKit
import CoreImage
import AVFoundation
import Alamofire


class QrViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nil, bundle: nil)
        startReadingQR()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let lineView = UIView(frame: CGRectMake(0.2 * screenW, 0.3 * screenH, 0.6 * screenW, 2))
    private var session : AVCaptureSession?
    private var layer : AVCaptureVideoPreviewLayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "扫描二维码"
//        setUpHighDQR()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
 

    func setUpHighDQR(){
        let imageV = UIImageView(frame: CGRectMake(100, 100, 200, 200))
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setDefaults()
        let dataString = "https://itunes.apple.com/cn/app/ipems-app/id973356723?mt=8"
        let data = dataString.dataUsingEncoding(NSUTF8StringEncoding)
        filter?.setValue(data, forKey: "inputMessage")
        let outImage = filter?.outputImage
        let image =  UIImage(CIImage: outImage!).createNonInterpolatedUIImageFormCIImage(outImage, withSize: 200)
        imageV.image = image
        self.view.addSubview(imageV)
        
    }
    
    func popbck(){
    
          navigationController?.popViewControllerAnimated(true)
    }
  
    func startReadingQR(){
     

        // 1.创建捕捉会话
        let sessionTemp = AVCaptureSession()
        sessionTemp.sessionPreset = AVCaptureSessionPresetHigh
        session = sessionTemp
        // 2.添加输入设备(数据从摄像头输入)
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
       
        if device == nil{
         //   MBProgressHUD.showText("设备不存在", view: view)
            performSelector(#selector(self.popbck), withObject: nil, afterDelay: 1000.0)
            return
            
        }
            if let input = try? AVCaptureDeviceInput(device: device){
            
            if sessionTemp.canAddInput(input){
                sessionTemp.addInput(input)
            }
            }
       
      
      
        layer = AVCaptureVideoPreviewLayer(session: sessionTemp)
        layer!.videoGravity = AVLayerVideoGravityResizeAspectFill
        layer!.frame = view.bounds
        let outPut = AVCaptureMetadataOutput()
        NSNotificationCenter.defaultCenter().addObserverForName(AVCaptureInputPortFormatDescriptionDidChangeNotification, object: nil, queue: NSOperationQueue.currentQueue()) { (_) in
            outPut.rectOfInterest = self.layer!.metadataOutputRectOfInterestForRect(CGRectMake(0.2 * screenW, 0.3 * screenH, 0.6 * screenW, 0.6 * screenW))
        }
        outPut.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        if sessionTemp.canAddOutput(outPut){
            sessionTemp.addOutput(outPut)
        }
        outPut.metadataObjectTypes = [AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code]
       setUpUI()
        let timer = NSTimer.init(timeInterval: 1.0, target: self, selector: #selector(self.annimation), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        session?.startRunning()
        
    }
    
    func setUpUI(){
        let viewk = UIView()
        viewk.frame = CGRectMake(0.2 * screenW, 0.3 * screenH, 0.6 * screenW, 0.6 * screenW)
        viewk.layer.borderWidth = 1.0
        viewk.layer.borderColor = UIColor.orangeColor().CGColor
        lineView.backgroundColor = UIColor.orangeColor()
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "将二维码放入框内，即可自动扫描", attributes: [NSForegroundColorAttributeName : UIColor.orangeColor()])
        label.frame = CGRectMake(0, 0.3 * screenH + 0.6 * screenW + 5, screenW, 20)
        label.textAlignment = .Center
        view.addSubview(label)
        view.addSubview(lineView)
        view.addSubview(viewk)
        view.layer.insertSublayer(layer!, atIndex: 0)
        
    }
    
    func annimation(){
    UIView.animateWithDuration(1.0) {
        if self.lineView.mh_y == 0.3 * screenH + 0.6 * screenW{
            self.lineView.mh_y = 0.3 * screenH
        }else{
        self.lineView.mh_y = 0.3 * screenH + 0.6 * screenW
        }
        }
        
    }
    
    internal func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        if let metadataObjectsTemp = metadataObjects.first {
            
            let metadataObject = metadataObjectsTemp as! AVMetadataMachineReadableCodeObject
            print(metadataObject.stringValue)
            // 拿到metadataObject.stringValue跳到对应的房间
            session?.stopRunning()
            layer?.removeFromSuperlayer()
        }else{
            
            print("no data")
        }
        
    }
}

