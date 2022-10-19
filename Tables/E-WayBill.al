table 50102 "E-Waybill"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {

            DataClassification = ToBeClassified;
            trigger Onvalidate()

            begin
                TestManual();
            end;

        }
        field(2; InvoiceNo; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Header";
        }
        field(3; "Mode of Transport"; Option)
        {
            OptionMembers = " ","Rail","Road","Air","Ship";
            OptionCaption = ' ,Rail,Road,Air,Ship';
            DataClassification = ToBeClassified;
        }
        field(4; "Shipment No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Recipient Address "; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Creation Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "Created By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8; "Registration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "Creation Date" := Today;
        SalesSetup.Get();
        NoSeriesMgt.InitSeries(SalesSetup."Waybill Nos.", "No. Series", Today, "No.", "No. Series");
        "No. Series" := '';

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;


    local procedure TestManual()
    var
        IsHandled: Boolean;
    begin
        IsHandled := false;
        if IsHandled then
            exit;

        if "No." <> xRec."No." then begin
            SalesSetup.Get();
            NoSeriesMgt.TestManual(SalesSetup."Waybill Nos.");
            "No. Series" := '';
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}