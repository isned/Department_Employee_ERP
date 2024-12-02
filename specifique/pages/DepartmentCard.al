page 50001 "Department Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Department;
    Caption = 'Department Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                { ApplicationArea = all; }
                field(Description; Rec.Description)
                { ApplicationArea = all; }

                group(date)
                {
                    Caption = 'Date';
                    field(CreatedAT; Rec.CreatedAT)
                    {
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field(CreatedBy; Rec.CreatedBy)
                    {
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field(ModifiedBy; Rec.ModifiedBy)
                    {
                        ApplicationArea = all;
                        Editable = false;
                    }
                    field(ModifiedAt; Rec.ModifiedAt)
                    {
                        ApplicationArea = all;
                        Editable = false;
                    }


                }


            }
            group(details)
            {
                Caption = 'Details';
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    StyleExpr = statusStyle;
                }
            }
            group(detailsChefDepartment)
            {
                Caption = 'Details chef department ';
                field(ChefDepartmentCode; Rec.ChefDepartmentCode)
                {
                    ApplicationArea = all;
                    trigger OnValidate()
                    var

                        ChefDepartment: Record ChefDepartment;
                    begin
                        if ChefDepartment.Get(Rec.ChefDepartmentCode) then
                            Rec.ChefDepartmentName := ChefDepartment.Name;
                        Rec.ChefDepartmentStatus := ChefDepartment.Status;
                    end;
                }
                field(ChefDepartmentName; Rec.ChefDepartmentName)
                {
                    ApplicationArea = all;

                }
                field(ChefDepartmentStatus; Rec.ChefDepartmentStatus)
                {
                    ApplicationArea = all;
                }


            }
            part(EmployeePart; "Employee SubForm")
            {
                SubPageLink = DepartmentCode = field(Code);
                ApplicationArea = all;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var

        statusStyle: Text;

    trigger OnAfterGetRecord()

    begin
        clear(statusStyle);
        if Rec.Status = Rec.Status::Open then
            statusStyle := 'favorable'
        else
            if Rec.Status = Rec.Status::Closed then
                statusStyle := 'unfavorable'
    end;

    trigger OnOpenPage()
    var

        Employee: Record Employee;
        EmployeeCount: Integer;
        text001: Label 'Number of employees > 5 in this department';
    begin

        //supprimer ey filtre mawjoud
        Employee.Reset();
        Employee.SetRange(DepartmentCode, Rec.Code);
        EmployeeCount := Employee.Count;

        if EmployeeCount > 5 then
            Message(text001);

    end;

    trigger OnModifyRecord(): Boolean
    var

        Employee: Record Employee;
        EmployeeCount: Integer;
        text001: Label 'Ce département est déjà affecté à des employés. Voulez-vous modifier les informations du département ?';
    begin
        // Vérifie s'il y a des employés associés au département
        Employee.Reset();
        Employee.SetRange(DepartmentCode, Rec.Code);
        EmployeeCount := Employee.Count;

        // Si le département a des employés, afficher un message de confirmation
        if EmployeeCount > 0 then begin
            if not Confirm(text001, false) then
                exit(false); // Annule la modification si l'utilisateur sélectionne "Non"
        end;
        exit(true); // Continue la modification
    end;
}