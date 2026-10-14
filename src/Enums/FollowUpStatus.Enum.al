enum 50150 "CFU Follow-up Status"
{
    Extensible = true;
    Caption = 'Status do Follow-up';

    value(0; Open)
    {
        Caption = 'Aberto';
    }
    value(1; Done)
    {
        Caption = 'Concluído';
    }
    value(2; Canceled)
    {
        Caption = 'Cancelado';
    }
}
