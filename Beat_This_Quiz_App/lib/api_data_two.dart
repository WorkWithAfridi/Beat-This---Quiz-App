/// response_code : 0
/// results : [{"category":"Science: Mathematics","type":"multiple","difficulty":"medium","question":"What is the alphanumeric representation of the imaginary number?","correct_answer":"i","incorrect_answers":["e","n","x"]}]

class Api_data_two {
  late int _responseCode;
  late List<Results> _results;

  int get responseCode => _responseCode;
  List<Results> get results => _results;

  Api_data_two({
      required int responseCode,
      required List<Results> results}){
    _responseCode = responseCode;
    _results = results;
}

  Api_data_two.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    if (_results != null) {
      map['results'] = _results.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category : "Science: Mathematics"
/// type : "multiple"
/// difficulty : "medium"
/// question : "What is the alphanumeric representation of the imaginary number?"
/// correct_answer : "i"
/// incorrect_answers : ["e","n","x"]

class Results {
  late String _category;
  late String _type;
  late String _difficulty;
  late String _question;
  late String _correctAnswer;
  late List<String> _incorrectAnswers;

  String get category => _category;
  String get type => _type;
  String get difficulty => _difficulty;
  String get question => _question;
  String get correctAnswer => _correctAnswer;
  List<String> get incorrectAnswers => _incorrectAnswers;

  Results({
      required String category,
      required String type,
      required String difficulty,
      required String question,
      required String correctAnswer,
      required List<String> incorrectAnswers}){
    _category = category;
    _type = type;
    _difficulty = difficulty;
    _question = question;
    _correctAnswer = correctAnswer;
    _incorrectAnswers = incorrectAnswers;
}

  Results.fromJson(dynamic json) {
    _category = json['category'];
    _type = json['type'];
    _difficulty = json['difficulty'];
    _question = json['question'];
    _correctAnswer = json['correct_answer'];
    _incorrectAnswers = json['incorrect_answers'] != null ? json['incorrect_answers'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['category'] = _category;
    map['type'] = _type;
    map['difficulty'] = _difficulty;
    map['question'] = _question;
    map['correct_answer'] = _correctAnswer;
    map['incorrect_answers'] = _incorrectAnswers;
    return map;
  }

}