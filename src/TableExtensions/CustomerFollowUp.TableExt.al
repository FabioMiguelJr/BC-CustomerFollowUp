tableextension 50150 "CFU Customer" extends Customer
{
    fields
    {
        field(50150; "CFU Open Follow-ups"; Integer)
        {
            Caption = 'Follow-ups Abertos';
            FieldClass = FlowField;
            CalcFormula = count("CFU Customer Follow-up" where("Customer No." = field("No."),
                                                               Status = const(Open)));
            Editable = false;
        }
    }
}
