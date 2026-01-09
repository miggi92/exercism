CLASS zcl_crypto_square DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS encode IMPORTING plain_text         TYPE string
                   RETURNING VALUE(crypto_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crypto_square IMPLEMENTATION.
  METHOD encode.   
    data(normalized_text) = to_lower( replace( val = plain_text sub = ` ` with = `` occ = 0 ) ).
    replace all occurences of regex '[^a-z0-9]' in normalized_text with ``.
    data(length) = strlen( normalized_text ).

    if length = 0.
      return.
    endif.

    data(c) = 1.
    data(r) = 1.

    WHILE r * c < length.
      IF c <= r.
        c = c + 1.
      ELSE.
        r = r + 1.
      ENDIF.
    ENDWHILE.


    DO c TIMES.
      DATA(current_column) = sy-index - 1.
      DO r TIMES.
        DATA(current_row) = sy-index - 1.
        DATA(pos) = ( current_row * c ) + current_column.
        IF pos < length.
          crypto_text = crypto_text && normalized_text+pos(1).
        ELSE.
          crypto_text = crypto_text && ` `.
        ENDIF.
      ENDDO.
      IF sy-index < c.
        crypto_text = crypto_text && ` `.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.