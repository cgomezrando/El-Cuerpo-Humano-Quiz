import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<QuestionStruct> _gameQuestions = [];
  List<QuestionStruct> get gameQuestions => _gameQuestions;
  set gameQuestions(List<QuestionStruct> value) {
    _gameQuestions = value;
  }

  void addToGameQuestions(QuestionStruct value) {
    gameQuestions.add(value);
  }

  void removeFromGameQuestions(QuestionStruct value) {
    gameQuestions.remove(value);
  }

  void removeAtIndexFromGameQuestions(int index) {
    gameQuestions.removeAt(index);
  }

  void updateGameQuestionsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    gameQuestions[index] = updateFn(_gameQuestions[index]);
  }

  void insertAtIndexInGameQuestions(int index, QuestionStruct value) {
    gameQuestions.insert(index, value);
  }

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
  }

  int _currentPlayer = 1;
  int get currentPlayer => _currentPlayer;
  set currentPlayer(int value) {
    _currentPlayer = value;
  }

  int _playerCount = 1;
  int get playerCount => _playerCount;
  set playerCount(int value) {
    _playerCount = value;
  }

  String _player1Name = '';
  String get player1Name => _player1Name;
  set player1Name(String value) {
    _player1Name = value;
  }

  String _player2Name = '';
  String get player2Name => _player2Name;
  set player2Name(String value) {
    _player2Name = value;
  }

  String _player3Name = '';
  String get player3Name => _player3Name;
  set player3Name(String value) {
    _player3Name = value;
  }

  String _player4Name = '';
  String get player4Name => _player4Name;
  set player4Name(String value) {
    _player4Name = value;
  }

  int _player1Score = 0;
  int get player1Score => _player1Score;
  set player1Score(int value) {
    _player1Score = value;
  }

  int _player2Score = 0;
  int get player2Score => _player2Score;
  set player2Score(int value) {
    _player2Score = value;
  }

  int _player3Score = 0;
  int get player3Score => _player3Score;
  set player3Score(int value) {
    _player3Score = value;
  }

  int _player4Score = 0;
  int get player4Score => _player4Score;
  set player4Score(int value) {
    _player4Score = value;
  }

  int _totalQuestionsGame = 20;
  int get totalQuestionsGame => _totalQuestionsGame;
  set totalQuestionsGame(int value) {
    _totalQuestionsGame = value;
  }

  int _currentPlayerQuestion = 1;
  int get currentPlayerQuestion => _currentPlayerQuestion;
  set currentPlayerQuestion(int value) {
    _currentPlayerQuestion = value;
  }

  String _selectedAnswer = '';
  String get selectedAnswer => _selectedAnswer;
  set selectedAnswer(String value) {
    _selectedAnswer = value;
  }

  int _questionTimer = 20;
  int get questionTimer => _questionTimer;
  set questionTimer(int value) {
    _questionTimer = value;
  }

  String _answerResult = '';
  String get answerResult => _answerResult;
  set answerResult(String value) {
    _answerResult = value;
  }

  bool _timerExpired = false;
  bool get timerExpired => _timerExpired;
  set timerExpired(bool value) {
    _timerExpired = value;
  }

  String _winnerName = '';
  String get winnerName => _winnerName;
  set winnerName(String value) {
    _winnerName = value;
  }

  bool _waitingNextTurn = false;
  bool get waitingNextTurn => _waitingNextTurn;
  set waitingNextTurn(bool value) {
    _waitingNextTurn = value;
  }

  bool _StartGame = false;
  bool get StartGame => _StartGame;
  set StartGame(bool value) {
    _StartGame = value;
  }

  bool _InstructionsDuringGame = false;
  bool get InstructionsDuringGame => _InstructionsDuringGame;
  set InstructionsDuringGame(bool value) {
    _InstructionsDuringGame = value;
  }

  int _SavedTime = 0;
  int get SavedTime => _SavedTime;
  set SavedTime(int value) {
    _SavedTime = value;
  }
}
