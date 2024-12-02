pageextension 50092 "BC UserSetupList" extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("User ID")
        {
            field(DepartmentCode; Rec.DepartmentCode)
            {
                ApplicationArea = all;

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