/*
 * curses.h
 *
 * 2009.10.22 by ken kudo
 *
 */

/* Prologue */
#ifndef GAUCHE_GAUCHE_CURSES_H
#define GAUCHE_GAUCHE_CURSES_H

#include <ncurses.h>
#include <gauche.h>
#include <gauche/extend.h>

SCM_DECL_BEGIN

typedef struct ScmCursWindowRec {
  SCM_HEADER;
  WINDOW *w;
} ScmCursWindow;

SCM_CLASS_DECL(Scm_CursWindowClass);
#define SCM_CLASS_CURS_WINDOW      (&Scm_CursWindowClass)
#define SCM_CURS_WINDOW(obj)       ((ScmCursWindow*)obj)
#define SCM_CURS_WINDOW_P(obj)     (SCM_XTYPEP(obj, SCM_CLASS_CURS_WINDOW))
#define SCM_CURS_WINDOW_UNBOX(obj) SCM_FOREIGN_POINTER_REF(WINDOW *, obj)
#define SCM_CURS_WINDOW_BOX(ctx)   Scm_MakeForeignPointer(ScmCursWindow, ctx)

extern ScmObj Scm_MakeCursWindow(WINDOW *win);

/* Epilogue */
SCM_DECL_END

#endif  /* GAUCHE_GAUCHE_CURSES_H */
