CLASS zcl_main_page DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES z2ui5_if_app.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_main_page IMPLEMENTATION.

  METHOD z2ui5_if_app~main.

    DATA(view) = z2ui5_cl_xml_view=>factory( ).
    DATA(object_page_layout) = view->object_page_layout( showtitleinheadercontent = 'Title' uppercaseanchorbar = abap_false ).
    DATA(sections) = object_page_layout->sections( ).

    " HEADER
    zcl_header_section=>get_section( CHANGING object_page_layout = object_page_layout ).

    " ABOUT
    zcl_about_section=>get_section( CHANGING sections = sections ).

    " TECHNOLOGIES
    zcl_technologies_section=>get_section( CHANGING sections = sections ).

    " EXPERIENCE
    zcl_experience_section=>get_section( CHANGING sections = sections ).

    client->view_display( view->stringify( ) ).

  ENDMETHOD.

ENDCLASS.