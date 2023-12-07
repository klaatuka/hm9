

import Foundation
struct CollectData {
    
    let id: String = UUID().uuidString
    
    let title: String
    let photo: String
    let text: String
    
    
    static func getData() -> [CollectData] {
        return [CollectData(title: "Первая картинка", photo: "img1", text: "Это трансформенный инстаграм, крутите вертите, делайте что хотите, вы ограниченны лишь вашими фантазиями"),
                CollectData(title: "Вторая картинка", photo: "img2", text: "Да это не шутка, крутите вертите, делайте что хотите, вы ограниченны лишь вашими фантазиями"),
        ]
    }
}
