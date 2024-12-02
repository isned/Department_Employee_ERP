table 50000 Department
{
    DataClassification = ToBeClassified;
    Caption = 'Department';
    fields
    {
        field(1; Code; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; Status; Enum "Description Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(4; CreatedAT; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'CreatedAt';
        }
        field(5; CreatedBy; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'CreatedBy';
        }
        field(6; ModifiedBy; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'ModifiedBy';
        }
        field(7; ModifiedAt; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'ModifiedAt';
        }
        field(50001; ChefDepartmentCode; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'ChefDepartment Code';
            TableRelation = ChefDepartment.Code;
        }
        field(50002; ChefDepartmentName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'ChefDepartment Name';
            TableRelation = ChefDepartment.Name;
        }
        field(50003; ChefDepartmentStatus; Enum "ChefDepartment Status")
        {

            Caption = 'ChefDepartment Status';
            FieldClass = FlowField;
            CalcFormula = lookup(ChefDepartment.Status where(
                Code = field(ChefDepartmentCode)
            ));
        }

    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin
        Rec.CreatedAT := Today;
        Rec.CreatedBy := UserId;
    end;

    trigger OnModify()
    begin
        Rec.ModifiedBy := UserId;
        Rec.ModifiedAt := Today;
    end;

    trigger OnDelete()
    var
        text001: Label 'Unable to delete the department because its status is "Open"';
    begin
        //1ere solution
        // if Rec.Status = Rec.Status::Open then
        //  Error(text001);


        //2eme solution
        Rec.TestField(Status, Rec.Status::Closed);
        // Rec.TestField(Status, Rec.Status::" ");

    end;

    trigger OnRename()
    begin

    end;

}