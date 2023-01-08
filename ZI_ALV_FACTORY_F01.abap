*======================================================================*
* Program.....: ZR_ALV_FACTORY                                         *
* Include.....: ZI_ALV_FACTORY_F01                                     *
* Module......: ALL                                                    *
* Description.: ALV Factory - Basic Example                            *
*----------------------------------------------------------------------*
* Author......: Vitor Crepaldi Carlessi                                *
* Date........: 08.01.2023                                             *
*======================================================================*

FORM f_show_main_alv.

*&---------------------------------------------------------------------*
*& Objects                                                             *
*&---------------------------------------------------------------------*
  DATA: lo_table         TYPE REF TO cl_salv_table,
        lo_columns_table TYPE REF TO cl_salv_columns_table,
        lo_column_table  TYPE REF TO cl_salv_column_table,
        lo_events_table  TYPE REF TO cl_salv_events_table,
        lo_column        TYPE REF TO cl_salv_column,
        lo_sorts         TYPE REF TO cl_salv_sorts,
        lo_functions     TYPE REF TO cl_salv_functions,
        lo_handle_event  TYPE REF TO lcl_handle_events.

*&---------------------------------------------------------------------*
*& Field-Symbols                                                       *
*&---------------------------------------------------------------------*
  FIELD-SYMBOLS: <fs_output> LIKE LINE OF gt_output.

  "Select -> General Data in Customer Master
  SELECT *
  FROM kna1
  INTO CORRESPONDING FIELDS OF TABLE gt_output
  WHERE kunnr = p_kunnr ##TOO_MANY_ITAB_FIELDS.

  "Put Green Light Icon
  LOOP AT gt_output ASSIGNING <fs_output>.
    <fs_output>-icon = icon_green_light.
  ENDLOOP.

  TRY.
      "ALV: Classe de erro geral com mensagem
      CALL METHOD cl_salv_table=>factory
        IMPORTING
          r_salv_table = lo_table
        CHANGING
          t_table      = gt_output.

    CATCH cx_salv_msg.
      RETURN.
  ENDTRY.

  "ALV Sorts
  lo_sorts = lo_table->get_sorts( ).

  TRY.
      lo_sorts->add_sort( columnname = 'KUNNR'  sequence = if_salv_c_sort=>sort_up ).

    CATCH cx_salv_not_found
          cx_salv_data_error
          cx_salv_existing.
      RETURN.

  ENDTRY.

  "ALV Columns
  lo_columns_table = lo_table->get_columns( ).
  lo_columns_table->set_optimize( abap_true ).

  TRY.

      "Hide Column MANDT
      lo_column = lo_columns_table->get_column( 'MANDT' ).
      lo_column->set_visible( value  = if_salv_c_bool_sap=>false ).

      "Put Name on ICON Column
      lo_column = lo_columns_table->get_column( 'ICON' ).
      lo_column->set_alignment( if_salv_c_alignment=>centered ).
      lo_column->set_long_text(   text-t03 ).
      lo_column->set_medium_text( text-t03 ).
      lo_column->set_short_text(  text-t03 ).

    CATCH cx_salv_not_found.
      RETURN.
  ENDTRY.

  "ALV Functions
  lo_functions = lo_table->get_functions( ).
  lo_functions->set_all( abap_true ).

  lo_events_table = lo_table->get_event( ).
  CREATE OBJECT lo_handle_event.
  SET HANDLER lo_handle_event->on_link_click FOR lo_events_table.

  TRY.
      lo_column_table ?= lo_columns_table->get_column( 'NAME1' ).
    CATCH cx_salv_not_found.
      RETURN.
  ENDTRY.

  lo_column_table->set_cell_type( if_salv_c_cell_type=>hotspot ).

  lo_table->display( ).

ENDFORM.