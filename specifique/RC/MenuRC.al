page 50008 "MenuRC"
{
    PageType = List;
    SourceTable = Customer;

    Caption = 'Menu RC';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshPage)
            {

            }
        }
    }
}
