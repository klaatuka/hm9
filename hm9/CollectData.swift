

import Foundation
struct CollectData {
    
    let id: String = UUID().uuidString
    
    let title: String
    let photo: String
    let text: String
    let href: String
    
    static func getData() -> [CollectData] {
        return [CollectData(title: "Продолжительность первого трейлера следующей GTA — 91 секунда", photo: "gta", text: "4 декабря 2023 года студия Rockstar Games запустила на своём YouTube-канале таймер до выхода первого трейлера следующей GTA. Никакой дополнительной информации об игре в описании ролика не появилось.", href: "https://dtf.ru/games/2320794-prodolzhitelnost-pervogo-treylera-sleduyushchey-gta-91-sekunda"),
                CollectData(title: "Купи Macbook со скидкой", photo: "macbook", text: "Купи Macbook со скидкой на озон. Цена вроде со скидкой, но по факту завышена", href: "https://www.ozon.ru/product/14-noutbuk-apple-macbook-pro-96w-usb-c-power-adapter-apple-m1-pro-8c-cpu-14c-gpu-ram-16-gb-ssd-512-1256356218/?campaignId=305&oos_search=false"),
                CollectData(title: "Яндекс", photo: "yandex", text: "Яндекс найдётся всё. Новый сайт по старым правилам.", href: "https://yandex.ru")
                
        ]
    }
}
