;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname inLab) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;Now, create the following functions:


;makeMove - take a game board, a source tower number, and a destination tower number and attempts to make a move, only if the move was legal (the disk you are pushing onto a tower is smaller than the disk currently at the top of the tower).  If the move is not legal, it should boil down to false, otherwise it should return the modified game board.

;isWinner - takes a game board and returns true if all 3 disks are in the last tower, and false otherwise.



(define initGame  
  (lambda (gamestate)
     gamestate))

(define towerOne
  (lambda (gamestate)
    (car gamestate)))

(define towerTwo
  (lambda (gamestate)
    (cadr gamestate)))

(define towerThree
  (lambda (gamestate)
    (caddr gamestate)))

(define checkLegitness
  (lambda (top1 top2)
    (cond
      ((eq? top2 '()) #true)
      ((> (car top1) (car top2)) #true)
      (else #false))))

(define isWinner
  (lambda (gamestate)
    (if (and(null? (towerOne gamestate)) (null? (towerTwo gamestate)))
        #true
        #false)))

(define makeMove
  (lambda (gamestate source dest)
    (cond
      ((eq? source 1)
       (if (eq? dest 2)
           (if (checkLegitness(towerOne gamestate) (towerTwo gamestate))
               (append(cons(cdr (towerOne gamestate)) (list(append (list(car (towerOne gamestate))) (towerTwo gamestate)))) (list(towerThree gamestate)))
               #false)
           (if (checkLegitness(towerOne gamestate) (towerThree gamestate))
               (append(cons(cdr (towerOne gamestate)) (list(towerTwo gamestate))) (append (list(car (towerOne gamestate))) (towerThree gamestate)))
               #false)))
      ((eq? source 2)
       (if (eq? dest 1)
           (if (checkLegitness(towerTwo gamestate) (towerOne gamestate))
               (append(cons(append (list(car(towerTwo gamestate))) (list (towerOne gamestate))) (cdr(towerTwo gamestate))) (list(towerThree gamestate)))
               #false)
           (if (checkLegitness(towerTwo gamestate) (towerThree gamestate))
               (append(cons(towerOne gamestate) (cdr(towerTwo gamestate))) (append (list(car (towerTwo gamestate))) (towerThree gamestate)))
               #false)))
      ((eq? source 3)
       (if (eq? dest 1)
          (if (checkLegitness(towerThree gamestate) (towerOne gamestate))
              (append(cons(append (list(car(towerThree gamestate))) (list (towerOne gamestate))) (list(towerTwo gamestate))) (cdr(towerThree gamestate)))
              #false)
          (if (checkLegitness(towerThree gamestate) (towerTwo gamestate))             
               (append(cons(towerOne gamestate) (list(append (list(car(towerThree gamestate))) (towerTwo gamestate)))) (cdr(towerThree gamestate)))
               #false))))))


(define beginning(initGame '((1 2 3) () ())))
beginning
(define game(makeMove beginning 1 3))
game
(define game1(makeMove game 1 2))
game1

  
  




     