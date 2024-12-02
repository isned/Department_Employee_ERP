page 50007 "RoleCenter"
{
    PageType = RoleCenter;
    Caption = 'Rôle de Center';

    layout
    {
        area(RoleCenter)
        {
            part(StandardPart; 1441)
            {
                ApplicationArea = All;
                Caption = 'Standard Part';
            }

            part(cardCue; 50010)
            {
                ApplicationArea = All;
                Caption = 'Card Cue';
            }
            part(DepartmentListe; 50000)
            {
                ApplicationArea = All;
            }
            part(EmployeeSubForm; 50004)
            {
                ApplicationArea = All;
            }

        }
    }


    var
        myInt: Integer;
}