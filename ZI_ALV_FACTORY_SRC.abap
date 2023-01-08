*======================================================================*
* Program.....: ZR_ALV_FACTORY                                         *
* Include.....: ZI_ALV_FACTORY_SRC                                     *
* Module......: ALL                                                    *
* Description.: ALV Factory - Basic Example                            *
*----------------------------------------------------------------------*
* Author......: Vitor Crepaldi Carlessi                                *
* Date........: 08.01.2023                                             *
*======================================================================*

SELECTION-SCREEN BEGIN OF BLOCK b01 WITH FRAME TITLE text-001.
PARAMETERS: p_kunnr TYPE kna1-kunnr OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b01.