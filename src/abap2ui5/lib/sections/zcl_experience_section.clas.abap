CLASS zcl_experience_section DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS: get_section
      CHANGING
        sections TYPE REF TO z2ui5_cl_xml_view.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_experience_section IMPLEMENTATION.

  METHOD get_section.
    
    " EXPERIENCE
    DATA(experience) = zcl_info=>get_experience( ).
    DATA(experience_header) = zcl_info=>get_experience_h( ).
    DATA(exp_section_blocks) = sections->object_page_section( 
                                  id             = 'experienceSection'
                                  importance     = 'Medium'
                                  title          = 'Experience'
                                  titleuppercase = abap_false
        )->sub_sections(
            )->object_page_sub_section( id = 'experienceSectionSub1'
                )->text( id = 'id_experience_header' width = '100%' text = experience_header class = 'sapUiResponsiveMargin sapUiContentPadding'
                )->get_parent(
            )->object_page_sub_section( id             = 'experienceSectionSub2'
                                        showtitle      = abap_false
                                        titlevisible   = abap_false
                )->blocks(
    ).

    LOOP AT experience ASSIGNING FIELD-SYMBOL(<experience>).
      exp_section_blocks = exp_section_blocks->vbox(
          id = |id_exp_{ sy-tabix }| 
          class = 'sapUiMediumMarginBottom sapUiContentPadding sapUiHcBorder'
        )->hbox(
          class = 'sapUiTinyMarginBottom sapUiSmallMargin'
        )->title(
          text  = <experience>-title
          wrapping = abap_true
          class = 'sapUiTitle sapUiTinyMarginBottom sapMPanelHdr'
        )->get_parent(
        )->hbox(
          class = 'sapUiTinyMarginBottom sapUiSmallMargin'
        )->text(
          text  = |{ <experience>-role } @ { <experience>-company }|
          class = 'sapUiSmallMarginBegin sapUiBoldText sapUiTinyMarginBottom'
        )->get_parent(
        )->hbox(
          class = 'sapUiTinyMarginBottom'
        )->icon(
          src = 'sap-icon://calendar'
          class = 'sapUiSmallMarginBegin'
        )->text(
          text  = <experience>-period
          class = 'sapUiSmallMarginBegin sapUiTinyMarginBottom sapUiContentLabel'
        )->get_parent(
        )->hbox(
          class = 'sapUiTinyMarginBottom'
        )->icon(
          src = 'sap-icon://notes'
          class = 'sapUiSmallMarginBegin'
        )->text(
          text  = <experience>-details
          class = 'sapUiSmallMarginBegin sapUiTinyMarginBottom sapUiContentText'
        )->get_parent(
        )->hbox(
          class = 'sapUiTinyMarginBottom'
        )->icon(
          src = 'sap-icon://technical-object'
          class = 'sapUiSmallMarginBegin'
        )->text(
          text  = <experience>-technologies
          class = 'sapUiSmallMarginBegin sapUiTinyMarginBottom sapUiContentLabel'
        )->get_parent(
      )->get_parent( ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.