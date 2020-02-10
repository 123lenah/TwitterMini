//
//  TweetViewController.swift
//  Twitter
//
//  Created by Lenah Syed on 2/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.becomeFirstResponder()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetAction(_ sender: Any) {
        if (!textView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: textView.text!, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: {
                (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
