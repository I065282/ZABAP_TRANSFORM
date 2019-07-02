class ZABAP_TRANS_CL definition
  public
  final
  create public .

public section.

  types:
    BEGIN OF ty_split_str,
          split TYPE zabap_trans_de,
         END OF ty_split_str .
  types:
    ty_split_tab TYPE STANDARD TABLE OF ty_split_str INITIAL SIZE 0 .

  class-methods SPLIT_STRING
    importing
      !IN_STR type ZABAP_TRANS_DE
      !IN_SPLITTER type CHAR1
    exporting
      !EX_OUT type TY_SPLIT_TAB .
protected section.
private section.
ENDCLASS.



CLASS ZABAP_TRANS_CL IMPLEMENTATION.


  METHOD split_string.

    DATA: ls_out   TYPE ty_split_str,
          lv_split TYPE zabap_trans_de.

    IF in_str IS NOT INITIAL.
      lv_split = in_str.
      DO.
        SPLIT lv_split AT in_splitter INTO ls_out-split lv_split.
        APPEND ls_out TO ex_out.
        IF lv_split IS INITIAL.
          EXIT.
        ENDIF.
      ENDDO.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
