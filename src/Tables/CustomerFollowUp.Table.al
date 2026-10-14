table 50150 "CFU Customer Follow-up"
{
    DataClassification = CustomerContent;
    Caption = 'Follow-up de Cliente';
    LookupPageId = "CFU Customer Follow-up List";
    DrillDownPageId = "CFU Customer Follow-up List";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Nº Mov.';
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Nº Cliente';
            TableRelation = Customer."No.";
            NotBlank = true;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Nome do Cliente';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(4; Subject; Text[100])
        {
            Caption = 'Assunto';
        }
        field(5; "Due Date"; Date)
        {
            Caption = 'Data Prevista';
        }
        field(6; Status; Enum "CFU Follow-up Status")
        {
            Caption = 'Status';

            trigger OnValidate()
            begin
                if Status = Status::Done then
                    "Completed At" := CurrentDateTime()
                else
                    "Completed At" := 0DT;
            end;
        }
        field(7; "Assigned User ID"; Code[50])
        {
            Caption = 'Responsável';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            DataClassification = EndUserIdentifiableInformation;
        }
        field(8; Notes; Text[2048])
        {
            Caption = 'Observações';
        }
        field(9; "Completed At"; DateTime)
        {
            Caption = 'Concluído em';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(CustomerStatus; "Customer No.", Status, "Due Date")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Assigned User ID" = '' then
            "Assigned User ID" := CopyStr(UserId(), 1, MaxStrLen("Assigned User ID"));
        if "Due Date" = 0D then
            "Due Date" := WorkDate();
    end;

    procedure IsOverdue(): Boolean
    begin
        exit((Status = Status::Open) and ("Due Date" <> 0D) and ("Due Date" < WorkDate()));
    end;
}
