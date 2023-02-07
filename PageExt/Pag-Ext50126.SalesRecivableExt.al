pageextension 50126 "Sales&RecivableExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Document Default Line Type")
        {
            field("Enable Template"; Rec."Enable Template")
            {
                ApplicationArea = all;
            }
        }
    }
}
