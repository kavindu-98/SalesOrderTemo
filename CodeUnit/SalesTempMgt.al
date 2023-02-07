

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


}