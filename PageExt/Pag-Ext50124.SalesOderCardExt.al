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
        SalesOrdertemplate: Record "Sales Order Temp";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesHeader: Record "Sales Header";
        SalesReciveable: Record "Sales & Receivables Setup";
    begin
        SalesReciveable.Get();
        if SalesReciveable."Enable Template" then
            if OdrTempMode then begin
                TemplateCode := SalesOrderTempMgt.SelectCustomerTemplate();
                SalesOrdertemplate.get(TemplateCode);
                NoSeriesMgt.InitSeries(SalesOrdertemplate."No. Series", '', SalesHeader."Posting Date", SalesHeader."No.", SalesHeader."No. Series");
                NoSeriesMgt.InitSeries(SalesOrdertemplate."Posted No.Series", '', SalesHeader."Posting Date", SalesHeader."Posting No.", SalesHeader."Posting No. Series");
                SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                SalesHeader."Your Reference" := SalesOrdertemplate."Your Reference";
                SalesHeader.Insert(true);
                Commit();
                Rec.Copy(SalesHeader);
                CurrPage.Update;
                OdrTempMode := false;
            end;



    end;



    var
        OdrTempMode: Boolean;
        TemplateCode: Code[20];

}
