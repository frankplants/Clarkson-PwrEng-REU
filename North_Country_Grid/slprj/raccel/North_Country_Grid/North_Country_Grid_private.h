#ifndef North_Country_Grid_private_h_
#define North_Country_Grid_private_h_
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "North_Country_Grid.h"
#include "North_Country_Grid_types.h"
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#if !defined(rt_VALIDATE_MEMORY)
#define rt_VALIDATE_MEMORY(S, ptr)     if(!(ptr)) {\
    ssSetErrorStatus(rtS, RT_MEMORY_ALLOCATION_ERROR);\
    }
#endif
#if !defined(rt_FREE)
#if !defined(_WIN32)
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((ptr));\
    (ptr) = (NULL);\
    }
#else
#define rt_FREE(ptr)     if((ptr) != (NULL)) {\
    free((void *)(ptr));\
    (ptr) = (NULL);\
    }
#endif
#endif
#ifndef CodeFormat
#define CodeFormat   S-Function
#else
#undef CodeFormat
#define CodeFormat   S-Function
#endif
#ifndef S_FUNCTION_NAME
#define S_FUNCTION_NAME   simulink_only_sfcn
#else
#undef S_FUNCTION_NAME
#define S_FUNCTION_NAME   simulink_only_sfcn
#endif
#ifndef S_FUNCTION_LEVEL
#define S_FUNCTION_LEVEL  2
#else
#undef S_FUNCTION_LEVEL
#define S_FUNCTION_LEVEL  2
#endif
#ifndef RTW_GENERATED_S_FUNCTION
#define RTW_GENERATED_S_FUNCTION
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm)        NULL
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val)
#endif
#if !defined(RTW_SFUNCTION_DEFINES)
#define RTW_SFUNCTION_DEFINES
#ifndef _RTW_COMMON_DEFINES_
#define _RTW_COMMON_DEFINES_
#endif
#endif
#define MAX_DELAY_BUFFER_SIZE      32768
extern void rt_invd5x5_snf ( const real_T u [ 25 ] , real_T y [ 25 ] ) ;
extern void rt_invd4x4_snf ( const real_T u [ 16 ] , real_T y [ 16 ] ) ;
extern real_T look1_pbinlxpw ( real_T u0 , const real_T bp0 [ ] , const
real_T table [ ] , uint32_T prevIndex [ ] , uint32_T maxIndex ) ; extern void
sfun_discreteVariableDelay ( SimStruct * rts ) ; extern void l304fjo1ck ( SimStruct * rtS_p , boolean_T mgp5ory2pc , const real_T nx5pfjg1wd [ 3 ] , real_T ccscmo0wi4 , ijaorloh2n * localB , csd15ugbr4 * localDW , jai42d520d * localP ) ; extern void ohgj15uyzp ( SimStruct * rtS_e , boolean_T em3th1eokc , const real_T pqqainhah0 [ 3 ] , real_T ibbcjryxgs , e5jjdo4sv3 * localB , bbqf4x30cj * localDW , hkqlp2oxih * localP ) ; extern void njarp5dx45 ( b3vtzla2ll * localB , dwgpjr3dqb * localP ) ; extern void pc2kitf3nf ( SimStruct * rtS_m , uint8_T hiu3hpxfpm , real_T obynhffixz , real_T jggtcvsuxy , real_T nh0wd5wlre , b3vtzla2ll * localB , apqzhlyo53 * localDW ) ; extern void hlzystf2rc ( htmljnlhbi * localB , hrcms2uovt * localP ) ; extern void lagyqiefd4 ( SimStruct * rtS_e , uint8_T jrkpawnfrx , real_T cvltha1f5w , real_T oayfywo4yi , real_T almyr2v32l , htmljnlhbi * localB , dtpnagdk1n * localDW ) ; extern void c4w3dqnrun ( krhaiu31zz * localB , hcw1twjf14 * localP ) ; extern void bqser4xpo5 ( SimStruct * rtS_p , uint8_T fty3pjzapt , const real_T krowstwqsg [ 2 ] , real_T hf4vllu3gw , krhaiu31zz * localB , ent1lhpzg0 * localDW ) ; extern void gmkwzzmfjn ( ahpr1pxfpk * localB , fqpfhm2tts * localP ) ; extern void gga0brwidg ( SimStruct * rtS_f , uint8_T fjpklommdk , const real_T lxdqgh5jey [ 2 ] , real_T db55cd01fv , ahpr1pxfpk * localB , lv5jxhemip * localDW ) ; extern void o3adjopwis ( jlvrjack3p * localDW , pbhj2colmp * localP ) ; extern void ofnva2v0ch ( SimStruct * rtS_k , real_T eer3riwz5t , fsucqu4pkr * localB , jlvrjack3p * localDW , pbhj2colmp * localP ) ; extern void pltijtqqoz ( SimStruct * rtS_c , real_T eer3riwz5t , const real_T dfueeqgvzv [ 5 ] , fsucqu4pkr * localB , jlvrjack3p * localDW , pbhj2colmp * localP ) ; extern void cnzy0n4dzi ( odaaznuja5 * localDW , p0r5fbsxha * localP ) ; extern void htlzhevetn ( SimStruct * rtS_c , real_T a2vrcfjsjt , d5lqeexg5a * localB , odaaznuja5 * localDW , p0r5fbsxha * localP ) ; extern void mkqbfbrfty ( SimStruct * rtS_p , real_T a2vrcfjsjt , const real_T dsdon3qr4o [ 5 ] , d5lqeexg5a * localB , odaaznuja5 * localDW , p0r5fbsxha * localP ) ;
#if defined(MULTITASKING)
#error Models using the variable step solvers cannot define MULTITASKING
#endif
#endif
