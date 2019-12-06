
import UIKit
import SnapKit
class WheatherViewController: UIViewController {
    @objc func buttonClicked() {
        print("Button Clicked")
    }
    
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
    
    let temperatureLabel: UILabel = {
           let name = UILabel()
           name.text = "Temperature "
         name.textColor = UIColor(cgColor: CGColor(srgbRed: 14.0/255, green: 122.0/255, blue: 254.0/255 , alpha: 1))
           name.textAlignment = NSTextAlignment.center
           name.font = UIFont(name: name.font.fontName, size: 26)
           return name
       }()
    let stateLabel: UILabel = {
              let name = UILabel()
              name.text = "| State"
              name.textColor = UIColor(cgColor: CGColor(srgbRed: 14.0/255, green: 122.0/255, blue: 254.0/255 , alpha: 1))
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
        button.backgroundColor = .blue
        button.setTitle("Share", for: .normal)
        //button.addTarget(self, action: #selector(self.buttonAction(_)), for: .touchUpInside)
        return button
    }()
    
    let buttonWidth:CGFloat = 150
    let buttonHeight:CGFloat = 45
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
            make.top.equalTo(self.view.snp_topMargin).offset(50)
            make.centerX.equalTo(self.view.snp_centerXWithinMargins)
        }
        cityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.view.snp_centerXWithinMargins)
        }
        stateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(self.view.snp_centerXWithinMargins)
        }
        temperatureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(cityLabel.snp_bottomMargin).offset(20)
            make.right.equalTo(self.view.snp_centerXWithinMargins)
           
        }
        humidityView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp_bottomMargin).offset(70)
            make.right.equalTo(self.view.snp_centerXWithinMargins)
            make.left.equalTo(self.view.snp_leftMargin)
        }
       pressureView.snp.makeConstraints { (make) in
            make.top.equalTo(temperatureLabel.snp_bottomMargin).offset(70)
            make.right.equalTo(self.view.snp_rightMargin)
            make.left.equalTo(self.view.snp_centerXWithinMargins)
        }
       humidityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(humidityView.snp_bottomMargin).offset(5)
            make.centerX.equalTo(humidityView.snp_centerXWithinMargins)
        }
        pressureLabel.snp.makeConstraints { (make) in
            make.top.equalTo(pressureView.snp_bottomMargin).offset(5)
            make.centerX.equalTo(pressureView.snp_centerXWithinMargins)
        }
        
        speedView.snp.makeConstraints { (make) in
                    make.top.equalTo(humidityLabel.snp_bottomMargin).offset(70)
                    make.right.equalTo(self.view.snp_centerXWithinMargins)
                    make.left.equalTo(self.view.snp_leftMargin)
                }
        directionView.snp.makeConstraints { (make) in
             make.top.equalTo(pressureLabel.snp_bottomMargin).offset(70)
             make.right.equalTo(self.view.snp_rightMargin)
             make.left.equalTo(self.view.snp_centerXWithinMargins)
         }
        speedLabel.snp.makeConstraints { (make) in
             make.top.equalTo(speedView.snp_bottomMargin).offset(5)
             make.centerX.equalTo(speedView.snp_centerXWithinMargins)
         }
         directionLabel.snp.makeConstraints { (make) in
             make.top.equalTo(directionView.snp_bottomMargin).offset(5)
             make.centerX.equalTo(directionView.snp_centerXWithinMargins)
         }
        shareButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(20)
            make.top.equalTo(directionLabel.snp_bottomMargin).offset(20)
            make.centerX.equalTo(self.view.snp_centerXWithinMargins)
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

