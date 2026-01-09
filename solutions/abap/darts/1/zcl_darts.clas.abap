CLASS zcl_darts DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        x             TYPE f
        y             TYPE f
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_darts IMPLEMENTATION.
  METHOD score.
    DATA(distance) = sqrt( ( x * x ) + ( y * y ) ).

    IF distance > 10.
      result = 0.
    ELSEIF distance > 5.
      result = 1.
    ELSEIF distance > 1.
      result = 5.
    ELSE.
      result = 10.
    ENDIF.
  ENDMETHOD.


ENDCLASS.
