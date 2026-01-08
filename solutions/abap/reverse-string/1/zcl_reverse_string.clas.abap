CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
    Data: length type i,
          offset type i.
    length = strlen( input ).

    offset = length - 1.
    do length times.
      result = result && input+offset(1).
      offset = offset - 1.
    enddo.
  ENDMETHOD.

ENDCLASS.
