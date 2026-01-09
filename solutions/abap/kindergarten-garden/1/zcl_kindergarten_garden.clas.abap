CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.


  METHOD plants.
    students = VALUE string_table( 
      ( `Alice` ) ( `Bob` ) ( `Charlie` ) ( `David` ) 
      ( `Eve` ) ( `Fred` ) ( `Ginny` ) ( `Harriet` ) 
      ( `Ileana` ) ( `Joseph` ) ( `Kincaid` ) ( `Larry` ) 
    ).
    sort students ascending. 
    
    split diagram at '\n' into table data(rows).
    data(student_index) = line_index( students[ table_line = student ] ) - 1.

    loop at rows assigning field-symbol(<row>).
      data(offset) = 0.
      data(length) = strlen( <row> ).
      offset = student_index * 2.
      
      do 2 times.
        data(char) = <row>+offset(1).

        APPEND SWITCH #( char
        WHEN 'G' THEN `grass`
        WHEN 'C' THEN `clover`
        WHEN 'R' THEN `radishes`
        WHEN 'V' THEN `violets` ) TO results.

        offset = offset + 1.
      enddo.
    endloop.
  ENDMETHOD.


ENDCLASS.
