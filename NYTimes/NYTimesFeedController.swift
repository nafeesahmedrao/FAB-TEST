//
//  NYTimesFeedController.swift
//  NYTimes
//
//  Created by Mubeena K A on 25/11/2019.
//  Copyright © 2019 Nafees. All rights reserved.
//

import UIKit

class NYTimesFeedController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let client = NewsClient()
    private var results = [News]()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        // Create Activity Indicator
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator.hidesWhenStopped = false
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.center = view.center
        self.startLoadingNewsFeeds()
    }
    
    /// Load feeds
    private func startLoadingNewsFeeds() {
        
        self.activityIndicator.startAnimating()
        self.client.getFeed(from: .topRated) { [weak self] result in
            switch result {
            case .success(let movieFeedResult):
                guard let newsResults = movieFeedResult?.results else { return }
                self?.results = newsResults
                self?.tableView.reloadData()
                self?.hideActivityIndicator()
            case .failure(let error):
                print("the error \(error)")
                self?.hideActivityIndicator()
            }
        }
    }
    
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNYTimesDetailIdentifier" {
            if let destinationVC = segue.destination as? NYTimesDetailController {
                destinationVC.news = sender as? News
            }
        }
    }

}

// MARK: - Table View Delegate & Datasource method
extension NYTimesFeedController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NYTimesCellIdentifier", for: indexPath) as! NYTimesTableViewCell
        cell.updateCellResult(news: self.results[indexPath.row])
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showNYTimesDetailIdentifier", sender: self.results[indexPath.row])
    }
}
