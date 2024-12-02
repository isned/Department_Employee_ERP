tableextension 50091 "BC UserSetup" extends "User Setup"
{
    fields
    {

        field(55202; DepartmentCode; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Code';
            TableRelation = Department.Code;
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