tableextension 50009 "BC Countries" extends "Country/Region"
{
    fields
    {
        // Add changes to table fields here
        field(50009; Name2; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name 2';
            // TableRelation = ChefDepartment.Code;
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