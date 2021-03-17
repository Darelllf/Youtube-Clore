//
//  ViewController.swift
//  Youtube Clore
//
//  Created by Darell Legoferdanu on 15/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate  {

  

  

  var model = Model()
  var videos = [Video]()
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.with link below
    tableView.dataSource = self
    tableView.delegate = self
    
    model.delegate = self
    model.getVideo()
  }
  
  func videosFatched(_ videos: [Video]) {
    self.videos = videos
    
    tableView.reloadData()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videos.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
    
    let title = self.videos[indexPath.row].title
    
    cell.textLabel?.text = title
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt IndexPath: IndexPath){
  }
}


