CLASS zcl_main_page DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.
    DATA name TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_main_page IMPLEMENTATION.

  METHOD z2ui5_if_app~main.

    IF client->check_on_init( ).

      client->view_display( z2ui5_cl_xml_view=>factory(
        )->shell(
        )->page( title = 'abap2UI5 - Hello World 12312312'
        )->simple_form( editable = abap_true
            )->content( ns = `form`
                )->title( 'Make an input here and send it to the server...'
                )->label( 'Name'
                )->input( client->_bind_edit( name )
                )->button( text  = 'post'
                           press = client->_event( 'BUTTON_POST' )
        )->stringify( ) ).

    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->message_box_display( |Your name is { name }| ).
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.