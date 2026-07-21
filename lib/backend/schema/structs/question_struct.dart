// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    int? id,
    String? subject,
    String? question,
    String? optionA,
    String? optionB,
    String? optionC,
    String? optionD,
    String? correctAnswer,
  })  : _id = id,
        _subject = subject,
        _question = question,
        _optionA = optionA,
        _optionB = optionB,
        _optionC = optionC,
        _optionD = optionD,
        _correctAnswer = correctAnswer;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "optionA" field.
  String? _optionA;
  String get optionA => _optionA ?? '';
  set optionA(String? val) => _optionA = val;

  bool hasOptionA() => _optionA != null;

  // "optionB" field.
  String? _optionB;
  String get optionB => _optionB ?? '';
  set optionB(String? val) => _optionB = val;

  bool hasOptionB() => _optionB != null;

  // "optionC" field.
  String? _optionC;
  String get optionC => _optionC ?? '';
  set optionC(String? val) => _optionC = val;

  bool hasOptionC() => _optionC != null;

  // "optionD" field.
  String? _optionD;
  String get optionD => _optionD ?? '';
  set optionD(String? val) => _optionD = val;

  bool hasOptionD() => _optionD != null;

  // "correctAnswer" field.
  String? _correctAnswer;
  String get correctAnswer => _correctAnswer ?? '';
  set correctAnswer(String? val) => _correctAnswer = val;

  bool hasCorrectAnswer() => _correctAnswer != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        id: castToType<int>(data['id']),
        subject: data['subject'] as String?,
        question: data['question'] as String?,
        optionA: data['optionA'] as String?,
        optionB: data['optionB'] as String?,
        optionC: data['optionC'] as String?,
        optionD: data['optionD'] as String?,
        correctAnswer: data['correctAnswer'] as String?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'subject': _subject,
        'question': _question,
        'optionA': _optionA,
        'optionB': _optionB,
        'optionC': _optionC,
        'optionD': _optionD,
        'correctAnswer': _correctAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'optionA': serializeParam(
          _optionA,
          ParamType.String,
        ),
        'optionB': serializeParam(
          _optionB,
          ParamType.String,
        ),
        'optionC': serializeParam(
          _optionC,
          ParamType.String,
        ),
        'optionD': serializeParam(
          _optionD,
          ParamType.String,
        ),
        'correctAnswer': serializeParam(
          _correctAnswer,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        optionA: deserializeParam(
          data['optionA'],
          ParamType.String,
          false,
        ),
        optionB: deserializeParam(
          data['optionB'],
          ParamType.String,
          false,
        ),
        optionC: deserializeParam(
          data['optionC'],
          ParamType.String,
          false,
        ),
        optionD: deserializeParam(
          data['optionD'],
          ParamType.String,
          false,
        ),
        correctAnswer: deserializeParam(
          data['correctAnswer'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuestionStruct &&
        id == other.id &&
        subject == other.subject &&
        question == other.question &&
        optionA == other.optionA &&
        optionB == other.optionB &&
        optionC == other.optionC &&
        optionD == other.optionD &&
        correctAnswer == other.correctAnswer;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        subject,
        question,
        optionA,
        optionB,
        optionC,
        optionD,
        correctAnswer
      ]);
}

QuestionStruct createQuestionStruct({
  int? id,
  String? subject,
  String? question,
  String? optionA,
  String? optionB,
  String? optionC,
  String? optionD,
  String? correctAnswer,
}) =>
    QuestionStruct(
      id: id,
      subject: subject,
      question: question,
      optionA: optionA,
      optionB: optionB,
      optionC: optionC,
      optionD: optionD,
      correctAnswer: correctAnswer,
    );
