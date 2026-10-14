# Customer Follow-up (extensão AL de exemplo)

Registra follow-ups (retornos agendados) por cliente no Business Central 26.

- Tabela `CFU Customer Follow-up` (50150) com status, data prevista, responsável e observações.
- Lista (50150) e ficha (50151); na lista, follow-ups atrasados ficam em vermelho e há a ação "Marcar como Concluído".
- Ficha do Cliente: campo "Follow-ups Abertos" e ações "Follow-ups" e "Novo Follow-up".
- Permission set `CFU Follow-up` para atribuir aos usuários.

Faixa de IDs: 50150–50199 (não colide com a TESTEAPI, que usa 50100–50149).

## Rodar localmente
1. Abra esta pasta no VS Code com a extensão AL Language.
2. Confira `.vscode/launch.json` (server `http://localhost:8080/BC260`, instância `BC260`, Windows auth), igual ao da TESTEAPI.
3. `AL: Download Symbols`, depois F5 para publicar. A página inicial é a lista de follow-ups.
4. Atribua o permission set `CFU Follow-up` ao seu usuário se não for SUPER.
