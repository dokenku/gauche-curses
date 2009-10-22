/*
 * curses.c
 *
 * 2009.10.22 by ken kudo
 */

#include "curses.h"

SCM_DEFINE_BUILTIN_CLASS_SIMPLE(Scm_CursWindowClass, NULL);

ScmObj Scm_MakeCursWindow(WINDOW *win)
{
    ScmCursWindow *w = SCM_NEW(ScmCursWindow);
    SCM_SET_CLASS(w, SCM_CLASS_CURS_WINDOW);
    w->w = win;
    return SCM_OBJ(w);
}

/*
 * Module initialization function.
 */
extern void Scm_Init_curseslib(ScmModule*);

void Scm_Init_curses(void)
{
    ScmModule *mod;

    /* Register this DSO to Gauche */
    SCM_INIT_EXTENSION(curses);

    /* Create the module if it doesn't exist yet. */
    mod = SCM_MODULE(SCM_FIND_MODULE("curses", TRUE));
	
	Scm_InitBuiltinClass(&Scm_CursWindowClass, "<curs-window>",
						 NULL, sizeof(ScmCursWindow), mod);

    // Scm_InitStaticClass(&Scm_CursWindowClass, "<curs-window>", mod, NULL, 0);
    /* Register stub-generated procedures */
    Scm_Init_curseslib(mod);
}
