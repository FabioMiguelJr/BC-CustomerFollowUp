page 50151 "CFU Customer Follow-up Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "CFU Customer Follow-up";
    Caption = 'Follow-up de Cliente';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Geral';

                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Cliente relacionado ao follow-up.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Nome do cliente.';
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Assunto do follow-up.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Data prevista para o retorno.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Situação atual do follow-up.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ToolTip = 'Usuário responsável.';
                }
                field("Completed At"; Rec."Completed At")
                {
                    ToolTip = 'Data e hora em que o follow-up foi concluído.';
                }
            }
            group(NotesGroup)
            {
                Caption = 'Observações';

                field(Notes; Rec.Notes)
                {
                    ShowCaption = false;
                    MultiLine = true;
                    ToolTip = 'Anotações livres sobre o follow-up.';
                }
            }
        }
    }
}
