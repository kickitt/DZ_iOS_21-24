//
//  DataProvider.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 27.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class DataProvider: NSObject {

    static var shared = DataProvider()
    
    
    private override init() {
        
    }
    
    //MARK: - DataSource Methods
    func getCommentModel() -> [DZ22CommentModel] {
        
        return [DZ22CommentModel(userImage: "https://24smi.org/public/media/celebrity/2017/04/11/RE3rRiAZRWmT_yurij-gagarin.jpg", userName: "Yurii Gagarin", commentDate: "12.01.1950", commentText: "WTF? Returns YES if the table view is in the middle of reordering, is displaying a drop target gap, or has drop placeholders. If possible, avoid calling -reloadData while there are uncommitted updates to avoid interfering with user-initiated interactions that have not yet completed."), DZ22CommentModel(userImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRt5XJLFCWyAByAC9CYhlHPEQI0m3F6A1bz32a4oVn0RVRW1K3c&usqp=CAU", userName: "Valentyna Tereshkova", commentDate: "21.02.1968", commentText: "If possible, avoid calling -reloadData while there are uncommitted updates to avoid interfering"),DZ22CommentModel(userImage: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/SKorolow.jpg/250px-SKorolow.jpg", userName: "Sergey Korolev", commentDate: "07.10.2000", commentText: "Сергей Королёв является одним из основных создателей советской ракетно-космической техники, обеспечившей стратегический паритет и сделавшей Союз Советских Социалистических Республик передовой ракетно-космической державой, и ключевой фигурой в освоении человеком космоса, основателем практической космонавтики. Под его руководством был организован и осуществлён запуск первого искусственного спутника Земли и первого космонавта планеты Юрия Гагарина. Дважды Герой Социалистического Труда, лауреат Ленинской премии. Член КПСС с июля 1953 года[2]. Скончался 14 января 1966 года в Москве, похоронен в некрополе у Кремлёвской стены.")]
    }
    
    func getDataArray() -> [String] {
        return ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    }
    
    func getEmptyArray() -> [[String]] {
    return [[],["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]]
    }
    
}
