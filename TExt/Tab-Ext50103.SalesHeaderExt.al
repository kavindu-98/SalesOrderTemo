tableextension 50103 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50100; NotRefreshed; Boolean)
        {
            Caption = 'Refreshed';
            DataClassification = ToBeClassified;
        }
    }
}
