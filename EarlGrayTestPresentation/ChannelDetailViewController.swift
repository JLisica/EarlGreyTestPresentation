//
//  ChannelDetailViewController.swift
//  EarlGrayTestPresentation
//
//  Created by Babic Vojko on 9/24/18.
//  Copyright © 2018 CarnegieTechnologies. All rights reserved.
//

import UIKit

class ChannelDetailViewController: UIViewController {

    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelImage: UIImageView!
    
    var name: String?
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "channelPreview"
        channelName.text = name
        channelImage.image = image
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
