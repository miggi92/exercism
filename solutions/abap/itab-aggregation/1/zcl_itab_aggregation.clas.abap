CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    " add solution here
    loop at initial_numbers assigning field-symbol(<initial_number>).
      if line_exists( aggregated_data[ group = <initial_number>-group ] ).
        assign aggregated_data[ group = <initial_number>-group ] to field-symbol(<existing_data>).
        <existing_data>-count = <existing_data>-count + 1.
        <existing_data>-sum   = <existing_data>-sum + <initial_number>-number.
        if <existing_data>-min > <initial_number>-number.
          <existing_data>-min   = <initial_number>-number.
        endif.
        if <existing_data>-max < <initial_number>-number.
          <existing_data>-max   = <initial_number>-number.
        endif.
        <existing_data>-average = <existing_data>-sum / <existing_data>-count.
      else.
        append value #( group   = <initial_number>-group 
                        count   = 1 
                        sum     = <initial_number>-number 
                        min     = <initial_number>-number
                        average = <initial_number>-number
                        max     = <initial_number>-number ) to aggregated_data.
      endif.
    endloop.
  ENDMETHOD.

ENDCLASS.
