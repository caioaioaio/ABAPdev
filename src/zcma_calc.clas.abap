class ZCMA_CALC definition
  public
  final
  create public .

public section.

  types:
    TY_DEC(10) TYPE P DECIMALS 2 .
  types:
    ty_fib TYPE SORTED TABLE OF i WITH NON-UNIQUE KEY table_line .

  methods SUM
    importing
      !IM_VALUE1 type TY_DEC
      !IM_VALUE2 type TY_DEC
    returning
      value(RE_ANSWER) type TY_DEC .
  methods DIVIDE
    importing
      !IM_VALUE1 type TY_DEC
      !IM_VALUE2 type TY_DEC
    exporting
      !EX_MSG_ERR type STRING
    returning
      value(RE_ANSWER) type TY_DEC
    raising
      CX_SY_ZERODIVIDE .
  methods MULTIPLY
    importing
      !IM_VALUE1 type TY_DEC
      !IM_VALUE2 type TY_DEC
    returning
      value(RE_ANSWER) type TY_DEC .
  methods SUBTRACT
    importing
      !IM_VALUE1 type TY_DEC
      !IM_VALUE2 type TY_DEC
    returning
      value(RE_ANSWER) type TY_DEC .
  methods FIBONACCI_SEQ
    importing
      !IM_ELEMENTS_NO type I
    returning
      value(RE_SEQ) type STRING .
  methods FIBONACCI_SEQ_TABLE
    importing
      !IM_SEQ_NO type I
    returning
      value(RE_SEQ_TABLE) type TY_FIB .
  methods TEST .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCMA_CALC IMPLEMENTATION.


  METHOD divide.
    IF IM_VALUE2 = 0.
      RAISE EXCEPTION TYPE cx_sy_zerodivide
        EXPORTING
          textid    = CONV sotr_conc( '123' ).
      ELSE.
        re_answer = im_value1 / im_value2.
    ENDIF.
  ENDMETHOD.


  method FIBONACCI_SEQ.
    DATA(el_no) = IM_ELEMENTS_NO.
    DATA(tmp1) = 0.
    DATA(tmp2) = 1.
    DATA(result) = 0.
    el_no = el_no - 1.
    RE_SEQ = tmp2.
    WHILE el_no > 0.
      result = tmp1 + tmp2.
      RE_SEQ = RE_SEQ &&', ' && result.
      tmp1 = tmp2.
      tmp2 = result.
      el_no = el_no - 1.
    endwhile.
  endmethod.


  method FIBONACCI_SEQ_TABLE.
    DATA(value1) = 0.
    DATA(value2) = 1.
    DATA(sum) = 0.
    RE_SEQ_TABLE = VALUE #( ( 1 ) ).
    DO IM_SEQ_NO - 1 times.
      sum = value1 + value2.
      APPEND sum to RE_SEQ_TABLE.
      value1 = value2.
      value2 = sum.
    ENDDO.
  endmethod.


  METHOD multiply.
    re_answer = im_value1 * im_value2.
  ENDMETHOD.


  METHOD subtract.
    re_answer = im_value1 - im_value2.
  ENDMETHOD.


  METHOD sum.
    re_answer = im_value1 + im_value2.
  ENDMETHOD.


  method TEST.
    TRY .
      data(RESULT) = ME->divide(
        EXPORTING
          im_value1  = 3
          im_value2  = 0
      ).
      CATCH cx_sy_zerodivide INTO DATA(zerodivide). " System-Exception für Teilen durch Null.
        message  | Erro: { zerodivide->TEXTID } | TYPE 'E'.
    ENDTRY.
  endmethod.
ENDCLASS.
