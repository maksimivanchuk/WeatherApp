
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
    
    let cityLabel: UILabel = {
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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Share", for: .normal)
        button.titleLabel?.font = UIFont(name:"", size: 28)
        //button.addTarget(self, action: #selector(self.buttonAction(_)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
            make.top.equalTo(self.view).offset(100)
            make.centerX.equalTo(self.view)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
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
            make.left.equalTo(self.view.snp_leftMargin)
        }
       pressureView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(35)
            make.right.equalTo(self.view.snp_rightMargin)
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
            make.left.equalTo(self.view.snp_leftMargin)
        }
        directionView.snp.makeConstraints { (make) in
            make.top.equalTo(pressureLabel.snp.bottom).offset(35)
            make.right.equalTo(self.view.snp_rightMargin)
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
            make.bottom.equalTo(self.view.snp.bottom).inset(100)
            make.centerX.equalTo(self.view.snp.centerX)
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

