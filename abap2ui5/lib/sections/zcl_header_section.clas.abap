CLASS zcl_header_section DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: get_section
      CHANGING
        object_page_layout TYPE REF TO z2ui5_cl_xml_view.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_header_section IMPLEMENTATION.

  METHOD get_section.

    DATA(name) = zcl_info=>get_name( ).
    DATA(role) = zcl_info=>get_role( ).
    DATA(about) = zcl_info=>get_role( ).
    DATA(location) = zcl_info=>get_location( ).
    DATA(description) = zcl_info=>get_description( ).
    DATA(social)   = zcl_info=>get_social( ).
    " DATA(image_url)    = 'https://bazhukovtima.github.io/timofei-bazhukov-portfolio/profile-no-bg.png'.
    DATA(image_url)    = 'https://sapui5.hana.ondemand.com/test-resources/sap/uxap/images/imageID_275314.png'.

    DATA(header_title) = object_page_layout->header_title( )->object_page_dyn_header_title( ).

    header_title->expanded_heading( )->title( text = name wrapping = abap_true ).
    header_title->snapped_heading( )->hbox(
            )->vbox(
                )->avatar( src   = image_url
                           class = `sapUiSmallMarginEnd`
            )->vbox(
                )->title( text     = name
                          wrapping = abap_true
                )->label( text = role ).

    header_title->expanded_content( ns = `uxap` )->label( text = role ).
    header_title->snapped_title_on_mobile( )->title( text = name ).

    DATA(header_content) = object_page_layout->header_content( ns = 'uxap'
        )->header_container_control( id           = `headerContainer`
                                     scrollstep   = `200`
                                     showdividers = abap_false ).

    header_content->hbox( class = `sapUiSmallMarginEnd sapUiSmallMarginBottom`
        )->avatar( src         = image_url
                   class       = `sapUiMediumMarginEnd sapUiSmallMarginBottom`
                   displaysize = `L`
        )->vbox( class = `sapUiSmallMarginEnd sapUiSmallMarginBottom`
        )->title( text  = name
                  class = `sapUiTinyMarginBottom`
        )->hbox( class = `sapUiTinyMarginBottom`
            )->icon( src = `sap-icon://suitcase`
            )->text( text  = role " role
                     class = `sapUiSmallMarginBegin`
            )->get_parent(
        )->hbox( class = `sapUiTinyMarginBottom`
            )->icon( src = `sap-icon://map`
            )->text( text  = location " location
                     class = `sapUiSmallMarginBegin`
            )->get_parent(
        )->hbox( class = `sapUiTinyMarginBottom`
            )->icon( src = `sap-icon://hint`
            )->text( text  = description
                     class = `sapUiSmallMarginBegin`
            )->get_parent(
        )->hbox( class = `sapUiSmallMarginEnd sapUiSmallMarginBottom`
            )->icon( src = `sap-icon://chain-link`
            )->link( text  = `LinkedIn`
                      href  = social[ 1 ]
                      class = `sapUiSmallMarginBegin`
            )->link( text  = `Facebook`
                      href  = social[ 2 ]
                      class = `sapUiSmallMarginBegin`
            )->link( text  = `GitHub`
                      href  = social[ 3 ]
                      class = `sapUiSmallMarginBegin`
            )->link( text  = `Email`
                      href  = social[ 4 ]
                      class = `sapUiSmallMarginBegin`
          )->get_parent(
        )->get_parent(
      )->get_parent(
    ).

  ENDMETHOD.

ENDCLASS.