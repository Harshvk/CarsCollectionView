//
//  CarsCollectionVC.swift
//  CarsCollectionView
//
//  Created by appinventiv on 10/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CarsCollectionVC: UIViewController {

    //Making outlet of CollectionView
    @IBOutlet weak var CarsCollection: UICollectionView!
    
    //Defining Data
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

    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Assigning dataSource and delegate to collection view
        
        CarsCollection.dataSource = self
        
        CarsCollection.delegate = self
        
        //Setting up FlowLayout
        let flowlayout = UICollectionViewFlowLayout()
        
        flowlayout.minimumLineSpacing = 15
        
        flowlayout.minimumInteritemSpacing = 2
        
        flowlayout.scrollDirection = .horizontal
        
        CarsCollection.collectionViewLayout = flowlayout
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
//MARK: CollectionDelegate , CollectionDatasource and FlowLayoutDelegate
extension CarsCollectionVC : UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    //Defining No of Sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return CarData.count
        
        
    }
    
    //Defining Cell for each item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        //Making Object of Cell
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarCellID", for: indexPath) as? CarCell
    else{ fatalError("Cell Not Found") }
        
        //Converting data from JSON to CarModel
        let car = CarModel(withJSON: CarData[indexPath.item])
        
        //Assigning data to cells
        cell.configureCell(withCar: car)
        
        
        return cell
        
    }
    
    //Defining size of Individual Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if indexPath.item == 0{
            
            return CGSize(width: 300, height: 200)
            
        }else{
            
            return CGSize(width: 100, height: 130)
        }
        
    }
    
    
   

    

}

//MARK: Data Conversion from JSON to CarModel
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
    
    //Function For Adding data to cell
    func configureCell(withCar car: CarModel){
        
       carImage.backgroundColor = car.color
        carManufacturer.text = car.name
        
    }
    
}
