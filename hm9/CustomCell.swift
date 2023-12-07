

import UIKit

class CustomCell: UICollectionViewCell {
    
    
    static var reusId = "cell"
    
    var isViewAExpanded = false
    var originPosition: CGRect?
    var originTransform: CGAffineTransform?
    
    let collectData: [CollectData] = CollectData.getData()
    
    func config(data: CollectData, view: UIView){
        let text: UILabel = {
            $0.text = data.title
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UILabel())
        
        let image: UIImageView = {
            
            let tab = UITapGestureRecognizer(target: self, action: #selector(tapGest(sender: )))
            tab.numberOfTapsRequired = 2
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panGest(sender: )))
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchGest(sender: )))
            $0.isUserInteractionEnabled = true
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addGestureRecognizer(tab)
            $0.addGestureRecognizer(pan)
            $0.addGestureRecognizer(pinch)
            originPosition = $0.frame
            originTransform = $0.transform

            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        let text2: UILabel = {
            $0.text = data.text
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UILabel())
        
        
        let cellView: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = #colorLiteral(red: 0.9341433644, green: 0.9341433644, blue: 0.9341433644, alpha: 1)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.addSubview(text)
            $0.addSubview(image)
            $0.addSubview(text2)
            return $0
        }(UIView())
        
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imgHeight = (UIScreen.main.bounds.width - 20) * ratio
        
        view.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            
            text.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 21),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -30),
            
            image.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            image.heightAnchor.constraint(equalToConstant: imgHeight),
            
            text2.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            text2.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 30),
            text2.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -30),
            text2.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -25),
        ])
    }
    
    @objc func panGest(sender: UIPanGestureRecognizer) {
        guard let gestereView = sender.view else { return }
        
        if isViewAExpanded {
            
            let translate = sender.translation(in: self)
            gestereView.center = CGPoint(x: gestereView.center.x + translate.x, y: gestereView.center.y + translate.y)
            
            sender.setTranslation(.zero, in: self)
            print(gestereView.frame)
            
            switch sender.state {
            
            case .began:
                print("start")
           
            case .ended:
                
                    UIView.animate(withDuration: 0.3) {
                        gestereView.frame = self.originPosition!
                        
                }
            default:
                break
            }
        }
    }
    @objc func tapGest(sender: UITapGestureRecognizer){
        guard let gestereView = sender.view else { return }
        
        if !isViewAExpanded {
            UIView.animate(withDuration: 0.3) {
                gestereView.transform = self.transform.scaledBy(x: 2, y: 2)
            }
            isViewAExpanded.toggle()
        } else {
            UIView.animate(withDuration: 0.3) {
                gestereView.transform = .identity
            }
            isViewAExpanded.toggle()
        }
        
        
    }
    
    @objc func pinchGest(sender: UIPinchGestureRecognizer) {
        guard let gestereView = sender.view else { return }
        print(sender.scale)
 
        switch sender.state {
        case .began:
            
       
            originTransform = gestereView.transform
        case .changed:
            gestereView.transform = gestereView.transform.scaledBy(x: sender.scale, y: sender.scale)
            
            sender.scale = 1.0
        case .ended:
            UIView.animate(withDuration: 0.3) {
                gestereView.transform = self.originTransform ?? .identity
                gestereView.frame = self.originPosition!
            }
        default:
            break
        }
        
    }
}
