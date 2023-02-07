pageextension 50123 SalesOrderTemplateExt extends "Sales Order List"
{
    actions
    {
        addafter(Reopen)
        {
            action("Apply Template")
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category10;


            }
        }
    }


}
