//
//  CategoryDetailViewController.swift
//  EarlGrayTestPresentation
//
//  Created by Babic Vojko on 9/24/18.
//  Copyright © 2018 CarnegieTechnologies. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    var name: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "categoryPreview"
        categoryName.text = name
        categoryImage.image = image
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
