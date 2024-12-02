page 50004 "Employee SubForm"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Employee;
    Caption = 'Employee Sub Form';
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
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