//
//  ViewBook.swift
//  myBook
//
//  Created by Quan on 7/19/16.
//  Copyright © 2016 MyStudio. All rights reserved.
//

import UIKit

class ViewBook: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    
    var type : String!
    var bookPDF = [
        ("abrieferhistory"),
        ("aspoofonsexdonwireman"),
        ("barrysworldjenvey"),
        ("foreigneduwilliam"),
        ("gonewithtrash"),
        ("gospelbuckydennis"),
        ("oddjobsbowling"),
        ("oneclownshortwright"),
        ("questingromana"),
        ("thedistancetravelled")
    ]
    var bookHTML = [
        ("Lập trình iOS Objective-C")
    ]
    var bookDocx = [
        ("coexistcrane"),
        ("darkkisssylviaday"),
        ("isthislove"),
        ("lovelikethishubbard"),
        ("lumberlacewards")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        type = self.tabBarItem.title!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var countL: Int!
        switch type {
        case "PDF":
            countL = bookPDF.count
        case "DOCX":
            countL = bookDocx.count
        case "HTML":
            countL = bookHTML.count
        default:
            break
        }
        
        return countL
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellCollection", forIndexPath: indexPath) as! ACellBook
        var thubImg: UIImage!
        var nameLabel : String!
        
        switch type {
        case "PDF":
            thubImg = UIImage(named: (bookPDF[indexPath.item] + (".jpg")))
            nameLabel = bookPDF[indexPath.item]
        case "DOCX":
            thubImg = UIImage(named: (bookDocx[indexPath.item] + (".jpg")))
            nameLabel = bookDocx[indexPath.item]
        case "HTML":
            thubImg = UIImage(named: (bookHTML[indexPath.item] + (".jpg")))
            nameLabel = bookHTML[indexPath.item]
        default:
            break
        }
        
        cell.imgView.image = thubImg
        cell.nameLabel.text = nameLabel
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewDetailBook = self.storyboard?.instantiateViewControllerWithIdentifier("DetailBook") as! DetailBook
        var urlString : String!
        
        switch type {
        case "PDF":
            urlString = bookPDF[indexPath.item]
        case "DOCX":
            urlString = bookDocx[indexPath.item]
        case "HTML":
            urlString = bookHTML[indexPath.item]
        default:
            break
        }
        viewDetailBook.urlString = urlString
        viewDetailBook.type = self.tabBarItem.title!
        self.navigationController?.pushViewController(viewDetailBook, animated: true)
    }

}
