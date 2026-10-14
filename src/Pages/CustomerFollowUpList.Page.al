page 50150 "CFU Customer Follow-up List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CFU Customer Follow-up";
    CardPageId = "CFU Customer Follow-up Card";
    Caption = 'Follow-ups de Clientes';
    Editable = false;
    SourceTableView = sorting("Customer No.", Status, "Due Date");

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Número sequencial do follow-up.';
                }
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
                    StyleExpr = DueDateStyle;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Situação atual do follow-up.';
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ToolTip = 'Usuário responsável.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MarkDone)
            {
                Caption = 'Marcar como Concluído';
                ToolTip = 'Conclui os follow-ups selecionados.';
                Image = Approve;

                trigger OnAction()
                var
                    FollowUp: Record "CFU Customer Follow-up";
                    FollowUpMgt: Codeunit "CFU Follow-up Mgt.";
                begin
                    CurrPage.SetSelectionFilter(FollowUp);
                    FollowUpMgt.MarkAsDone(FollowUp);
                    CurrPage.Update(false);
                end;
            }
        }
        area(Promoted)
        {
            actionref(MarkDone_Promoted; MarkDone)
            {
            }
        }
    }

    var
        DueDateStyle: Text;

    trigger OnAfterGetRecord()
    begin
        if Rec.IsOverdue() then
            DueDateStyle := 'Unfavorable'
        else
            DueDateStyle := 'Standard';
    end;
}
