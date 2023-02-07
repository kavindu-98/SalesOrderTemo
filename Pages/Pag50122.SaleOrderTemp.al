page 50122 "Sale Order Temp List"
{
    ApplicationArea = All;
    Caption = 'Sale Order Temp List';
    PageType = List;
    SourceTable = "Sales Order Temp";
    UsageCategory = Lists;

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
