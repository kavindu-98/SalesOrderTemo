// tableextension 50102 "Procument Cue" extends "Sales Cue"
// {
//     fields
//     {
//         field(25; "Pending Meterial Requests"; Integer)
//         {
//             Caption = 'Pending Meterial Requests';

//             CalcFormula = Count("Material Request Header" WHERE(
//                                                       Status = FILTER(Pending)));

//             Editable = false;
//             FieldClass = FlowField;


//         }
//         field(26; "Sent for proccessing"; Integer)
//         {
//             Caption = 'Sent for proccessing';
//             CalcFormula = Count("Material Request Header" WHERE(
//                                                       Status = FILTER("Sent for Processing")));

//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(27; "processed Meterial Requests"; Integer)
//         {
//             Caption = 'processed Meterial Requests';
//             CalcFormula = Count("Material Request Header" WHERE(
//                                                       Status = FILTER(Processed)));

//             Editable = false;
//             FieldClass = FlowField;
//         }
//     }
// }
