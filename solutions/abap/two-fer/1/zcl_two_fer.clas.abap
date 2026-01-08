CLASS zcl_two_fer DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS two_fer
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_two_fer IMPLEMENTATION.

  METHOD two_fer.
    DATA to_who TYPE string.

    IF input IS INITIAL.
      to_who = `you`.
    ELSE.
      to_who = input.
    ENDIF.
    result = |One for { to_who }, one for me.|.
  ENDMETHOD.

ENDCLASS.
