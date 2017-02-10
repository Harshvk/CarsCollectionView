//
//  CarsCollectionVC.swift
//  CarsCollectionView
//
//  Created by appinventiv on 10/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CarsCollectionVC: UIViewController {

    
    @IBOutlet weak var CarsCollection: UICollectionView!
    
    
    var CarData : [[String:Any]] = [["Name" : "Ford" , "Color" : UIColor.blue],
                                     ["Name" : "Porsche" , "Color" : UIColor.yellow],
                                     ["Name" : "Mustang" , "Color" : UIColor.red],
                                     ["Name" : "Tata" , "Color" : UIColor.gray],
                                     ["Name" : "Fiat" , "Color" : UIColor.green],
                                     ["Name" : "Ferrari" , "Color" : UIColor.red],
                                     ["Name" : "Corvette" , "Color" : UIColor.black],
                                     ["Name" : "Volvo" , "Color" : UIColor.white],
                                     ["Name" : "DC" , "Color" : UIColor.blue],
                                     ["Name" : "Infinity" , "Color" : UIColor.black],
                                     ["Name" : "Toyota" , "Color" : UIColor.darkGray]
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CarsCollection.dataSource = self
        
        CarsCollection.delegate = self
        
        
        let flowlayout = UICollectionViewFlowLayout()
        
        flowlayout.minimumLineSpacing = 15
        
        flowlayout.minimumInteritemSpacing = 2
        
        CarsCollection.collectionViewLayout = flowlayout
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CarsCollectionVC : UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return CarData.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCellID", for: indexPath) as? CarCell
    else{ fatalError("Cell Not Found") }
        
        let car = CarModel(withJSON: CarData[indexPath.item])
        cell.configureCell(withCar: car)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if indexPath.item == 0{
            
            return CGSize(width: 300, height: 200)
            
        }else{
            
            return CGSize(width: 100, height: 130)
        }
        
    }
    
    
   

    

}

class CarModel {
    
    var color : UIColor!
    var name : String!
    
    init(withJSON data : [String:Any] ){
        
        color = data["Color"] as! UIColor?
        name = data["Name"] as! String?

        
    }
    
    
    
}

class CarCell : UICollectionViewCell {
    
    
    @IBOutlet weak var carImage: UIImageView!
    
    
    @IBOutlet weak var carManufacturer: UILabel!
    
    override func awakeFromNib() {
        
        carImage.layer.borderWidth = 2
        carImage.layer.borderColor = UIColor.black.cgColor
        
        
    }
    func configureCell(withCar car: CarModel){
        
       carImage.backgroundColor = car.color
        carManufacturer.text = car.name
        
    }
    
}
