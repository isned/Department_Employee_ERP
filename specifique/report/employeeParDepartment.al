report 50008 employeeParDepartment
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    // DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = '.\specifique\report\employeeParDepartment.RDL';
    Caption = 'Report';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(Status; Status)
            {
                IncludeCaption = true;
            }
            column(DepartmentCode; DepartmentCode)
            {
                IncludeCaption = true;
            }
            column(DepartmentDescription; DepartmentDescription)
            {
                IncludeCaption = true;
            }
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(First_Name; "First Name")
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName)
            {

            }

            column(CompanyPhone; CompanyPhone)
            {

            }

            column(companyPicture; companyInformation_G.Picture)
            {

            }
        }

    }

    requestpage
    {
        //AboutTitle = 'Teaching tip title';
        //AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    /* field(Name; SourceExpression)
                     {

                     }*/
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }

    /* rendering
     {
         layout(LayoutName)
         {
             Type = Excel;
             LayoutFile = 'mySpreadsheet.xlsx';
         }
     }*/

    trigger OnPreReport()

    begin
        if companyInformation_G.get() then begin

            CompanyName := CompanyInformation_G.Name;
            CompanyPhone := CompanyInformation_G."Phone No.";
            companyInformation_G.CalcFields(Picture);

        end;
    end;


    var
        companyInformation_G: Record "Company Information";
        companyName: Text;
        companyPhone: Text;




}