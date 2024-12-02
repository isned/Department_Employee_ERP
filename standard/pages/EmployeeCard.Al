pageextension 55200 "BC EmployeeCard" extends "Employee Card"
{
    layout
    {
        // Add changes to page layout here
        addfirst(General)
        {
            field(DepartmentCode; Rec.DepartmentCode)
            {
                ApplicationArea = all;
                trigger OnValidate()
                var
                    myInt: Integer;
                    Department: Record Department;
                begin
                    if Department.Get(Rec.DepartmentCode) then
                        Rec.DepartmentDescription := Department.Description;
                end;

            }
            field(DepartmentDescription; Rec.DepartmentDescription)
            {
                ApplicationArea = all;
                Editable = false;
            }
            field(DepartmentStatus; Rec.DepartmentStatus)
            {
                ApplicationArea = all;
            }
        }
        Modify("Search Name")
        {
            Visible = false;
        }
        Modify("Job Title")
        {
            Visible = false;
        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}