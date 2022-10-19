/*******************************
Name :SWAT Felix
Date : 4th September 2022
Remarks: Extend the standard pro forma invoice 
************************************/
reportextension 50102 "Pro Forma" extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        // Add changes to dataitems and columns here
        add(Header)
        {
            column(AccNameCaption; BankingInfo[1])
            {

            }
            column(BkNameCaption; BankingInfo[2])
            {

            }
            column(BkAddCaption; BankingInfo[3])
            {

            }
            column(SwiftCaption; BankingInfo[4])
            {

            }
            column(IBANCaption; BankingInfo[5])
            {

            }
            column(Thankstxt; Thankstxt)
            {

            }
            column(PaymentCaption; BankingInfo[6])
            {

            }
            column(AccName; BankingInfo[7])
            {

            }
            column(BkName; BankingInfo[8])
            {

            }
            column(BkAdd; BankingInfo[9])
            {

            }
            column(SwiftCode; BankingInfo[10])
            {

            }
            column(IBANCode; BankingInfo[11])
            {

            }
        }
    }



    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }

    var
        CompanyInfo: Record "Company Information";
        Thankstxt: Text;
        BankingInfo: Array[12] of Text[100];


    trigger OnPreReport()

    begin
        
        CompanyInfo.GET();
        Thankstxt := 'Thank You For Your Business !';
        BankingInfo[1] := 'Account Name';
        BankingInfo[2] := 'Bank Name';
        BankingInfo[3] := 'Bank Address Name';
        BankingInfo[4] := 'SWIFT';
        BankingInfo[5] := 'IBAN';
        BankingInfo[6] := 'PAYMENT METHOD';
        BankingInfo[7] := 'Fursan Lojistik ithalat ihracat Ticaret Limited Şirketi'; //account name to be defined by Abdul
        BankingInfo[8] := CompanyInfo."Bank Name";
        BankingInfo[9] := 'Saray Mah. Dr. Adnan Büyükdeniz Cd. No:6, 34768 Ümraniye, Istanbul, Turkey.'; //to be defined by Abdul as Bank Address Name
        BankingInfo[10] := CompanyInfo."SWIFT Code";
        BankingInfo[11] := CompanyInfo.IBAN;
        BankingInfo[12] := CompanyInfo."Bank Name";

    end;
}