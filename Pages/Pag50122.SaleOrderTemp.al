page 50122 "Sale Order Temp List"
{
    ApplicationArea = All;
    Caption = 'Select a template for a new Sales Order';
    PageType = List;
    SourceTable = "Sales Order Temp";
    UsageCategory = Lists;
    CardPageId = "Sales Ordr Temp card";

    layout
    {
        area(content)
        {
            repeater(General)
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
            }
        }
    }
}
