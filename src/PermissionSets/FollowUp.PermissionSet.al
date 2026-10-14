permissionset 50150 "CFU Follow-up"
{
    Assignable = true;
    Caption = 'Follow-up de Clientes';

    Permissions =
        tabledata "CFU Customer Follow-up" = RIMD,
        table "CFU Customer Follow-up" = X,
        page "CFU Customer Follow-up List" = X,
        page "CFU Customer Follow-up Card" = X,
        codeunit "CFU Follow-up Mgt." = X;
}
