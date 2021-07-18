//
//  ViewController.swift
//  PiktaleTask
//
//  Created by MYGENOMEBOX INDIA on 14/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    //Mark:- Set IBoutlets
    @IBOutlet weak var tblView: UITableView!
    let avPlayerController = AVPlayerViewController()
    var player = AVPlayer()
    
    //Mark Properties and data types
    var mediaclass: MediaClass?
    var list : [List] = []
    var viewModel:ViewModel!
    var ispageEnd = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        // Do any additional setup after loading the view.
        
        //mark: Register tableViewCells
        self.tblView.register( UINib(nibName: "RecentActivityCell", bundle: nil), forCellReuseIdentifier: "RecentActivityCell")
        
        self.tblView.register(UINib(nibName: "VideoViewCell", bundle: nil), forCellReuseIdentifier: "VideoViewCell")
        
        //Mark: Fetch Data from json
        self.fetchItems(fileName: "page_1")
    }
    
    
    //Mark: Offline API Request to get json
    func fetchItems(fileName:String) {
        
        viewModel.fetchItems(fileName: fileName) { [weak self] (list, error) in
            
            print("TOTAL ITEMS: \(list.count)")
            
            let json = MediaClass(fromDictionary: list.rawValue as! [String : Any])
            self!.mediaclass = json
            // self?.list = self?.mediaclass?.list ?? []
            self?.list.append(contentsOf: self?.mediaclass?.list ?? [])
            self?.tblView.reloadData()
            
        }
    }
}


extension ViewController:UITableViewDataSource{
    //  Mark:- TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "RecentActivityCell") as! RecentActivityCell
        //  cell.imageHight = 100
        cell.play_img.isHidden = true
        let row = list[indexPath.row]
        var cellFrame = cell.frame.size
        cellFrame.height =  cellFrame.height - 15
        cellFrame.width =  cellFrame.width - 15
        
        if indexPath.row == 9 && ispageEnd{
            ispageEnd = false
            self.fetchItems(fileName: "page_2")
        }
        if row.mediaType == "image"{
            cell.userName.text = row.title
            cell.thumbImage.sd_setImage(with: URL(string: row.mediaUrl ?? ""), placeholderImage: UIImage(named: "img_default_i.png"), options: [], completed: { (downloadedImage, error, cache, url) in
                if downloadedImage != nil{
                    
                    cell.imageHight.constant = getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame, downloadedImage: downloadedImage!)
                    tableView.updateConstraints()
                }
                
            })
            return cell
        }else if row.mediaType == "video"{
            let cell = tblView.dequeueReusableCell(withIdentifier: "VideoViewCell") as! VideoViewCell
            
            cell.UserName.text = row.title
            self.playVideo(urlStr: row.mediaUrl, playerView: cell.videoView)
            
            
            //  cell.videoView.addSubview(avPlayerController)
            return cell
        }
        return UITableViewCell()
    }
    
    //MARK: - Play Video
    func playVideo(urlStr:String,playerView:UIView){
        
        let strurl = urlStr.removingPercentEncoding
        guard let url = URL(string: strurl!) else {
            return
        }
        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        player = AVPlayer(url: url)
        
        avPlayerController.player = player;
        avPlayerController.view.frame = playerView.bounds;
        
        self.addChild(avPlayerController)
        playerView.addSubview(avPlayerController.view);
        
    }
}

extension ViewController : UITableViewDelegate{
    
    //Mark:- TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = list[indexPath.row]
        
        if row.mediaType == "video"{
            
            let cell = tblView.dequeueReusableCell(withIdentifier: "VideoViewCell") as! VideoViewCell
            self.playVideo(urlStr: row.mediaUrl, playerView: cell.videoView)
        }
    }
}
