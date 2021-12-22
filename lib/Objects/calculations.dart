import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Calculation {

  double media;
  double somatorio;
  double desvioPadrao;
  double variacao;
  double fck;

  Calculation(this.media,  this.somatorio,  this.desvioPadrao,  this.variacao,  this.fck);

  static List<Calculation> getCalculations() {
    return calculations;
  }

  static addCalculations(media, somatorio, desvioPadrao, variacao, fck) {
    var calculation = new Calculation(0.0,0.0,0.0,0.0,0.0);
    calculation.media = media;
    calculation.somatorio = somatorio;
    calculation.desvioPadrao = desvioPadrao;
    calculation.variacao = variacao;
    calculation.fck = fck;

    calculations.add(calculation);
  }

  factory Calculation.fromJson(dynamic json) {
    return Calculation(
      json['media'] as double,
      json['somatorio'] as double,
      json['desvioPadrao'] as double,
      json['variacao'] as double,
      json['fck'] as double,
    );
  }


  Map<String, dynamic> toJson() => {
    'media': media,
    'somatorio': somatorio,
    'desvioPadrao': desvioPadrao,
    'variacao': variacao,
    'fck': fck,
  };

  @override
  String toString(){
    return '"Calculation" : {"media": $media, "somatorio": $somatorio, "desvioPadrao": $desvioPadrao, "variacao": $variacao, "fck": $fck}';
  }

}

List <Calculation> calculations = [];