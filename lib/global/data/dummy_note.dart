import 'package:task_app/global/utilities/color_enum.dart';

import '../models/note.dart';

final dummyNotes = [
  Note(
    id: 'p1',
    title: 'Lembrete para voce mesmo',
    description: 'A red shirt - it is pretty red!',
    colorEnum: ColorEnum.defaut,
    tag: 'toRemanber',
  ),
  Note(
    id: 'p2',
    title: 'Notas do estudo de quimica',
    description: 'A nice pair of trousers.',
    colorEnum: ColorEnum.defaut,
    tag: 'study',
  ),
  Note(
    id: 'p3',
    title: 'Algoritimos do cubo magico',
    description:
        'Algoritimos do cubo magico serve pra saber o movimento certo que tu deve fazer pra completar o cubo',
    colorEnum: ColorEnum.defaut,
    tag: 'quotes',
  ),
];
