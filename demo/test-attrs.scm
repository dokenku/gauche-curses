#!/usr/bin/env gosh
;; 
;; test-attrs.scm
;; 
;; Original 
;; 4.8 Attributes
;; http://gano.sourceforge.net/gucu.html#Attributes
;;

(add-load-path "../.")
(use curses)

;; A helper function that return the cursor's current row
(define (getrow win)
  (receive (row col) (getyx win)
    row))

(define (main args)
  ;; The program should be passed a filename from the command line
  (if (not (= 2 (length args)))
      (begin
        (format #t "Usage: ~a <scm file name>~%" (car args))
        (exit)))
  
  (let1 fport (open-input-file (cadr args))
    (wrapper
     (lambda (w)
       ;; Read one char at a time from the file
       (let loop ((ch (read-char fport)))
         (if (not (eof-object? ch))
             (begin
               (if (eqv? (getrow w) (- (lines) 1))
                   (begin
                     ;; Wait for a key press onece a page
                     ;; of text has been printed
                     (addstr w "<-Press any key->")
                     (refresh w)
                     (getch w)
                     (clear w)
                     (move w 0 0)))
               ;; Bold all text between a semicolon
               ;; and the end of a line
               (cond ((eqv? ch #\;)
                      (attron w A_BOLD))
                     ((eqv? ch #\nl)
                      (attroff w A_BOLD)))
               (addch w (x->integer ch))
               (refresh w)
               (loop (read-char fport)))
             ;; Clean up on exit
             (close-input-port fport)))))))