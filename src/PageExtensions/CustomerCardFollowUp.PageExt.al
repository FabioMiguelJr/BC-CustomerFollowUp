pageextension 50150 "CFU Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("CFU Open Follow-ups"; Rec."CFU Open Follow-ups")
            {
                ApplicationArea = All;
                ToolTip = 'Quantidade de follow-ups em aberto para este cliente.';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(CFUFollowUps)
            {
                ApplicationArea = All;
                Caption = 'Follow-ups';
                ToolTip = 'Abre os follow-ups deste cliente.';
                Image = TaskList;
                RunObject = page "CFU Customer Follow-up List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
        addlast(processing)
        {
            action(CFUNewFollowUp)
            {
                ApplicationArea = All;
                Caption = 'Novo Follow-up';
                ToolTip = 'Cria um novo follow-up para este cliente.';
                Image = NewToDo;

                trigger OnAction()
                var
                    FollowUpMgt: Codeunit "CFU Follow-up Mgt.";
                begin
                    FollowUpMgt.CreateAndOpen(Rec."No.");
                    CurrPage.Update(false);
                end;
            }
        }
        addlast(Category_Process)
        {
            actionref(CFUNewFollowUp_Promoted; CFUNewFollowUp)
            {
            }
        }
    }
}
