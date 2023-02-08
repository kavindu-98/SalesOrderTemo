page 50113 "Sales Ordr Temp card"
{
    Caption = 'Sales Ordr Temp card';
    PageType = Card;
    SourceTable = "Sales Order Temp";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.TempId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Posted No.Series"; Rec."Posted No.Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted No.Series field.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Your Reference field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No field.';
                    TableRelation = Customer;

                }

            }
            part(SalesOrdItemLine; "Sales Order Temp Subform")
            {
                SubPageLink = TempId = field(TempId);
                ApplicationArea = All;
                // Editable = false;

            }
        }
    }
}
