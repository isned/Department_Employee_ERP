page 50000 DepartmentListe
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Department;
    Caption = 'Department Liste';
    CardPageId = "Department Card";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                { ApplicationArea = all; }
                field(Description; Rec.Description)
                { ApplicationArea = all; }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    StyleExpr = statusStyle;
                }
                field(ChefDepartmentCode; Rec.ChefDepartmentCode)
                {
                    ApplicationArea = all;
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

        }
    }

    actions
    {
        area(Processing)
        {
            action(AfficherEmployes)
            {
                ApplicationArea = All;
                Caption = 'Afficher les Employés';

                trigger OnAction()
                var
                    employee: Record Employee;
                    employeelist: Page "Employee List";
                begin


                    //supprimer ey filtre mawjoud
                    employee.Reset();
                    //SetRange=where en sql
                    employee.SetRange(DepartmentCode, Rec.Code);
                    //Afficher le resultat dans la page employee
                    employeelist.SetTableView(employee);
                    employeelist.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;

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
}