pageextension 50124 Sales_Oder_Card_Ext extends "Sales Order"
{
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if GuiAllowed then
            if Rec."No." = '' then
                OdrTempMode := true;

    end;

    trigger OnAfterGetCurrRecord()
    var
        SalesOrderTempMgt: Codeunit "Sales Order Temp Mgt";
        SalesOrdertemp: Record "Sales Order Temp";
        SalesOrderTempLine: Record SalesOrdItemLine;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesReciveable: Record "Sales & Receivables Setup";
    begin
        SalesReciveable.Get();
        if SalesReciveable."Enable Template" then
            if OdrTempMode then begin
                TemplateCode := SalesOrderTempMgt.SelectCustomerTemplate();
                SalesOrdertemp.get(TemplateCode);
                NoSeriesMgt.InitSeries(SalesOrdertemp."No. Series", '', SalesHeader."Posting Date", SalesHeader."No.", SalesHeader."No. Series");
                NoSeriesMgt.InitSeries(SalesOrdertemp."Posted No.Series", '', SalesHeader."Posting Date", SalesHeader."Posting No.", SalesHeader."Posting No. Series");
                SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                SalesHeader."Your Reference" := SalesOrdertemp."Your Reference";
                SalesHeader.Validate("Sell-to Customer No.", SalesOrdertemp."Customer No.");
                SalesHeader.Insert(true);
                SalesHeader.NotRefreshed := true;


                if SalesOrdertemp."Customer No." <> '' then begin
                    SalesOrderTempLine.SetRange(TempId, TemplateCode);
                    if SalesOrderTempLine.FindSet() then
                        repeat begin
                            SalesLine.init();
                            SalesLine."Document Type" := SalesLine."Document Type"::Order;
                            SalesLine."Document No." := SalesHeader."No.";
                            SalesLine."Line No." := SalesOrderTempLine."Line No.";
                            SalesLine.Type := SalesOrderTempLine.Type;
                            SalesLine.Validate("No.", SalesOrderTempLine."No.");
                            SalesLine.Validate(Quantity, SalesOrderTempLine.Quantity);
                            SalesLine.Insert();
                            //SalesLine.Modify();
                            CurrPage.Update;
                        end until SalesOrderTempLine.Next() = 0;
                end;




                Commit();
                Rec.Copy(SalesHeader);
                CurrPage.Update();
                CurrPage.Close();
                Page.Run(42, SalesHeader);
                OdrTempMode := false;
            end;



    end;



    var
        OdrTempMode: Boolean;
        TemplateCode: Code[20];


}
