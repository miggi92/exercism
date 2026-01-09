CLASS zcl_matrix DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS matrix_row
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
    METHODS matrix_column
      IMPORTING
        string        TYPE string
        index         TYPE i
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_matrix IMPLEMENTATION.
  METHOD matrix_row.
    DATA(clean_string) = string.
    
    REPLACE ALL OCCURRENCES OF `\n` IN clean_string WITH cl_abap_char_utilities=>newline.

    SPLIT clean_string AT cl_abap_char_utilities=>newline INTO TABLE DATA(rows).
    
    IF line_exists( rows[ index ] ).
      DATA(target_row) = rows[ index ].
      SPLIT target_row AT ` ` INTO TABLE DATA(number_strings).

      LOOP AT number_strings INTO DATA(s) WHERE table_line IS NOT INITIAL.
        APPEND CONV i( s ) TO result.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD matrix_column.
    DATA(clean_string) = string.
    REPLACE ALL OCCURRENCES OF `\n` IN clean_string WITH cl_abap_char_utilities=>newline.
    
    SPLIT clean_string AT cl_abap_char_utilities=>newline INTO TABLE DATA(rows).

    LOOP AT rows INTO DATA(row).
      SPLIT row AT ` ` INTO TABLE DATA(numbers).
      
      IF line_exists( numbers[ index ] ).
        APPEND CONV i( numbers[ index ] ) TO result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
