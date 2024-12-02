page 50010 cardCue
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = cue;

    layout
    {
        area(Content)
        {
            cuegroup(GroupName)
            {

                field("AssignedEmployee"; Rec.AssignedEmployee)
                {
                    ApplicationArea = All;
                    Caption = 'Assigned Employees';
                    Editable = false;

                }


                field("UnassignedEmployee"; Rec.UnassignedEmployee)
                {
                    ApplicationArea = All;
                    Caption = 'Unassigned Employees';
                    Editable = false;
                }
                field("DepartmentField"; Rec.DepartmentField)
                {
                    ApplicationArea = All;
                    Caption = 'DepartmentField';
                    Editable = false;
                }
                field("NombreTotalEmployee"; Rec.NombreTotalEmployee)
                {
                    ApplicationArea = All;
                    Caption = 'TotalEmployee';
                    Editable = false;
                }
                field("NombreTotalDepartement"; Rec.NombreTotalDepartement)
                {
                    ApplicationArea = All;
                    Caption = 'TotalDepartement';
                    Editable = false;
                    DrillDownPageId = "DepartmentListe";
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
                ApplicationArea = All;
                Caption = 'Action Name';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;


    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
    begin
        // Réinitialise les valeurs du record actuel
        Rec.Reset;

        // Si l'enregistrement n'existe pas encore, l'initialiser et l'insérer
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        // Vérifie si les données de l'utilisateur actuel existent dans la table "User Setup"
        if usersetup.Get(UserId) then begin
            // Applique un filtre sur le record actuel en fonction du code département de l'utilisateur
            Rec.SetFilter(DepartmentFilter, usersetup.DepartmentCode);
        end;
    end;

}
