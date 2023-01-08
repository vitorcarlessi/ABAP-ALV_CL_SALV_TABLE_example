*======================================================================*
* Program.....: ZR_ALV_FACTORY                                         *
* Include.....: ZI_ALV_FACTORY_C01                                     *
* Module......: ALL                                                    *
* Description.: ALV Factory - Basic Example                            *
*----------------------------------------------------------------------*
* Author......: Vitor Crepaldi Carlessi                                *
* Date........: 08.01.2023                                             *
*======================================================================*

CLASS lcl_handle_events DEFINITION FINAL.
  PUBLIC SECTION.

    METHODS: on_link_click FOR EVENT link_click OF cl_salv_events_table
      IMPORTING row column.

ENDCLASS.

CLASS lcl_handle_events IMPLEMENTATION.

  METHOD on_link_click.

    READ TABLE gt_output ASSIGNING <fs_output> INDEX row.

    IF sy-subrc IS INITIAL.

      CASE column.
        WHEN 'NAME1'.

          SET PARAMETER ID 'KUN' FIELD p_kunnr.
          CALL TRANSACTION 'XD03' AND SKIP FIRST SCREEN.

      ENDCASE.

    ENDIF.

  ENDMETHOD.

ENDCLASS.