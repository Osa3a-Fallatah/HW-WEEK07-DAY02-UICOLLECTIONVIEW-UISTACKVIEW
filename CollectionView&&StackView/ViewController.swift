//
//  ViewController.swift
//  CollectionView&&StackView
//
//  Created by Osama folta on 03/04/1443 AH.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var mainCv: UICollectionView!
    @IBOutlet weak var greenCv: UICollectionView!
    @IBOutlet weak var redCv: UICollectionView!
    var originArray = ["🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴","🟢" ,"🔴"]
    var greenArray=[String]()
    var redArray=[String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mainCv.delegate = self
        mainCv.dataSource = self
        greenCv.reloadData()
        redCv.reloadData()

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCv
        {return originArray.count}
        
        else if collectionView == greenCv
        {return greenArray.count}
        
        else {return redArray.count}
    }
    override func viewWillAppear(_ animated: Bool) {
        greenCv.reloadData()
        redCv.reloadData()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCv {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath ) as! mainCVCell
            cell.mainLabel.text = originArray[indexPath.row]
            return cell

        } else if collectionView == greenCv{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "greenCell", for: indexPath ) as! greenCVcell
                       cell.greenLabel.text = greenArray[indexPath.row]
            return cell

        } else {
        let cell = redCv.dequeueReusableCell(withReuseIdentifier: "redCell", for: indexPath ) as! redCVcell
                       cell.redLabel.text = redArray[indexPath.row]
            return cell
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
        for i in originArray {
            if i == "🟢"{
                greenArray.append(i)

            }}
      
        for j in originArray {
            if j == "🔴"{
                redArray.append(j)
            }}
        
        print(redArray,greenArray)
        greenCv.reloadData()
        redCv.reloadData()

               
    }
}

