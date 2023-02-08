page 50128 "Sales Order Temp Subform"
{
    Caption = 'Sales Order Temp Subform';
    PageType = ListPart;
    SourceTable = SalesOrdItemLine;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the  Type field.';
                }
                // field("Document Type"; Rec."Document Type")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Document Type field.';
                // }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the "Document No." field.';
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description. field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }
}
