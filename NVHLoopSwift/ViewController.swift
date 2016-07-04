//
//  ViewController.swift
//  NVHLoopSwift
//
//  Created by Hùng Nguyễn  on 6/30/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtF_number: UITextField!
    
    var member = ["GrandFather","GrandMother","Father","Mother","Brother","Sister"]
    var vector = ["left2right","right2left","up2down","down2up"]
    var chieu = "trai"
    var n: Int = 0
    let marigin: CGFloat = 70
    var lastOnLed = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        print("so phan tu cua mang member: \(vector.count)")
        
    
    }
    
    @IBAction func action_Drawball(sender: UIButton) {
        if txtF_number.text! .isEmpty   {
            print("nill")
        } else {
            if txtF_number.text! != "0" {
                n = Int(txtF_number.text!)!
                drawBalls()
            } else {
                print("This number not nill or 0")
            }
        }
    }
    
    @IBAction func action_RunningLed(sender: UIButton) {
        chieu = "trai"
        let timer1 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(runningLedToLeft), userInfo: nil, repeats: true)
    }
    
    @IBAction func action_RunRight(sender: UIButton) {
        chieu = "phai"
        lastOnLed = n - 1
        let timer2 = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(runningLedToRight), userInfo: nil, repeats: true)
    }
    
    
    func runningLedToLeft() {
        if chieu == "trai" {
        if lastOnLed != n - 1 {
            if lastOnLed != -1 {
                turnOffLed()
            }
            lastOnLed += 1
        } else {
            turnOffLed()
            lastOnLed = 0
        }
        turnOnLed()
        }
    }

    
    func runningLedToRight() {
        if chieu == "phai" {
            if lastOnLed != 0 {
                if lastOnLed != -1 {
                    turnOffLed()
                }
                lastOnLed -= 1
              } else {
                turnOffLed()
                lastOnLed = n - 1
            }
        turnOnLed()
        }
     }
    
    func runningLed() {
        chieu = "trai"
        if chieu == "trai"  {
            lastOnLed = -1
            if lastOnLed != n - 1 {
                if lastOnLed != -1 {
                    turnOffLed()
                }
                lastOnLed += 1
            } else {
                turnOffLed()
                lastOnLed = 0
            }
            turnOnLed()
        } else {
            chieu = "phai"
            if chieu == "phai" {
                lastOnLed = n - 1
                if lastOnLed != 0 {
                    if lastOnLed != -1 {
                        turnOffLed()
                    }
                    lastOnLed -= 1
                } else {
                    turnOffLed()
                    lastOnLed = n - 1
                }
                turnOnLed()
            }

        }

    }
    
    
    func turnOnLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed )
        as? UIImageView
        {
            ball.image = UIImage(named: "pokemonBall")
        }
    }
    
    func turnOffLed() {
        if let ball = self.view.viewWithTag(100 + lastOnLed )
            as? UIImageView
        {
            ball.image = UIImage(named: "pokemonDark")
        }

    }
    
    
    func drawBalls() {
        for indexRow in 0..<n {
            for indexColum in 0..<n {
                if indexRow != n {
                    
                    let image = UIImage(named: "pokemonBall")
                    let ball = UIImageView(image: image)
                    ball.center = CGPointMake(marigin + CGFloat(indexRow) * spaceRowBetweenBall(),CGFloat( indexColum) * spaceRowBetweenBall() + marigin)
                    ball.tag = indexRow + 100
                    self.view.addSubview(ball)
                    
                } else {
                    
                    let image = UIImage(named: "pokemonBall")
                    let ball = UIImageView(image: image)
                    ball.center = CGPointMake(self.view.bounds.size.width -  marigin , CGFloat( indexColum) * 50 + marigin)
                    //ball.tag = indexRow + 100
                    self.view.addSubview(ball)
                }

            }
            
        }
    }
    
    func spaceRowBetweenBall() -> CGFloat {
        let space  = (self.view.bounds.size.width - 2 * marigin) / CGFloat(n - 1)
        return space
    }
    
    func spaceColumBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.height - 2 * marigin) / CGFloat(n - 1)
        return space
    }

}