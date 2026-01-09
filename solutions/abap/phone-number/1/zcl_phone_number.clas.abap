CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS clean
      IMPORTING
        !number       TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_phone_number IMPLEMENTATION.

  METHOD clean.
    DATA(digits) = number.

    REPLACE ALL OCCURRENCES OF REGEX '[^0-9]' IN digits WITH ``.

    data(length) = strlen( digits ).

    IF length < 10.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    elseif length = 11.
      IF digits(1) <> '1'.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.
      digits = substring( val = digits off = 1 ).
    ELSEIF length > 11.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    
    IF digits(1) = '0' OR digits(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF digits+3(1) = '0' OR digits+3(1) = '1'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    result = digits.
  ENDMETHOD.
ENDCLASS.
