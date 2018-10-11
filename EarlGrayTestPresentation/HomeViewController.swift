//
//  HomeViewController.swift
//  EarlGrayTestPresentation
//
//  Created by Babic Vojko on 9/21/18.
//  Copyright © 2018 CarnegieTechnologies. All rights reserved.
//

import UIKit

struct Channel {
    let name: String
    let logo: UIImage?
}

struct ChannelCategory {
    let name: String
    let image: UIImage
}

class HomeViewController: UITableViewController {
    var myChannels: [Channel]!
    var hotChannels: [Channel]!
    var newChannels: [Channel]!
    var categories: [ChannelCategory]!

    @IBOutlet weak var myChannelsCollectionView: UICollectionView!
    @IBOutlet weak var hotChannelsCollectionView: UICollectionView!
    @IBOutlet weak var newChannelsCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "table"
        searchBar.accessibilityIdentifier = "searchBar"
        myChannelsCollectionView.accessibilityIdentifier = "myChannelsCollection"
        hotChannelsCollectionView.accessibilityIdentifier = "hotChannelsCollection"
        newChannelsCollectionView.accessibilityIdentifier = "newChannelsCollection"
        categoriesCollectionView.accessibilityIdentifier = "categoriesCollection"
        createInitData()
    }

    private func createInitData() {
        myChannels = [
            Channel(name: "Drljin Kanal", logo: UIImage(named: "All")),
            Channel(name: "Banetov Kanal", logo: UIImage(named: "Art")),
            Channel(name: "Vojkov Kanal", logo: UIImage(named: "Automotive")),
            Channel(name: "Sarin Kanal", logo: UIImage(named: "Banking&Finance")),
            Channel(name: "Jelenin Kanal", logo: UIImage(named: "Celebrity")),
            Channel(name: "Maretov Kanal", logo: UIImage(named: "Customer Goods")),
            Channel(name: "More", logo: UIImage(named: "Other"))
        ]
        hotChannels = [
            Channel(name: "Jocin Kanal", logo: UIImage(named: "Entertainment")),
            Channel(name: "Milicin  Kanal", logo: UIImage(named: "Fashion")),
            Channel(name: "Ivanin Kanal", logo: UIImage(named: "Food&Drinks")),
            Channel(name: "Marinin Kanal", logo: UIImage(named: "Health&Beauty")),
            Channel(name: "Anin Kanal", logo: UIImage(named: "Music")),
            Channel(name: "Milosev Kanal", logo: UIImage(named: "News")),
            Channel(name: "Aleksandrin Kanal", logo: UIImage(named: "Automotive"))
        ]
        newChannels = [
            Channel(name: "Ivanov kanal", logo: UIImage(named: "Public Services")),
            Channel(name: "Tijanin Kanal", logo: UIImage(named: "Sports")),
            Channel(name: "Damirov Kanal", logo: UIImage(named: "Technology")),
            Channel(name: "Levajin Kanal", logo: UIImage(named: "Travel&Transport")),
            Channel(name: "Vladin Kanal", logo: UIImage(named: "All"))
        ]
        categories = [
            ChannelCategory(name: "QA", image: UIImage(named: "Music")!),
            ChannelCategory(name: "Dev", image: UIImage(named: "Food&Drinks")!),
            ChannelCategory(name: "Design", image: UIImage(named: "Art")!),
            ChannelCategory(name: "Bussiness", image: UIImage(named: "News")!),
            ChannelCategory(name: "Management", image: UIImage(named: "Banking&Finance")!)
        ]
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myChannelsCollectionView {
            return myChannels.count
        } else if collectionView == hotChannelsCollectionView {
            return hotChannels.count
        } else if collectionView == newChannelsCollectionView {
            return newChannels.count
        } else if collectionView == categoriesCollectionView {
            return categories.count
        }
        return 0
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if collectionView == myChannelsCollectionView {
            let channel = myChannels[indexPath.row]
            let myChannelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyChannelCell", for: indexPath) as? BaseCollectionCell
            myChannelCell?.titlelabel.text = channel.name
            myChannelCell?.coverImageView.image = channel.logo
            if channel.name == "More" {
                myChannelCell?.accessibilityIdentifier = "myChannelMore"
            } else {
                myChannelCell?.accessibilityIdentifier = "myChannel\(indexPath.row)"
            }

            cell = myChannelCell
        } else if collectionView == hotChannelsCollectionView {
            let channel = hotChannels[indexPath.row]
            let myChannelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotChannelCell", for: indexPath) as? BaseCollectionCell
            myChannelCell?.titlelabel.text = channel.name
            myChannelCell?.coverImageView.image = channel.logo
            cell = myChannelCell
        } else if collectionView == newChannelsCollectionView {
            let channel = newChannels[indexPath.row]
            let myChannelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewChannelCell", for: indexPath) as? BaseCollectionCell
            myChannelCell?.titlelabel.text = channel.name
            myChannelCell?.coverImageView.image = channel.logo
            cell = myChannelCell
        } else if collectionView == categoriesCollectionView {
            let category = categories[indexPath.row]
            let myChannelCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? BaseCollectionCell
            myChannelCell?.titlelabel.text = category.name
            myChannelCell?.coverImageView.image = category.image
            myChannelCell?.accessibilityIdentifier = "category\(indexPath.row)"
            cell = myChannelCell
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var channel: Channel?
        if collectionView == myChannelsCollectionView {
            channel = myChannels[indexPath.row]
        } else if collectionView == hotChannelsCollectionView {
            channel = hotChannels[indexPath.row]
        } else if collectionView == newChannelsCollectionView {
            channel = newChannels[indexPath.row]
        }
        if let c = channel {
            if c.name == "More" {
                performSegue(withIdentifier: "showMoreChannelsSegue", sender: nil)
            } else {
                performSegue(withIdentifier: "channelDetailsSegue", sender: nil)
            }
        }
    }
}
