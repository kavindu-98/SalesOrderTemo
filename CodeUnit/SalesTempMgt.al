

codeunit 50125 "Sales Order Temp Mgt"
{
    procedure SelectCustomerTemplate() Result: Code[20]
    var
        SalesOrderTemp: Record "Sales Order Temp";
        SelectSalesOrderTemplList: Page "Sale Order Temp List";
        IsHandled: Boolean;
    begin
        if (SalesOrderTemp.Count > 1) and GuiAllowed then begin
            SelectSalesOrderTemplList.SetTableView(SalesOrderTemp);
            SelectSalesOrderTemplList.LookupMode(true);
            if SelectSalesOrderTemplList.RunModal() = Action::LookupOK then begin
                SelectSalesOrderTemplList.GetRecord(SalesOrderTemp);

                exit(SalesOrderTemp.TempId);
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnTestStatusIsNotReleased', '', true, true)]
    local procedure OnTestStatusIsNotReleased(var NotReleased: Boolean; SalesHeader: Record "Sales Header")
    var
        SalesOrder: Page "Sales Order";
    begin
        if SalesHeader.NotRefreshed then begin
            NotReleased := false;
            SalesHeader.NotRefreshed := false;
            SalesHeader.Modify();
            SalesOrder.SetRecord(SalesHeader);
            SalesOrder.Run();
        end;

    end;


}