CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
    data(max_length) = strlen( input ).
    data offset type i value 0.

    do max_length times.
      data(char) = to_lower( input+offset(1) ).

      if char CA 'aeioulnrst'.
        result = result + 1.
      elseif char CA 'dg'.
        result = result + 2.
      elseif char CA 'bcmp'.
        result = result + 3.
      elseif char CA 'fhvwy'.
        result = result + 4.
      elseif char CA 'k'.
        result = result + 5.
      elseif char CA 'jx'.
        result = result + 8.
      elseif char CA 'qz'.
        result = result + 10.
      endif.
      offset = offset + 1.
    enddo.
  ENDMETHOD.

ENDCLASS.
