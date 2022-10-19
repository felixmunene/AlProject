pageextension 50101 "Sales Setup Extension" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Price List Nos.")
        {
            field("Waybill Nos."; Rec."Waybill Nos.")
            {
                ApplicationArea = All;
            }

        }
    }
}
