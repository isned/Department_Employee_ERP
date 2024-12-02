page 50002 "ChefDepartment Card"
{
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Documents;
    SourceTable = ChefDepartment;
    Caption = 'Chef Department Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ApplicationArea = all;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;

                }
                field(CountryCode; Rec.CountryCode)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var

                        Country_L: Record "Country/Region";
                    begin
                        Message('uuuuu');
                        if Country_L.Get(Rec.CountryCode) then begin
                            Message('name 2 %1', Country_L.Name2);
                            Rec.CountryName := Country_L.Name2;
                        end
                        else
                            Message('no');

                    end;
                }
                field(CountryName; Rec.CountryName)
                {
                    ApplicationArea = all;
                    Enabled = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}