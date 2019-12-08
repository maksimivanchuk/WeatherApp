
import UIKit
import SnapKit
class WheatherViewController: UIViewController {
   
    let imageView: UIImageView = {
        let image: UIImage = UIImage(named: "clouds.png")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var cityLabel: UILabel = {
        let name = UILabel()
        name.text = "City and Country"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let someLabel: UILabel = {
        let name = UILabel()
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let temperatureLabel: UILabel = {
        let name = UILabel()
        name.text = "Temperature "
        name.textColor = .systemBlue
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 26)
        return name
       }()
    
    let stateLabel: UILabel = {
        let name = UILabel()
        name.text = "| State"
        name.textColor = .systemBlue
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 26)
        return name
          }()
    
    let humidityView: UIImageView = {
      let image: UIImage = resizeImage(image: UIImage(named: "humidity.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let name = UILabel()
        name.text = "humidity"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let pressureView: UIImageView = {
         let image: UIImage = resizeImage(image: UIImage(named: "pressure.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let pressureLabel: UILabel = {
           let name = UILabel()
           name.text = "pressure"
           name.textAlignment = NSTextAlignment.center
           name.font = UIFont(name: name.font.fontName, size: 22)
           return name
       }()
    
    let speedView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "wind.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let speedLabel: UILabel = {
        let name = UILabel()
        name.text = "speed"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let directionView: UIImageView = {
        let image: UIImage = resizeImage(image: UIImage(named: "compass.png")!,targetSize: CGSize(width: 50.0, height: 50.0))
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let directionLabel: UILabel = {
        let name = UILabel()
        name.text = "direction"
        name.textAlignment = NSTextAlignment.center
        name.font = UIFont(name: name.font.fontName, size: 22)
        return name
    }()
    
    let shareButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 100))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(" Share ", for: .normal)
        button.titleLabel?.font = UIFont(name:"", size: 28)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.tag = 1
      
        button.layer.borderWidth = 2.0
        button.layer.borderColor = (UIColor.systemBlue).cgColor
        button.clipsToBounds = true
        
        return button
    }()
    
    private var observer: AnyObject?
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
   /* DispatchQueue.main.async {
            self.observer = NotificationCenter.default.addObserver(
                forName: NSNotification.Name(rawValue: "Update"),
                object: nil,
                queue: OperationQueue.main)
            { [weak self] notification in
                guard self != nil else {
                    return
                }
            }
        }*/
       //self.cityLabel.text = listViewModel.listModel.items[0].descriptionField
        setupView()
      
    }

    @objc func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            dismiss(animated: true, completion: nil)
            print("Button Clicked")
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
               view.addSubview(imageView)
               view.addSubview(cityLabel)
               
               view.addSubview(stateLabel)
               view.addSubview(temperatureLabel)
               
               view.addSubview(humidityView)
               view.addSubview(pressureView)
               view.addSubview(humidityLabel)
               view.addSubview(pressureLabel)
               
               view.addSubview(speedView)
               view.addSubview(directionView)
               view.addSubview(speedLabel)
               view.addSubview(directionLabel)
               view.addSubview(shareButton)
               
               imageView.snp.makeConstraints { (make) in
                   make.width.height.equalTo(100)
                   make.top.equalToSuperview().offset(100)
                   make.centerX.equalToSuperview()
               }
               cityLabel.snp.makeConstraints { (make) in
                   make.top.equalTo(imageView.snp.bottom).offset(10)
                   make.centerX.equalToSuperview()
               }
               stateLabel.snp.makeConstraints { (make) in
                   make.top.equalTo(cityLabel.snp.bottom).offset(15)
                   make.left.equalTo(self.view.snp.centerX)
               }
               temperatureLabel.snp.makeConstraints { (make) in
                   make.top.equalTo(cityLabel.snp.bottom).offset(15)
                   make.right.equalTo(self.view.snp.centerX)
               }
               humidityView.snp.makeConstraints { (make) in
                   make.top.equalTo(temperatureLabel.snp.bottom).offset(35)
                   make.right.equalTo(self.view.snp.centerX)
                   make.left.equalToSuperview()
               }
              pressureView.snp.makeConstraints { (make) in
                   make.top.equalTo(temperatureLabel.snp.bottom).offset(35)
                   make.right.equalToSuperview()
                   make.left.equalTo(self.view.snp.centerX)
               }
              humidityLabel.snp.makeConstraints { (make) in
                   make.top.equalTo(humidityView.snp.bottom).offset(5)
                   make.centerX.equalTo(humidityView.snp.centerX)
               }
               pressureLabel.snp.makeConstraints { (make) in
                   make.top.equalTo(pressureView.snp.bottom).offset(5)
                   make.centerX.equalTo(pressureView.snp.centerX)
               }
               
               speedView.snp.makeConstraints { (make) in
                   make.top.equalTo(humidityLabel.snp.bottom).offset(35)
                   make.right.equalTo(self.view.snp.centerX)
                   make.left.equalToSuperview()
               }
               directionView.snp.makeConstraints { (make) in
                   make.top.equalTo(pressureLabel.snp.bottom).offset(35)
                   make.right.equalToSuperview()
                   make.left.equalTo(self.view.snp.centerX)
                }
               speedLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(speedView.snp.bottom).offset(5)
                    make.centerX.equalTo(speedView.snp.centerX)
                }
                directionLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(directionView.snp.bottom).offset(5)
                    make.centerX.equalTo(directionView.snp.centerX)
                }
               shareButton.snp.makeConstraints { (make) in
                   make.bottom.equalToSuperview().inset(100)
                   make.centerX.equalToSuperview()
               }
    }
    
}


 func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
        newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
}

func action(sender:UIButton!) {
   print("Button Clicked")
}
