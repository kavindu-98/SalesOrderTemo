table 50120 "Sales Order Temp"
{
    Caption = 'Sales Order Temp';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "TempId"; Code[20])
        {
            Caption = 'TempId';
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
        field(4; "Posted No.Series"; Code[20])
        {
            Caption = 'Posted No.Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(5; "Your Reference"; Text[100])
        {
            Caption = 'Your Reference';
            DataClassification = ToBeClassified;

        }






    }

    keys
    {
        key(key01; TempId)
        {
            Clustered = true;
        }
    }



}

