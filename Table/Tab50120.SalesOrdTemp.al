table 50120 "Sales Order Temp"
{
    Caption = 'Sales Order Temp';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "TempId"; Code[20])
        {
            Caption = 'TempId';
            DataClassification = ToBeClassified
        }
        field(2; "SalesOdNo"; Text[100])
        {
            Caption = 'Description';
            TableRelation = "No. Series";
        }
        field(15; "Your Reference"; Text[100])
        {
            Caption = 'Your Reference';

        }






    }

    keys
    {
        key(key01; TempId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // fieldgroup(DropDown; "Code", Description, "Country/Region Code", "Customer Posting Group")
        // {
        // }
    }

    // #if not CLEAN18
    //     trigger OnDelete()
    //     begin
    //         DimMgt.DeleteDefaultDim(DATABASE::"Customer Template", Code);
    //     end;

    //     trigger OnInsert()
    //     begin
    //         DimMgt.UpdateDefaultDim(
    //           DATABASE::"Customer Template", Code,
    //           "Global Dimension 1 Code", "Global Dimension 2 Code");

    //         "Invoice Disc. Code" := Code;
    //     end;

    //     trigger OnRename()
    //     begin
    //         DimMgt.RenameDefaultDim(DATABASE::"Customer Template", xRec.Code, Code);
    //     end;

    //     var
    //         GenBusPostingGrp: Record "Gen. Business Posting Group";
    //         DimMgt: Codeunit DimensionManagement;

    //     [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by new templates.', '18.0')]
    //     procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    //     begin
    //         OnBeforeValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);

    //         DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
    //         if not IsTemporary then begin
    //             DimMgt.SaveDefaultDim(DATABASE::"Customer Template", Code, FieldNumber, ShortcutDimCode);
    //             Modify;
    //         end;

    //         OnAfterValidateShortcutDimCode(Rec, xRec, FieldNumber, ShortcutDimCode);
    //     end;

    //     [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by new templates.', '18.0')]
    //     [Scope('OnPrem')]
    //     procedure CopyTemplate(var SourceCustomerTemplate: Record "Customer Template")
    //     begin
    //         TransferFields(SourceCustomerTemplate, false);
    //         Modify(true);
    //     end;

    //     [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by new templates.', '18.0')]
    //     [IntegrationEvent(false, false)]
    //     local procedure OnAfterValidateShortcutDimCode(var CustomerTemplate: Record "Customer Template"; var xCustomerTemplate: Record "Customer Template"; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    //     begin
    //     end;

    //     [Obsolete('Will be removed with other functionality related to "old" templates. Replaced by new templates.', '18.0')]
    //     [IntegrationEvent(false, false)]
    //     local procedure OnBeforeValidateShortcutDimCode(var CustomerTemplate: Record "Customer Template"; var xCustomerTemplate: Record "Customer Template"; FieldNumber: Integer; var ShortcutDimCode: Code[20])
    //     begin
    //     end;
    // #endif
}

