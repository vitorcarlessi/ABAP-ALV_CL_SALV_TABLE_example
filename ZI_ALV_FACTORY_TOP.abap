*======================================================================*
* Program.....: ZR_ALV_FACTORY                                         *
* Include.....: ZI_ALV_FACTORY_TOP                                     *
* Module......: ALL                                                    *
* Description.: ALV Factory - Basic Example                            *
*----------------------------------------------------------------------*
* Author......: Vitor Crepaldi Carlessi                                *
* Date........: 08.01.2023                                             *
*======================================================================*

TYPES: BEGIN OF ty_output,
         icon TYPE icon_d.
        INCLUDE TYPE kna1.
TYPES:  END OF ty_output.

DATA: gt_output TYPE STANDARD TABLE OF ty_output.

FIELD-SYMBOLS: <fs_output> LIKE LINE OF gt_output.