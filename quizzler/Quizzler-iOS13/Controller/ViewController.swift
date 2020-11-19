//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Muhammad Luthfi Farizqi on 18/11/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quizLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuiz()
    }

    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!//True False
        let actualAnswer = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if  actualAnswer{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
         quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuiz), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuiz(){
        quizLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
  }
    
}










//catatan
//view = untuk mengatur tampilan || contoh  si user menjawab pertanyaan si aplikasi misalnya True,lalu si view mendapat jawaban dari controller,maka si view memberi respon tombol berwarna hijau
//controller = Tugas: Penjembatan antara view dan model || Jawaban tadi dikirim ke controller,oke saya sudah dapat respon dari model,dan saya kirim ke view
//Model = Mengelola data / Otak Aplikasi || controller nyuruh model coba priksa jawaban sesuai ga sama kunci jawaban,kalo sesuai kirim lagi ke saya
