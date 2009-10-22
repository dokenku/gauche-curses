;;;
;;; curses
;;;
;;; 2009.10.22 by ken kudo
;;;

(define-module curses
  (export <curs-window>
          initscr endwin cols lines
          newwin delwin mvwin
          getyx getbegyx getmaxyx		  
          cbreak echo  nodelay keypad timeout
          erase clear clrtobot clrtoeol
          refresh
          deleteln insdelln insertln
          move
          printw
          addch
          addstr addnstr
          border box hline vline
          getch key-f
          KEY_DOWN KEY_UP KEY_LEFT KEY_RIGHT KEY_BACKSPACE KEY_ENTER
          acs-block acs-board acs-btee acs-bullet acs-ckboard acs-darrow acs-degree acs-diamond acs-gequal acs-hline
          acs-lantern acs-larrow acs-lequal acs-lrcorner acs-ltee acs-nequal acs-pi acs-plminus acs-plus acs-rarrow
          acs-rtee acs-s1 acs-s3 acs-s7 acs-s9 acs-sterling acs-ttee acs-uarrow acs-ulcorner acs-urcorner acs-vline
          getstr
          delch
          insch
          color-pair start-color init-pair init-color has-colors? can-change-color? color-content pair-content
          COLORS COLOR_PAIRS
          COLOR_BLACK COLOR_RED COLOR_GREEN COLOR_YELLOW COLOR_BLUE COLOR_MAGENTA COLOR_CYAN COLOR_WHITE
          attroff attron attrset
          A_NORMAL A_STANDOUT A_UNDERLINE A_REVERSE A_BLINK A_DIM A_BOLD A_PROTECT A_INVIS A_ALTCHARSET A_CHARTEXT
          bkgdset bkgd getbkgd
          wrapper
          ))
(select-module curses)

;; Loads extension
(dynamic-load "curses")

(define (wrapper proc)
  (let ((stdscr (initscr)))
    (begin
      (echo #f)
      (cbreak #t)
      (keypad stdscr #t)
       
      (if (has-colors?)
          (start-color))

      (proc stdscr)
	
      (echo #t)
      (cbreak #f)
      (endwin))))

;; Epilogue
(provide "curses")


