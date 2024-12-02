tableextension 55200 "BC Employee" extends Employee
{
    fields
    {
        // Add changes to table fields here
        field(55201; DepartmentCode; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Code';
            TableRelation = Department.Code;
        }
        field(55202; DepartmentDescription; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Description';
        }
        field(55203; DepartmentStatus; Enum "Description Status")
        {

            Caption = 'Department Status';
            FieldClass = FlowField;
            CalcFormula = lookup(Department.Status where(
                Code = field(DepartmentCode)
            ));
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}