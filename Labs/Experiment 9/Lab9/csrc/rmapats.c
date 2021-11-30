// file = 0; split type = patterns; threshold = 100000; total count = 0.
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include "rmapats.h"

void  hsG_0__0 (struct dummyq_struct * I1255, EBLK  * I1249, U  I675);
void  hsG_0__0 (struct dummyq_struct * I1255, EBLK  * I1249, U  I675)
{
    U  I1510;
    U  I1511;
    U  I1512;
    struct futq * I1513;
    struct dummyq_struct * pQ = I1255;
    I1510 = ((U )vcs_clocks) + I675;
    I1512 = I1510 & ((1 << fHashTableSize) - 1);
    I1249->I717 = (EBLK  *)(-1);
    I1249->I721 = I1510;
    if (I1510 < (U )vcs_clocks) {
        I1511 = ((U  *)&vcs_clocks)[1];
        sched_millenium(pQ, I1249, I1511 + 1, I1510);
    }
    else if ((peblkFutQ1Head != ((void *)0)) && (I675 == 1)) {
        I1249->I723 = (struct eblk *)peblkFutQ1Tail;
        peblkFutQ1Tail->I717 = I1249;
        peblkFutQ1Tail = I1249;
    }
    else if ((I1513 = pQ->I1155[I1512].I735)) {
        I1249->I723 = (struct eblk *)I1513->I734;
        I1513->I734->I717 = (RP )I1249;
        I1513->I734 = (RmaEblk  *)I1249;
    }
    else {
        sched_hsopt(pQ, I1249, I1510);
    }
}
#ifdef __cplusplus
extern "C" {
#endif
void SinitHsimPats(void);
#ifdef __cplusplus
}
#endif
