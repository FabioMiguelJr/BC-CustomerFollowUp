codeunit 50150 "CFU Follow-up Mgt."
{
    procedure CreateAndOpen(CustomerNo: Code[20])
    var
        FollowUp: Record "CFU Customer Follow-up";
    begin
        FollowUp.Init();
        FollowUp.Validate("Customer No.", CustomerNo);
        FollowUp.Insert(true);
        Commit();
        Page.Run(Page::"CFU Customer Follow-up Card", FollowUp);
    end;

    procedure MarkAsDone(var FollowUp: Record "CFU Customer Follow-up")
    var
        FollowUpToModify: Record "CFU Customer Follow-up";
        DoneCount: Integer;
        DoneMsg: Label '%1 follow-up(s) concluído(s).', Comment = '%1 = quantidade';
    begin
        FollowUp.SetRange(Status, FollowUp.Status::Open);
        if FollowUp.FindSet() then
            repeat
                // Modifica uma cópia para não alterar o campo filtrado durante a iteração
                FollowUpToModify.Get(FollowUp."Entry No.");
                FollowUpToModify.Validate(Status, FollowUpToModify.Status::Done);
                FollowUpToModify.Modify(true);
                DoneCount += 1;
            until FollowUp.Next() = 0;
        Message(DoneMsg, DoneCount);
    end;
}
