table 50002 cue
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; AssignedEmployee; Integer)
        {
            Caption = 'AssignedEmployee';
            FieldClass = FlowField;
            CalcFormula = Count(Employee where(DepartmentCode = filter(<> '')));
        }
        field(3; UnassignedEmployee; Integer)
        {
            Caption = 'UnassignedEmployee';
            FieldClass = FlowField;
            CalcFormula = Count(Employee where(DepartmentCode = filter(= '')));
        }
        field(4; DepartmentFilter; Code[20])
        {
            Caption = 'DepartmentFilter';
            FieldClass = FlowFilter;

        }
        field(5; DepartmentField; Integer)
        {
            Caption = 'DepartmentField';
            FieldClass = FlowField;
            CalcFormula = Count(Employee where(DepartmentCode = field(DepartmentFilter)));
        }
        // Total number of employees in the system
        field(6; NombreTotalEmployee; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Total Employees';
            CalcFormula = Count(Employee);
        }


        field(7; NombreTotalDepartement; Integer)
        {
            FieldClass = FlowField;
            Caption = 'Total Departments';
            CalcFormula = Count(Department);
        }


    }

    keys
    {
        key(Key1; PrimaryKey)
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

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}