pageextension 50010 "BC Countries/Regions" extends "Countries/Regions"
{
    layout
    {
        // Add changes to page layout here
        addafter(Name)
        {
            field(Name2; Rec.Name2)
            {

                ApplicationArea = all;
                Caption = 'Name 2';

            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}