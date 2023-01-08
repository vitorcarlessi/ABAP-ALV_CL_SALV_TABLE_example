*======================================================================*
* Program.....: ZR_ALV_FACTORY                                         *
* Module......: ALL                                                    *
* Description.: ALV Factory - Basic Example                            *
*----------------------------------------------------------------------*
* Author......: Vitor Crepaldi Carlessi                                *
* Date........: 08.01.2023                                             *
*======================================================================*
REPORT zr_alv_factory.

INCLUDE zi_alv_factory_top.
INCLUDE zi_alv_factory_src.
INCLUDE zi_alv_factory_c01.
INCLUDE zi_alv_factory_f01.

START-OF-SELECTION.

  PERFORM: f_show_main_alv.