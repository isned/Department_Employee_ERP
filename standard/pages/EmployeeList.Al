pageextension 55201 "BC EmployeeList" extends "Employee List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Last Name")
        {
            field(DepartmentCode; Rec.DepartmentCode)
            {
                ApplicationArea = all;

            }
            field(DepartmentDescription; Rec.DepartmentDescription)
            {
                ApplicationArea = all;
            }
            field(DepartmentStatus; Rec.DepartmentStatus)
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