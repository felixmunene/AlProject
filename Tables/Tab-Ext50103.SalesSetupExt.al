tableextension 50103 SalesSetupExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Waybill Nos."; Code[20])
        {
            Caption = 'Waybill Nos.';
            DataClassification = ToBeClassified;
        }
    }
}
