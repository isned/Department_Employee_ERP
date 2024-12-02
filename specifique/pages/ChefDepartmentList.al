page 50003 "Chef Department liste"
{
    CardPageId = "ChefDepartment Card";
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ChefDepartment;
    Caption = 'Chef Department liste';


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(CountryCode; Rec.CountryCode)
                {
                    ApplicationArea = all;
                }
                field(CountryName; Rec.CountryName)
                {
                    ApplicationArea = all;
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