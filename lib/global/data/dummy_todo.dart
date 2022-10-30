import '../models/todo.dart';
import '../utilities/color_enum.dart';

final dummyTodos = [
  Todo(
      id: 'p1',
      title: 'Levar o dog pra passear',
      description: 'hoje as 16 horas da tarde levar o dog pra passear',
      colorEnum: ColorEnum.defaut,
      tag: 'study'),
  Todo(
      id: 'p2',
      title: 'Cozinha',
      description: 'Arrumar a cozinha e lavar a louça do almoço amanha',
      colorEnum: ColorEnum.defaut,
      tag: 'goals'),
  Todo(
      id: 'p3',
      title: 'Estudar ',
      description: 'estudar para a prova do Enem que esta chegando',
      colorEnum: ColorEnum.defaut,
      tag: 'work'),
];
