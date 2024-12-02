table 50001 ChefDepartment
{
    DataClassification = ToBeClassified;
    Caption = 'Chef Department';

    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';

        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }
        field(3; Status; Enum "ChefDepartment Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
        field(50002; CountryCode; code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country Code';
            TableRelation = "Country/Region".Code;
        }
        field(50003; CountryName; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Country Name';

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
