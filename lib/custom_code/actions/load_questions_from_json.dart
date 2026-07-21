// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math';

Future<List<QuestionStruct>> loadQuestionsFromJson() async {
  const String questionsJson = r'''
[
  {
    "id": 1,
    "question": "¿Qué vitamina produce principalmente la piel al exponerse al sol?",
    "optionA": "Vitamina A",
    "optionB": "Vitamina C",
    "optionC": "Vitamina D",
    "optionD": "Vitamina K",
    "correctAnswer": "Vitamina D"
  },
  {
    "id": 2,
    "question": "¿Qué órgano es responsable de filtrar la sangre y producir orina?",
    "optionA": "Hígado",
    "optionB": "Riñón",
    "optionC": "Estómago",
    "optionD": "Páncreas",
    "correctAnswer": "Riñón"
  },
  {
    "id": 3,
    "question": "¿Cuántos huesos tiene aproximadamente un adulto?",
    "optionA": "106",
    "optionB": "156",
    "optionC": "206",
    "optionD": "306",
    "correctAnswer": "206"
  },
  {
    "id": 4,
    "question": "¿Qué músculo trabaja constantemente durante toda la vida?",
    "optionA": "Bíceps",
    "optionB": "Tríceps",
    "optionC": "Corazón",
    "optionD": "Cuádriceps",
    "correctAnswer": "Corazón"
  },
  {
    "id": 5,
    "question": "¿Qué parte del ojo controla la cantidad de luz que entra?",
    "optionA": "Retina",
    "optionB": "Iris",
    "optionC": "Córnea",
    "optionD": "Cristalino",
    "correctAnswer": "Iris"
  },
  {
    "id": 6,
    "question": "¿Cuál es el órgano más grande del cuerpo humano?",
    "optionA": "Hígado",
    "optionB": "Pulmón",
    "optionC": "Cerebro",
    "optionD": "Piel",
    "correctAnswer": "Piel"
  },
  {
    "id": 7,
    "question": "¿Qué sistema del cuerpo transporta oxígeno y nutrientes?",
    "optionA": "Nervioso",
    "optionB": "Circulatorio",
    "optionC": "Digestivo",
    "optionD": "Endocrino",
    "correctAnswer": "Circulatorio"
  },
  {
    "id": 8,
    "question": "¿Dónde se encuentran los alvéolos?",
    "optionA": "Riñones",
    "optionB": "Pulmones",
    "optionC": "Estómago",
    "optionD": "Corazón",
    "correctAnswer": "Pulmones"
  },
  {
    "id": 9,
    "question": "¿Qué hueso protege el cerebro?",
    "optionA": "Columna vertebral",
    "optionB": "Costillas",
    "optionC": "Cráneo",
    "optionD": "Pelvis",
    "correctAnswer": "Cráneo"
  },
  {
    "id": 10,
    "question": "¿Qué parte del sistema nervioso actúa como centro de control?",
    "optionA": "Médula ósea",
    "optionB": "Corazón",
    "optionC": "Cerebro",
    "optionD": "Pulmón",
    "correctAnswer": "Cerebro"
  },
  {
    "id": 11,
    "question": "¿Qué tipo de sangre puede donar a cualquier grupo?",
    "optionA": "A+",
    "optionB": "B+",
    "optionC": "AB+",
    "optionD": "O-",
    "correctAnswer": "O-"
  },
  {
    "id": 12,
    "question": "¿Qué órgano produce la bilis?",
    "optionA": "Riñón",
    "optionB": "Hígado",
    "optionC": "Páncreas",
    "optionD": "Estómago",
    "correctAnswer": "Hígado"
  },
  {
    "id": 13,
    "question": "¿Qué célula combate infecciones?",
    "optionA": "Glóbulo rojo",
    "optionB": "Plaqueta",
    "optionC": "Glóbulo blanco",
    "optionD": "Neurona",
    "correctAnswer": "Glóbulo blanco"
  },
  {
    "id": 14,
    "question": "¿Qué parte del oído ayuda al equilibrio?",
    "optionA": "Tímpano",
    "optionB": "Cóclea",
    "optionC": "Oído interno",
    "optionD": "Pabellón auditivo",
    "correctAnswer": "Oído interno"
  },
  {
    "id": 15,
    "question": "¿Qué órgano produce insulina?",
    "optionA": "Hígado",
    "optionB": "Páncreas",
    "optionC": "Riñón",
    "optionD": "Bazo",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 16,
    "question": "¿Qué tejido conecta músculos con huesos?",
    "optionA": "Cartílago",
    "optionB": "Tendón",
    "optionC": "Ligamento",
    "optionD": "Dermis",
    "correctAnswer": "Tendón"
  },
  {
    "id": 17,
    "question": "¿Cuál es el hueso más pequeño del cuerpo?",
    "optionA": "Estribo",
    "optionB": "Radio",
    "optionC": "Rótula",
    "optionD": "Cúbito",
    "correctAnswer": "Estribo"
  },
  {
    "id": 18,
    "question": "¿Qué sistema regula las hormonas?",
    "optionA": "Digestivo",
    "optionB": "Endocrino",
    "optionC": "Respiratorio",
    "optionD": "Muscular",
    "correctAnswer": "Endocrino"
  },
  {
    "id": 19,
    "question": "¿Qué órgano ayuda a desintoxicar el cuerpo?",
    "optionA": "Hígado",
    "optionB": "Corazón",
    "optionC": "Pulmón",
    "optionD": "Piel",
    "correctAnswer": "Hígado"
  },
  {
    "id": 20,
    "question": "¿Qué parte de la sangre transporta oxígeno?",
    "optionA": "Plaquetas",
    "optionB": "Plasma",
    "optionC": "Glóbulos rojos",
    "optionD": "Linfocitos",
    "correctAnswer": "Glóbulos rojos"
  },
  {
    "id": 21,
    "question": "¿Cuál es la función principal de los pulmones?",
    "optionA": "Producir sangre",
    "optionB": "Intercambiar oxígeno y dióxido de carbono",
    "optionC": "Digestionar alimentos",
    "optionD": "Regular hormonas",
    "correctAnswer": "Intercambiar oxígeno y dióxido de carbono"
  },
  {
    "id": 22,
    "question": "¿Qué estructura conecta neuronas entre sí?",
    "optionA": "Sinapsis",
    "optionB": "Tendón",
    "optionC": "Válvula",
    "optionD": "Bronquio",
    "correctAnswer": "Sinapsis"
  },
  {
    "id": 23,
    "question": "¿Qué parte del sistema digestivo absorbe la mayor parte de los nutrientes?",
    "optionA": "Estómago",
    "optionB": "Esófago",
    "optionC": "Intestino delgado",
    "optionD": "Intestino grueso",
    "correctAnswer": "Intestino delgado"
  },
  {
    "id": 24,
    "question": "¿Qué glándula regula gran parte del sistema endocrino?",
    "optionA": "Tiroides",
    "optionB": "Hipófisis",
    "optionC": "Suprarrenal",
    "optionD": "Páncreas",
    "correctAnswer": "Hipófisis"
  },
  {
    "id": 25,
    "question": "¿Qué órgano regula el metabolismo corporal?",
    "optionA": "Tiroides",
    "optionB": "Pulmón",
    "optionC": "Riñón",
    "optionD": "Bazo",
    "correctAnswer": "Tiroides"
  },
  {
    "id": 26,
    "question": "¿Qué órgano almacena la orina?",
    "optionA": "Riñón",
    "optionB": "Vejiga",
    "optionC": "Uréter",
    "optionD": "Uretra",
    "correctAnswer": "Vejiga"
  },
  {
    "id": 27,
    "question": "¿Qué sistema corporal combate enfermedades?",
    "optionA": "Digestivo",
    "optionB": "Respiratorio",
    "optionC": "Inmunitario",
    "optionD": "Muscular",
    "correctAnswer": "Inmunitario"
  },
  {
    "id": 28,
    "question": "¿Qué estructura une hueso con hueso?",
    "optionA": "Tendón",
    "optionB": "Ligamento",
    "optionC": "Cartílago",
    "optionD": "Músculo",
    "correctAnswer": "Ligamento"
  },
  {
    "id": 29,
    "question": "¿Qué órgano permite percibir los sabores?",
    "optionA": "Nariz",
    "optionB": "Lengua",
    "optionC": "Ojo",
    "optionD": "Oído",
    "correctAnswer": "Lengua"
  },
  {
    "id": 30,
    "question": "¿Qué órgano elimina dióxido de carbono durante la respiración?",
    "optionA": "Pulmón",
    "optionB": "Riñón",
    "optionC": "Hígado",
    "optionD": "Bazo",
    "correctAnswer": "Pulmón"
  },
  {
    "id": 31,
    "question": "¿Cuál es la arteria más grande del cuerpo humano?",
    "optionA": "Aorta",
    "optionB": "Carótida",
    "optionC": "Pulmonar",
    "optionD": "Femoral",
    "correctAnswer": "Aorta"
  },
  {
    "id": 32,
    "question": "¿Qué válvula cardíaca separa la aurícula izquierda del ventrículo izquierdo?",
    "optionA": "Tricúspide",
    "optionB": "Pulmonar",
    "optionC": "Mitral",
    "optionD": "Aórtica",
    "correctAnswer": "Mitral"
  },
  {
    "id": 33,
    "question": "¿Qué cámara del corazón bombea sangre hacia los pulmones?",
    "optionA": "Aurícula izquierda",
    "optionB": "Aurícula derecha",
    "optionC": "Ventrículo izquierdo",
    "optionD": "Ventrículo derecho",
    "correctAnswer": "Ventrículo derecho"
  },
  {
    "id": 34,
    "question": "¿Qué estructura evita que los alimentos entren en la tráquea al tragar?",
    "optionA": "Úvula",
    "optionB": "Epiglotis",
    "optionC": "Amígdala",
    "optionD": "Glotis",
    "correctAnswer": "Epiglotis"
  },
  {
    "id": 35,
    "question": "¿Qué membrana recubre externamente los pulmones?",
    "optionA": "Peritoneo",
    "optionB": "Pleura",
    "optionC": "Meninge",
    "optionD": "Pericardio",
    "correctAnswer": "Pleura"
  },
  {
    "id": 36,
    "question": "¿Qué conducto lleva el aire desde la laringe hasta los bronquios?",
    "optionA": "Esófago",
    "optionB": "Uréter",
    "optionC": "Tráquea",
    "optionD": "Faringe",
    "correctAnswer": "Tráquea"
  },
  {
    "id": 37,
    "question": "¿Qué hormona disminuye la glucosa en sangre?",
    "optionA": "Adrenalina",
    "optionB": "Insulina",
    "optionC": "Cortisol",
    "optionD": "Glucagón",
    "correctAnswer": "Insulina"
  },
  {
    "id": 38,
    "question": "¿Qué glándula del cuello produce tiroxina?",
    "optionA": "Pineal",
    "optionB": "Hipófisis",
    "optionC": "Tiroides",
    "optionD": "Paratiroides",
    "correctAnswer": "Tiroides"
  },
  {
    "id": 39,
    "question": "¿Qué órgano produce melatonina, relacionada con el sueño?",
    "optionA": "Páncreas",
    "optionB": "Glándula pineal",
    "optionC": "Tiroides",
    "optionD": "Suprarrenal",
    "correctAnswer": "Glándula pineal"
  },
  {
    "id": 40,
    "question": "¿Qué parte del cerebro coordina principalmente el equilibrio y la postura?",
    "optionA": "Lóbulo frontal",
    "optionB": "Hipocampo",
    "optionC": "Cerebelo",
    "optionD": "Tálamo",
    "correctAnswer": "Cerebelo"
  },
  {
    "id": 41,
    "question": "¿Qué estructura conecta el cerebro con el resto del cuerpo a través de la columna?",
    "optionA": "Médula espinal",
    "optionB": "Hipotálamo",
    "optionC": "Cerebelo",
    "optionD": "Bulbo ocular",
    "correctAnswer": "Médula espinal"
  },
  {
    "id": 42,
    "question": "¿Qué parte del cerebro ayuda especialmente a formar recuerdos nuevos?",
    "optionA": "Amígdala",
    "optionB": "Hipocampo",
    "optionC": "Tronco encefálico",
    "optionD": "Tálamo",
    "correctAnswer": "Hipocampo"
  },
  {
    "id": 43,
    "question": "¿Qué parte del cerebro regula funciones automáticas como la respiración y el ritmo cardíaco?",
    "optionA": "Lóbulo parietal",
    "optionB": "Bulbo raquídeo",
    "optionC": "Hipocampo",
    "optionD": "Cuerpo calloso",
    "correctAnswer": "Bulbo raquídeo"
  },
  {
    "id": 44,
    "question": "¿Qué parte del ojo enfoca la luz sobre la retina?",
    "optionA": "Cristalino",
    "optionB": "Esclerótica",
    "optionC": "Iris",
    "optionD": "Conjuntiva",
    "correctAnswer": "Cristalino"
  },
  {
    "id": 45,
    "question": "¿Qué estructura del ojo es transparente y protege la parte frontal?",
    "optionA": "Retina",
    "optionB": "Córnea",
    "optionC": "Pupila",
    "optionD": "Párpado",
    "correctAnswer": "Córnea"
  },
  {
    "id": 46,
    "question": "¿Qué abertura del ojo permite la entrada de luz?",
    "optionA": "Retina",
    "optionB": "Cristalino",
    "optionC": "Pupila",
    "optionD": "Esclerótica",
    "correctAnswer": "Pupila"
  },
  {
    "id": 47,
    "question": "¿Qué estructura del oído transforma vibraciones en señales nerviosas?",
    "optionA": "Tímpano",
    "optionB": "Pabellón auditivo",
    "optionC": "Cóclea",
    "optionD": "Martillo",
    "correctAnswer": "Cóclea"
  },
  {
    "id": 48,
    "question": "¿Qué hueso forma la mandíbula inferior?",
    "optionA": "Maxilar",
    "optionB": "Mandíbula",
    "optionC": "Temporal",
    "optionD": "Nasal",
    "correctAnswer": "Mandíbula"
  },
  {
    "id": 49,
    "question": "¿Qué hueso es el más largo del cuerpo humano?",
    "optionA": "Húmero",
    "optionB": "Tibia",
    "optionC": "Peroné",
    "optionD": "Fémur",
    "correctAnswer": "Fémur"
  },
  {
    "id": 50,
    "question": "¿Qué hueso se encuentra en la parte lateral de la pierna?",
    "optionA": "Fémur",
    "optionB": "Tibia",
    "optionC": "Peroné",
    "optionD": "Rótula",
    "correctAnswer": "Peroné"
  },
  {
    "id": 51,
    "question": "¿Qué hueso del antebrazo está del lado del pulgar?",
    "optionA": "Cúbito",
    "optionB": "Radio",
    "optionC": "Húmero",
    "optionD": "Clavícula",
    "correctAnswer": "Radio"
  },
  {
    "id": 52,
    "question": "¿Qué hueso se sitúa en la parte anterior de la rodilla?",
    "optionA": "Tibia",
    "optionB": "Peroné",
    "optionC": "Rótula",
    "optionD": "Fémur",
    "correctAnswer": "Rótula"
  },
  {
    "id": 53,
    "question": "¿Qué hueso del hombro une el esternón con la escápula?",
    "optionA": "Húmero",
    "optionB": "Clavícula",
    "optionC": "Cúbito",
    "optionD": "Esternón",
    "correctAnswer": "Clavícula"
  },
  {
    "id": 54,
    "question": "¿Qué estructura protege los extremos de los huesos dentro de una articulación?",
    "optionA": "Tendón",
    "optionB": "Cartílago",
    "optionC": "Ligamento",
    "optionD": "Fascia",
    "correctAnswer": "Cartílago"
  },
  {
    "id": 55,
    "question": "¿Qué articulación permite doblar y estirar el codo como una bisagra?",
    "optionA": "Esférica",
    "optionB": "Plana",
    "optionC": "Bisagra",
    "optionD": "Silla de montar",
    "correctAnswer": "Bisagra"
  },
  {
    "id": 56,
    "question": "¿Qué componente de la sangre participa principalmente en la coagulación?",
    "optionA": "Plaquetas",
    "optionB": "Glóbulos rojos",
    "optionC": "Neutrófilos",
    "optionD": "Plasma",
    "correctAnswer": "Plaquetas"
  },
  {
    "id": 57,
    "question": "¿Qué proteína de los glóbulos rojos transporta oxígeno?",
    "optionA": "Colágeno",
    "optionB": "Hemoglobina",
    "optionC": "Insulina",
    "optionD": "Queratina",
    "correctAnswer": "Hemoglobina"
  },
  {
    "id": 58,
    "question": "¿Qué órgano del sistema inmunitario filtra la sangre y ayuda a combatir infecciones?",
    "optionA": "Bazo",
    "optionB": "Vejiga",
    "optionC": "Páncreas",
    "optionD": "Esófago",
    "correctAnswer": "Bazo"
  },
  {
    "id": 59,
    "question": "¿Qué tejido produce células sanguíneas en el interior de muchos huesos?",
    "optionA": "Cartílago",
    "optionB": "Médula ósea",
    "optionC": "Periostio",
    "optionD": "Ligamento",
    "correctAnswer": "Médula ósea"
  },
  {
    "id": 60,
    "question": "¿Qué parte del sistema digestivo conecta la boca con el estómago?",
    "optionA": "Tráquea",
    "optionB": "Esófago",
    "optionC": "Laringe",
    "optionD": "Diafragma",
    "correctAnswer": "Esófago"
  },
  {
    "id": 61,
    "question": "¿Qué órgano produce ácido clorhídrico para ayudar a la digestión?",
    "optionA": "Estómago",
    "optionB": "Hígado",
    "optionC": "Colon",
    "optionD": "Bazo",
    "correctAnswer": "Estómago"
  },
  {
    "id": 62,
    "question": "¿Qué parte del sistema digestivo absorbe principalmente agua?",
    "optionA": "Intestino delgado",
    "optionB": "Intestino grueso",
    "optionC": "Esófago",
    "optionD": "Estómago",
    "correctAnswer": "Intestino grueso"
  },
  {
    "id": 63,
    "question": "¿Qué órgano almacena la bilis antes de liberarla al intestino?",
    "optionA": "Páncreas",
    "optionB": "Vesícula biliar",
    "optionC": "Bazo",
    "optionD": "Riñón",
    "correctAnswer": "Vesícula biliar"
  },
  {
    "id": 64,
    "question": "¿Qué órgano produce enzimas digestivas además de hormonas?",
    "optionA": "Hígado",
    "optionB": "Páncreas",
    "optionC": "Bazo",
    "optionD": "Tiroides",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 65,
    "question": "¿Qué estructura separa el tórax del abdomen y ayuda a la respiración?",
    "optionA": "Diafragma",
    "optionB": "Pleura",
    "optionC": "Esternón",
    "optionD": "Peritoneo",
    "correctAnswer": "Diafragma"
  },
  {
    "id": 66,
    "question": "¿Qué unidad microscópica del riñón filtra la sangre?",
    "optionA": "Neurona",
    "optionB": "Nefrona",
    "optionC": "Alvéolo",
    "optionD": "Hepatocito",
    "correctAnswer": "Nefrona"
  },
  {
    "id": 67,
    "question": "¿Qué conductos llevan la orina desde los riñones hasta la vejiga?",
    "optionA": "Uretra",
    "optionB": "Uréteres",
    "optionC": "Bronquios",
    "optionD": "Arterias",
    "correctAnswer": "Uréteres"
  },
  {
    "id": 68,
    "question": "¿Qué hormona producida por el riñón estimula la formación de glóbulos rojos?",
    "optionA": "Eritropoyetina",
    "optionB": "Insulina",
    "optionC": "Melatonina",
    "optionD": "Calcitonina",
    "correctAnswer": "Eritropoyetina"
  },
  {
    "id": 69,
    "question": "¿Qué órgano ayuda a mantener el equilibrio de agua y sales minerales en el cuerpo?",
    "optionA": "Bazo",
    "optionB": "Riñón",
    "optionC": "Pulmón",
    "optionD": "Laringe",
    "correctAnswer": "Riñón"
  },
  {
    "id": 70,
    "question": "¿Qué glándulas producen hormonas relacionadas con la respuesta al estrés?",
    "optionA": "Salivales",
    "optionB": "Paratiroides",
    "optionC": "Suprarrenales",
    "optionD": "Sebáceas",
    "correctAnswer": "Suprarrenales"
  },
  {
    "id": 71,
    "question": "¿Qué glándulas ayudan a regular el calcio en sangre?",
    "optionA": "Paratiroides",
    "optionB": "Pineales",
    "optionC": "Sudoríparas",
    "optionD": "Mamarias",
    "correctAnswer": "Paratiroides"
  },
  {
    "id": 72,
    "question": "¿Qué vitamina es clave para la visión nocturna?",
    "optionA": "Vitamina A",
    "optionB": "Vitamina C",
    "optionC": "Vitamina E",
    "optionD": "Vitamina B12",
    "correctAnswer": "Vitamina A"
  },
  {
    "id": 73,
    "question": "¿Qué vitamina ayuda especialmente a la coagulación sanguínea?",
    "optionA": "Vitamina D",
    "optionB": "Vitamina K",
    "optionC": "Vitamina C",
    "optionD": "Vitamina B1",
    "correctAnswer": "Vitamina K"
  },
  {
    "id": 74,
    "question": "¿Qué vitamina favorece la absorción intestinal del calcio?",
    "optionA": "Vitamina A",
    "optionB": "Vitamina D",
    "optionC": "Vitamina E",
    "optionD": "Vitamina C",
    "correctAnswer": "Vitamina D"
  },
  {
    "id": 75,
    "question": "¿Qué estructura de la piel ayuda a regular la temperatura mediante la producción de sudor?",
    "optionA": "Glándulas sudoríparas",
    "optionB": "Folículos pilosos",
    "optionC": "Melanocitos",
    "optionD": "Capilares linfáticos",
    "correctAnswer": "Glándulas sudoríparas"
  },
  {
    "id": 76,
    "question": "¿Qué proteína da rigidez al cabello y a las uñas?",
    "optionA": "Colágeno",
    "optionB": "Queratina",
    "optionC": "Elastina",
    "optionD": "Actina",
    "correctAnswer": "Queratina"
  },
  {
    "id": 77,
    "question": "¿Qué capa de la piel está más al exterior?",
    "optionA": "Dermis",
    "optionB": "Hipodermis",
    "optionC": "Epidermis",
    "optionD": "Fascia",
    "correctAnswer": "Epidermis"
  },
  {
    "id": 78,
    "question": "¿Qué tejido muscular se mueve de forma voluntaria?",
    "optionA": "Liso",
    "optionB": "Cardíaco",
    "optionC": "Esquelético",
    "optionD": "Visceral",
    "correctAnswer": "Esquelético"
  },
  {
    "id": 79,
    "question": "¿Qué músculo se encuentra en la parte posterior del brazo?",
    "optionA": "Bíceps",
    "optionB": "Tríceps",
    "optionC": "Deltoides",
    "optionD": "Pectoral",
    "correctAnswer": "Tríceps"
  },
  {
    "id": 80,
    "question": "¿Qué tipo de sangre se considera receptor universal en el sistema ABO y Rh?",
    "optionA": "O-",
    "optionB": "A+",
    "optionC": "AB+",
    "optionD": "B-",
    "correctAnswer": "AB+"
  },
  {
    "id": 81,
    "question": "¿Qué venas llevan sangre desde los pulmones hasta la aurícula izquierda?",
    "optionA": "Venas cavas",
    "optionB": "Venas pulmonares",
    "optionC": "Venas renales",
    "optionD": "Venas yugulares",
    "correctAnswer": "Venas pulmonares"
  },
  {
    "id": 82,
    "question": "¿Qué vasos sanguíneos devuelven la sangre al corazón?",
    "optionA": "Arterias",
    "optionB": "Capilares",
    "optionC": "Venas",
    "optionD": "Arteriolas",
    "correctAnswer": "Venas"
  },
  {
    "id": 83,
    "question": "¿Qué cavidad del corazón recibe la sangre que regresa del cuerpo?",
    "optionA": "Aurícula derecha",
    "optionB": "Aurícula izquierda",
    "optionC": "Ventrículo izquierdo",
    "optionD": "Ventrículo derecho",
    "correctAnswer": "Aurícula derecha"
  },
  {
    "id": 84,
    "question": "¿Qué tabique separa la parte derecha e izquierda del corazón?",
    "optionA": "Miocardio",
    "optionB": "Septo",
    "optionC": "Pericardio",
    "optionD": "Endocardio",
    "correctAnswer": "Septo"
  },
  {
    "id": 85,
    "question": "¿Qué capa muscular del corazón se contrae para bombear sangre?",
    "optionA": "Pericardio",
    "optionB": "Miocardio",
    "optionC": "Endocardio",
    "optionD": "Pleura",
    "correctAnswer": "Miocardio"
  },
  {
    "id": 86,
    "question": "¿Qué estructura respiratoria se divide en bronquios derecho e izquierdo?",
    "optionA": "Laringe",
    "optionB": "Faringe",
    "optionC": "Tráquea",
    "optionD": "Pleura",
    "correctAnswer": "Tráquea"
  },
  {
    "id": 87,
    "question": "¿Qué conductos más pequeños nacen de los bronquios dentro de los pulmones?",
    "optionA": "Bronquiolos",
    "optionB": "Alvéolos",
    "optionC": "Uréteres",
    "optionD": "Capilares",
    "correctAnswer": "Bronquiolos"
  },
  {
    "id": 88,
    "question": "¿Qué estructura rodea directamente a los alvéolos para facilitar el intercambio gaseoso?",
    "optionA": "Tendones",
    "optionB": "Capilares",
    "optionC": "Nervios",
    "optionD": "Cartílagos",
    "correctAnswer": "Capilares"
  },
  {
    "id": 89,
    "question": "¿Qué parte de la faringe es común para el paso de aire y alimentos?",
    "optionA": "Nasofaringe",
    "optionB": "Orofaringe",
    "optionC": "Bronquio",
    "optionD": "Laringe",
    "correctAnswer": "Orofaringe"
  },
  {
    "id": 90,
    "question": "¿Qué órgano produce glucagón, hormona que eleva la glucosa en sangre?",
    "optionA": "Tiroides",
    "optionB": "Páncreas",
    "optionC": "Hígado",
    "optionD": "Hipófisis",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 91,
    "question": "¿Qué parte del encéfalo regula la temperatura corporal y muchas funciones hormonales?",
    "optionA": "Hipotálamo",
    "optionB": "Cerebelo",
    "optionC": "Hipocampo",
    "optionD": "Amígdala",
    "correctAnswer": "Hipotálamo"
  },
  {
    "id": 92,
    "question": "¿Qué lóbulo cerebral procesa principalmente la información visual?",
    "optionA": "Frontal",
    "optionB": "Temporal",
    "optionC": "Occipital",
    "optionD": "Parietal",
    "correctAnswer": "Occipital"
  },
  {
    "id": 93,
    "question": "¿Qué lóbulo cerebral procesa principalmente la información auditiva?",
    "optionA": "Parietal",
    "optionB": "Temporal",
    "optionC": "Occipital",
    "optionD": "Frontal",
    "correctAnswer": "Temporal"
  },
  {
    "id": 94,
    "question": "¿Qué membranas protegen el cerebro y la médula espinal?",
    "optionA": "Pleuras",
    "optionB": "Meninges",
    "optionC": "Sinapsis",
    "optionD": "Fascias",
    "correctAnswer": "Meninges"
  },
  {
    "id": 95,
    "question": "¿Qué parte blanca del ojo forma su capa externa resistente?",
    "optionA": "Retina",
    "optionB": "Córnea",
    "optionC": "Esclerótica",
    "optionD": "Pupila",
    "correctAnswer": "Esclerótica"
  },
  {
    "id": 96,
    "question": "¿Qué membrana transparente recubre la parte blanca del ojo y el interior de los párpados?",
    "optionA": "Conjuntiva",
    "optionB": "Retina",
    "optionC": "Esclerótica",
    "optionD": "Coroides",
    "correctAnswer": "Conjuntiva"
  },
  {
    "id": 97,
    "question": "¿Qué glándula produce las lágrimas?",
    "optionA": "Salival",
    "optionB": "Sebácea",
    "optionC": "Lagrimal",
    "optionD": "Pineal",
    "correctAnswer": "Lagrimal"
  },
  {
    "id": 98,
    "question": "¿Qué conducto comunica el oído medio con la garganta?",
    "optionA": "Canal semicircular",
    "optionB": "Trompa de Eustaquio",
    "optionC": "Cóclea",
    "optionD": "Conducto lagrimal",
    "correctAnswer": "Trompa de Eustaquio"
  },
  {
    "id": 99,
    "question": "¿Qué hueso plano se encuentra en el centro del pecho?",
    "optionA": "Clavícula",
    "optionB": "Escápula",
    "optionC": "Esternón",
    "optionD": "Húmero",
    "correctAnswer": "Esternón"
  },
  {
    "id": 100,
    "question": "¿Qué hueso también se conoce como omóplato?",
    "optionA": "Escápula",
    "optionB": "Rótula",
    "optionC": "Ilion",
    "optionD": "Cúbito",
    "correctAnswer": "Escápula"
  },
  {
    "id": 101,
    "question": "¿Qué huesos forman los dedos de la mano?",
    "optionA": "Carpos",
    "optionB": "Metacarpos",
    "optionC": "Falanges",
    "optionD": "Tarsos",
    "correctAnswer": "Falanges"
  },
  {
    "id": 102,
    "question": "¿Qué huesos forman el tobillo y parte del pie posterior?",
    "optionA": "Carpos",
    "optionB": "Tarsos",
    "optionC": "Falanges",
    "optionD": "Metacarpos",
    "correctAnswer": "Tarsos"
  },
  {
    "id": 103,
    "question": "¿Qué hueso de la cadera forma la parte superior y más amplia de la pelvis?",
    "optionA": "Pubis",
    "optionB": "Isquion",
    "optionC": "Ilion",
    "optionD": "Sacro",
    "correctAnswer": "Ilion"
  },
  {
    "id": 104,
    "question": "¿Qué tendón une los músculos de la pantorrilla con el talón?",
    "optionA": "Rotuliano",
    "optionB": "De Aquiles",
    "optionC": "Del bíceps",
    "optionD": "Flexor",
    "correctAnswer": "De Aquiles"
  },
  {
    "id": 105,
    "question": "¿Qué mineral es esencial para la formación de hemoglobina?",
    "optionA": "Zinc",
    "optionB": "Hierro",
    "optionC": "Sodio",
    "optionD": "Yodo",
    "correctAnswer": "Hierro"
  },
  {
    "id": 106,
    "question": "¿Qué grupo de glóbulos blancos puede transformarse en macrófagos en los tejidos?",
    "optionA": "Monocitos",
    "optionB": "Eritrocitos",
    "optionC": "Plaquetas",
    "optionD": "Basófilos",
    "correctAnswer": "Monocitos"
  },
  {
    "id": 107,
    "question": "¿Qué vasos del sistema linfático filtran la linfa en pequeños órganos repartidos por el cuerpo?",
    "optionA": "Nódulos linfáticos",
    "optionB": "Ventrículos",
    "optionC": "Alvéolos",
    "optionD": "Neuronas",
    "correctAnswer": "Nódulos linfáticos"
  },
  {
    "id": 108,
    "question": "¿Qué órgano participa en la maduración de ciertos linfocitos durante la infancia?",
    "optionA": "Timo",
    "optionB": "Bazo",
    "optionC": "Páncreas",
    "optionD": "Colon",
    "correctAnswer": "Timo"
  },
  {
    "id": 109,
    "question": "¿Qué enzima de la saliva comienza la digestión del almidón?",
    "optionA": "Pepsina",
    "optionB": "Lipasa",
    "optionC": "Amilasa",
    "optionD": "Lactasa",
    "correctAnswer": "Amilasa"
  },
  {
    "id": 110,
    "question": "¿Qué parte del intestino delgado recibe primero el contenido que sale del estómago?",
    "optionA": "Íleon",
    "optionB": "Yeyuno",
    "optionC": "Duodeno",
    "optionD": "Colon",
    "correctAnswer": "Duodeno"
  },
  {
    "id": 111,
    "question": "¿Qué pequeñas proyecciones del intestino delgado aumentan la superficie de absorción?",
    "optionA": "Vellosidades",
    "optionB": "Alvéolos",
    "optionC": "Papilas",
    "optionD": "Neuritas",
    "correctAnswer": "Vellosidades"
  },
  {
    "id": 112,
    "question": "¿Qué apertura muscular controla la salida del estómago hacia el intestino delgado?",
    "optionA": "Cardias",
    "optionB": "Píloro",
    "optionC": "Esfínter anal",
    "optionD": "Uretra",
    "correctAnswer": "Píloro"
  },
  {
    "id": 113,
    "question": "¿Qué órgano transforma amoníaco en urea para facilitar su eliminación?",
    "optionA": "Riñón",
    "optionB": "Hígado",
    "optionC": "Bazo",
    "optionD": "Páncreas",
    "correctAnswer": "Hígado"
  },
  {
    "id": 114,
    "question": "¿Qué conducto lleva la orina desde la vejiga al exterior?",
    "optionA": "Uréter",
    "optionB": "Uretra",
    "optionC": "Esófago",
    "optionD": "Bronquio",
    "correctAnswer": "Uretra"
  },
  {
    "id": 115,
    "question": "¿Qué parte del riñón contiene la pelvis renal, donde se recoge la orina antes de pasar al uréter?",
    "optionA": "Hilio renal",
    "optionB": "Pelvis renal",
    "optionC": "Nefrona",
    "optionD": "Glomérulo",
    "correctAnswer": "Pelvis renal"
  },
  {
    "id": 116,
    "question": "¿Qué estructura del nefrón realiza la filtración inicial de la sangre?",
    "optionA": "Asa de Henle",
    "optionB": "Glomérulo",
    "optionC": "Túbulo colector",
    "optionD": "Uréter",
    "correctAnswer": "Glomérulo"
  },
  {
    "id": 117,
    "question": "¿Qué hormona de la hipófisis estimula el crecimiento corporal durante la infancia y adolescencia?",
    "optionA": "Prolactina",
    "optionB": "Hormona del crecimiento",
    "optionC": "Insulina",
    "optionD": "Melatonina",
    "correctAnswer": "Hormona del crecimiento"
  },
  {
    "id": 118,
    "question": "¿Qué glándula produce calcitonina?",
    "optionA": "Suprarrenal",
    "optionB": "Tiroides",
    "optionC": "Pineal",
    "optionD": "Parótida",
    "correctAnswer": "Tiroides"
  },
  {
    "id": 119,
    "question": "¿Qué vitamina es también conocida como ácido ascórbico?",
    "optionA": "Vitamina A",
    "optionB": "Vitamina B12",
    "optionC": "Vitamina C",
    "optionD": "Vitamina E",
    "correctAnswer": "Vitamina C"
  },
  {
    "id": 120,
    "question": "¿Qué vitamina ayuda a proteger las células frente al daño oxidativo?",
    "optionA": "Vitamina E",
    "optionB": "Vitamina K",
    "optionC": "Vitamina D",
    "optionD": "Vitamina B1",
    "correctAnswer": "Vitamina E"
  },
  {
    "id": 121,
    "question": "¿Qué células de la piel producen melanina?",
    "optionA": "Queratinocitos",
    "optionB": "Melanocitos",
    "optionC": "Fibroblastos",
    "optionD": "Neuronas",
    "correctAnswer": "Melanocitos"
  },
  {
    "id": 122,
    "question": "¿Qué capa de la piel contiene folículos pilosos y muchas glándulas?",
    "optionA": "Epidermis",
    "optionB": "Dermis",
    "optionC": "Esclerótica",
    "optionD": "Periostio",
    "correctAnswer": "Dermis"
  },
  {
    "id": 123,
    "question": "¿Qué tejido conecta y da soporte a otros tejidos y órganos?",
    "optionA": "Epitelial",
    "optionB": "Conectivo",
    "optionC": "Nervioso",
    "optionD": "Muscular cardíaco",
    "correctAnswer": "Conectivo"
  },
  {
    "id": 124,
    "question": "¿Qué sistema nervioso controla principalmente los movimientos voluntarios?",
    "optionA": "Autónomo",
    "optionB": "Somático",
    "optionC": "Linfático",
    "optionD": "Endocrino",
    "correctAnswer": "Somático"
  },
  {
    "id": 125,
    "question": "¿Qué zona del cerebro participa de forma importante en el lenguaje hablado?",
    "optionA": "Área de Broca",
    "optionB": "Cerebelo",
    "optionC": "Hipocampo",
    "optionD": "Bulbo raquídeo",
    "correctAnswer": "Área de Broca"
  },
  {
    "id": 126,
    "question": "¿Qué estructura del sistema nervioso permite respuestas rápidas e involuntarias ante un estímulo?",
    "optionA": "Reflejo",
    "optionB": "Hormona",
    "optionC": "Cartílago",
    "optionD": "Ligamento",
    "correctAnswer": "Reflejo"
  },
  {
    "id": 127,
    "question": "¿Qué órgano recibe el quimo desde el estómago y continúa gran parte de la digestión química?",
    "optionA": "Duodeno",
    "optionB": "Esófago",
    "optionC": "Bazo",
    "optionD": "Laringe",
    "correctAnswer": "Duodeno"
  },
  {
    "id": 128,
    "question": "¿Qué líquido claro llena la parte posterior del globo ocular?",
    "optionA": "Bilis",
    "optionB": "Humor vítreo",
    "optionC": "Sangre",
    "optionD": "Linfa",
    "correctAnswer": "Humor vítreo"
  },
  {
    "id": 129,
    "question": "¿Qué parte del oído externo ayuda a captar las ondas sonoras?",
    "optionA": "Cóclea",
    "optionB": "Pabellón auditivo",
    "optionC": "Yunque",
    "optionD": "Canales semicirculares",
    "correctAnswer": "Pabellón auditivo"
  },
  {
    "id": 130,
    "question": "¿Qué membrana envuelve y protege al corazón?",
    "optionA": "Pleura",
    "optionB": "Peritoneo",
    "optionC": "Pericardio",
    "optionD": "Meninge",
    "correctAnswer": "Pericardio"
  },
  {
    "id": 131,
    "question": "¿Qué tipo de músculo se encuentra en órganos internos como el intestino?",
    "optionA": "Esquelético",
    "optionB": "Cardíaco",
    "optionC": "Liso",
    "optionD": "Voluntario",
    "correctAnswer": "Liso"
  },
  {
    "id": 132,
    "question": "¿Qué estructura permite el intercambio de nutrientes y desechos en los tejidos?",
    "optionA": "Arterias",
    "optionB": "Capilares",
    "optionC": "Venas",
    "optionD": "Bronquios",
    "correctAnswer": "Capilares"
  },
  {
    "id": 133,
    "question": "¿Qué parte del sistema nervioso controla funciones automáticas como la digestión?",
    "optionA": "Somático",
    "optionB": "Central",
    "optionC": "Autónomo",
    "optionD": "Sensitivo",
    "correctAnswer": "Autónomo"
  },
  {
    "id": 134,
    "question": "¿Qué componente de la sangre es mayoritariamente agua?",
    "optionA": "Plaquetas",
    "optionB": "Plasma",
    "optionC": "Glóbulos rojos",
    "optionD": "Leucocitos",
    "correctAnswer": "Plasma"
  },
  {
    "id": 135,
    "question": "¿Qué estructura permite la unión de músculos a huesos por contracción?",
    "optionA": "Ligamento",
    "optionB": "Cartílago",
    "optionC": "Tendón",
    "optionD": "Fascia",
    "correctAnswer": "Tendón"
  },
  {
    "id": 136,
    "question": "¿Qué órgano produce jugo gástrico?",
    "optionA": "Hígado",
    "optionB": "Estómago",
    "optionC": "Páncreas",
    "optionD": "Colon",
    "correctAnswer": "Estómago"
  },
  {
    "id": 137,
    "question": "¿Qué glándula produce adrenalina?",
    "optionA": "Tiroides",
    "optionB": "Suprarrenal",
    "optionC": "Pineal",
    "optionD": "Hipófisis",
    "correctAnswer": "Suprarrenal"
  },
  {
    "id": 138,
    "question": "¿Qué parte del cuerpo humano es responsable del olfato?",
    "optionA": "Lengua",
    "optionB": "Nariz",
    "optionC": "Ojo",
    "optionD": "Oído",
    "correctAnswer": "Nariz"
  },
  {
    "id": 139,
    "question": "¿Qué hueso forma parte de la caja torácica?",
    "optionA": "Fémur",
    "optionB": "Costilla",
    "optionC": "Radio",
    "optionD": "Tibia",
    "correctAnswer": "Costilla"
  },
  {
    "id": 140,
    "question": "¿Qué órgano regula el nivel de glucosa en sangre junto con el páncreas?",
    "optionA": "Bazo",
    "optionB": "Hígado",
    "optionC": "Pulmón",
    "optionD": "Corazón",
    "correctAnswer": "Hígado"
  },
  {
    "id": 141,
    "question": "¿Qué estructura separa las cavidades derecha e izquierda de la nariz?",
    "optionA": "Cornetes",
    "optionB": "Tabique nasal",
    "optionC": "Paladar",
    "optionD": "Faringe",
    "correctAnswer": "Tabique nasal"
  },
  {
    "id": 142,
    "question": "¿Qué tipo de articulación permite movimiento en varias direcciones como el hombro?",
    "optionA": "Bisagra",
    "optionB": "Plana",
    "optionC": "Esférica",
    "optionD": "Fija",
    "correctAnswer": "Esférica"
  },
  {
    "id": 143,
    "question": "¿Qué órgano produce enzimas para digerir proteínas?",
    "optionA": "Estómago",
    "optionB": "Riñón",
    "optionC": "Bazo",
    "optionD": "Vejiga",
    "correctAnswer": "Estómago"
  },
  {
    "id": 144,
    "question": "¿Qué parte del sistema respiratorio contiene las cuerdas vocales?",
    "optionA": "Tráquea",
    "optionB": "Laringe",
    "optionC": "Bronquio",
    "optionD": "Faringe",
    "correctAnswer": "Laringe"
  },
  {
    "id": 145,
    "question": "¿Qué tejido permite la comunicación rápida entre partes del cuerpo?",
    "optionA": "Muscular",
    "optionB": "Óseo",
    "optionC": "Nervioso",
    "optionD": "Epitelial",
    "correctAnswer": "Nervioso"
  },
  {
    "id": 146,
    "question": "¿Qué órgano se encarga de producir la mayor parte del colesterol?",
    "optionA": "Riñón",
    "optionB": "Hígado",
    "optionC": "Páncreas",
    "optionD": "Estómago",
    "correctAnswer": "Hígado"
  },
  {
    "id": 147,
    "question": "¿Qué sistema permite el movimiento del cuerpo en conjunto?",
    "optionA": "Digestivo",
    "optionB": "Musculoesquelético",
    "optionC": "Endocrino",
    "optionD": "Inmunitario",
    "correctAnswer": "Musculoesquelético"
  },
  {
    "id": 148,
    "question": "¿Qué líquido transporta grasas absorbidas en el intestino?",
    "optionA": "Sangre",
    "optionB": "Linfa",
    "optionC": "Bilis",
    "optionD": "Orina",
    "correctAnswer": "Linfa"
  },
  {
    "id": 149,
    "question": "¿Qué órgano participa en la filtración de la linfa?",
    "optionA": "Hígado",
    "optionB": "Nódulos linfáticos",
    "optionC": "Pulmón",
    "optionD": "Estómago",
    "correctAnswer": "Nódulos linfáticos"
  },
  {
    "id": 150,
    "question": "¿Qué parte del sistema digestivo inicia la digestión mecánica?",
    "optionA": "Estómago",
    "optionB": "Boca",
    "optionC": "Esófago",
    "optionD": "Colon",
    "correctAnswer": "Boca"
  },
  {
    "id": 151,
    "question": "¿Qué tipo de célula transmite impulsos eléctricos en el cuerpo?",
    "optionA": "Glóbulo rojo",
    "optionB": "Neurona",
    "optionC": "Plaqueta",
    "optionD": "Miocito",
    "correctAnswer": "Neurona"
  },
  {
    "id": 152,
    "question": "¿Qué parte del cerebro gestiona el pensamiento lógico?",
    "optionA": "Cerebelo",
    "optionB": "Lóbulo frontal",
    "optionC": "Tálamo",
    "optionD": "Hipotálamo",
    "correctAnswer": "Lóbulo frontal"
  },
  {
    "id": 153,
    "question": "¿Qué órgano contiene los bronquios?",
    "optionA": "Pulmón",
    "optionB": "Corazón",
    "optionC": "Hígado",
    "optionD": "Riñón",
    "correctAnswer": "Pulmón"
  },
  {
    "id": 154,
    "question": "¿Qué estructura ayuda a cerrar la tráquea al tragar?",
    "optionA": "Glotis",
    "optionB": "Epiglotis",
    "optionC": "Faringe",
    "optionD": "Paladar",
    "correctAnswer": "Epiglotis"
  },
  {
    "id": 155,
    "question": "¿Qué órgano produce la mayor parte de proteínas plasmáticas?",
    "optionA": "Páncreas",
    "optionB": "Hígado",
    "optionC": "Riñón",
    "optionD": "Intestino",
    "correctAnswer": "Hígado"
  },
  {
    "id": 156,
    "question": "¿Qué tipo de sangre no tiene antígenos A ni B?",
    "optionA": "A",
    "optionB": "B",
    "optionC": "AB",
    "optionD": "O",
    "correctAnswer": "O"
  },
  {
    "id": 157,
    "question": "¿Qué órgano almacena y libera sangre adicional cuando es necesario?",
    "optionA": "Bazo",
    "optionB": "Pulmón",
    "optionC": "Riñón",
    "optionD": "Tiroides",
    "correctAnswer": "Bazo"
  },
  {
    "id": 158,
    "question": "¿Qué parte del ojo detecta la luz y el color?",
    "optionA": "Retina",
    "optionB": "Iris",
    "optionC": "Córnea",
    "optionD": "Cristalino",
    "correctAnswer": "Retina"
  },
  {
    "id": 159,
    "question": "¿Qué parte del sistema endocrino regula el estrés?",
    "optionA": "Hipófisis",
    "optionB": "Suprarrenales",
    "optionC": "Tiroides",
    "optionD": "Páncreas",
    "correctAnswer": "Suprarrenales"
  },
  {
    "id": 160,
    "question": "¿Qué hueso protege los pulmones?",
    "optionA": "Costillas",
    "optionB": "Cráneo",
    "optionC": "Pelvis",
    "optionD": "Radio",
    "correctAnswer": "Costillas"
  },
  {
    "id": 161,
    "question": "¿Qué estructura del sistema digestivo transporta alimentos al estómago?",
    "optionA": "Tráquea",
    "optionB": "Esófago",
    "optionC": "Bronquio",
    "optionD": "Vejiga",
    "correctAnswer": "Esófago"
  },
  {
    "id": 162,
    "question": "¿Qué órgano principal produce la orina?",
    "optionA": "Vejiga",
    "optionB": "Riñón",
    "optionC": "Uréter",
    "optionD": "Uretra",
    "correctAnswer": "Riñón"
  },
  {
    "id": 163,
    "question": "¿Qué parte del sistema nervioso incluye el cerebro y la médula espinal?",
    "optionA": "Periférico",
    "optionB": "Autónomo",
    "optionC": "Central",
    "optionD": "Sensorial",
    "correctAnswer": "Central"
  },
  {
    "id": 164,
    "question": "¿Qué tipo de célula transporta oxígeno en la sangre?",
    "optionA": "Leucocito",
    "optionB": "Eritrocito",
    "optionC": "Plaqueta",
    "optionD": "Macrófago",
    "correctAnswer": "Eritrocito"
  },
  {
    "id": 165,
    "question": "¿Qué órgano filtra toxinas y metaboliza medicamentos?",
    "optionA": "Riñón",
    "optionB": "Pulmón",
    "optionC": "Hígado",
    "optionD": "Bazo",
    "correctAnswer": "Hígado"
  },
  {
    "id": 166,
    "question": "¿Qué parte del oído ayuda a mantener el equilibrio?",
    "optionA": "Oído interno",
    "optionB": "Tímpano",
    "optionC": "Martillo",
    "optionD": "Cóclea",
    "correctAnswer": "Oído interno"
  },
  {
    "id": 167,
    "question": "¿Qué órgano forma parte del sistema respiratorio y digestivo?",
    "optionA": "Pulmón",
    "optionB": "Faringe",
    "optionC": "Vejiga",
    "optionD": "Bazo",
    "correctAnswer": "Faringe"
  },
  {
    "id": 168,
    "question": "¿Qué hueso conecta el brazo con el hombro?",
    "optionA": "Radio",
    "optionB": "Cúbito",
    "optionC": "Húmero",
    "optionD": "Clavícula",
    "correctAnswer": "Húmero"
  },
  {
    "id": 169,
    "question": "¿Qué parte del cuerpo contiene cordones nerviosos?",
    "optionA": "Médula espinal",
    "optionB": "Intestino",
    "optionC": "Vejiga",
    "optionD": "Hígado",
    "correctAnswer": "Médula espinal"
  },
  {
    "id": 170,
    "question": "¿Qué sistema es responsable de eliminar desechos líquidos?",
    "optionA": "Digestivo",
    "optionB": "Respiratorio",
    "optionC": "Urinario",
    "optionD": "Endocrino",
    "correctAnswer": "Urinario"
  },
  {
    "id": 171,
    "question": "¿Qué parte del ojo contiene el cristalino?",
    "optionA": "Interior del ojo",
    "optionB": "Iris",
    "optionC": "Párpado",
    "optionD": "Córnea",
    "correctAnswer": "Interior del ojo"
  },
  {
    "id": 172,
    "question": "¿Qué órgano participa en la protección inmunitaria en la garganta?",
    "optionA": "Amígdalas",
    "optionB": "Páncreas",
    "optionC": "Tiroides",
    "optionD": "Pulmón",
    "correctAnswer": "Amígdalas"
  },
  {
    "id": 173,
    "question": "¿Qué tipo de articulaciones no permiten movimiento?",
    "optionA": "Móviles",
    "optionB": "Semimóviles",
    "optionC": "Fijas",
    "optionD": "Flexibles",
    "correctAnswer": "Fijas"
  },
  {
    "id": 174,
    "question": "¿Qué órgano regula la presión arterial junto con los riñones?",
    "optionA": "Pulmón",
    "optionB": "Corazón",
    "optionC": "Bazo",
    "optionD": "Lengua",
    "correctAnswer": "Corazón"
  },
  {
    "id": 175,
    "question": "¿Qué sistema produce y libera hormonas?",
    "optionA": "Respiratorio",
    "optionB": "Endocrino",
    "optionC": "Digestivo",
    "optionD": "Muscular",
    "correctAnswer": "Endocrino"
  },
  {
    "id": 176,
    "question": "¿Qué órgano ayuda a absorber grasas en el sistema digestivo?",
    "optionA": "Páncreas",
    "optionB": "Intestino delgado",
    "optionC": "Colon",
    "optionD": "Vejiga",
    "correctAnswer": "Intestino delgado"
  },
  {
    "id": 177,
    "question": "¿Qué parte de la sangre combate virus y bacterias?",
    "optionA": "Plaquetas",
    "optionB": "Glóbulos blancos",
    "optionC": "Glóbulos rojos",
    "optionD": "Plasma",
    "correctAnswer": "Glóbulos blancos"
  },
  {
    "id": 178,
    "question": "¿Qué órgano produce jugos digestivos con enzimas?",
    "optionA": "Páncreas",
    "optionB": "Riñón",
    "optionC": "Pulmón",
    "optionD": "Bazo",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 179,
    "question": "¿Qué estructura del cuerpo humano protege la médula espinal?",
    "optionA": "Costillas",
    "optionB": "Columna vertebral",
    "optionC": "Cráneo",
    "optionD": "Pelvis",
    "correctAnswer": "Columna vertebral"
  },
  {
    "id": 180,
    "question": "¿Qué órgano principal bombea sangre por todo el cuerpo?",
    "optionA": "Pulmón",
    "optionB": "Corazón",
    "optionC": "Hígado",
    "optionD": "Riñón",
    "correctAnswer": "Corazón"
  },
  {
    "id": 181,
    "question": "¿Qué estructura celular contiene el ADN?",
    "optionA": "Mitocondria",
    "optionB": "Núcleo",
    "optionC": "Membrana",
    "optionD": "Ribosoma",
    "correctAnswer": "Núcleo"
  },
  {
    "id": 182,
    "question": "¿Qué orgánulo produce energía en la célula?",
    "optionA": "Núcleo",
    "optionB": "Mitocondria",
    "optionC": "Ribosoma",
    "optionD": "Lisosoma",
    "correctAnswer": "Mitocondria"
  },
  {
    "id": 183,
    "question": "¿Qué tipo de tejido cubre superficies y órganos?",
    "optionA": "Nervioso",
    "optionB": "Muscular",
    "optionC": "Epitelial",
    "optionD": "Óseo",
    "correctAnswer": "Epitelial"
  },
  {
    "id": 184,
    "question": "¿Qué sistema transporta hormonas por el cuerpo?",
    "optionA": "Digestivo",
    "optionB": "Circulatorio",
    "optionC": "Respiratorio",
    "optionD": "Muscular",
    "correctAnswer": "Circulatorio"
  },
  {
    "id": 185,
    "question": "¿Qué parte del cuerpo regula la temperatura mediante el sudor?",
    "optionA": "Pulmón",
    "optionB": "Piel",
    "optionC": "Hígado",
    "optionD": "Riñón",
    "correctAnswer": "Piel"
  },
  {
    "id": 186,
    "question": "¿Qué célula del sistema inmunitario produce anticuerpos?",
    "optionA": "Neurona",
    "optionB": "Linfocito",
    "optionC": "Plaqueta",
    "optionD": "Eritrocito",
    "correctAnswer": "Linfocito"
  },
  {
    "id": 187,
    "question": "¿Qué estructura conecta el músculo al hueso?",
    "optionA": "Cartílago",
    "optionB": "Ligamento",
    "optionC": "Tendón",
    "optionD": "Nervio",
    "correctAnswer": "Tendón"
  },
  {
    "id": 188,
    "question": "¿Qué órgano produce ácido para descomponer alimentos?",
    "optionA": "Páncreas",
    "optionB": "Estómago",
    "optionC": "Hígado",
    "optionD": "Intestino",
    "correctAnswer": "Estómago"
  },
  {
    "id": 189,
    "question": "¿Qué estructura protege el corazón?",
    "optionA": "Pulmón",
    "optionB": "Pericardio",
    "optionC": "Diafragma",
    "optionD": "Pleura",
    "correctAnswer": "Pericardio"
  },
  {
    "id": 190,
    "question": "¿Qué sistema transporta linfa?",
    "optionA": "Nervioso",
    "optionB": "Linfático",
    "optionC": "Muscular",
    "optionD": "Digestivo",
    "correctAnswer": "Linfático"
  },
  {
    "id": 191,
    "question": "¿Qué gas es esencial para la respiración celular?",
    "optionA": "CO2",
    "optionB": "O2",
    "optionC": "N2",
    "optionD": "H2",
    "correctAnswer": "O2"
  },
  {
    "id": 192,
    "question": "¿Qué órgano controla los movimientos voluntarios?",
    "optionA": "Cerebro",
    "optionB": "Pulmón",
    "optionC": "Corazón",
    "optionD": "Riñón",
    "correctAnswer": "Cerebro"
  },
  {
    "id": 193,
    "question": "¿Qué parte del oído detecta vibraciones?",
    "optionA": "Cóclea",
    "optionB": "Tímpano",
    "optionC": "Pabellón",
    "optionD": "Canales semicirculares",
    "correctAnswer": "Tímpano"
  },
  {
    "id": 194,
    "question": "¿Qué órgano elimina urea mediante la orina?",
    "optionA": "Pulmón",
    "optionB": "Riñón",
    "optionC": "Hígado",
    "optionD": "Estómago",
    "correctAnswer": "Riñón"
  },
  {
    "id": 195,
    "question": "¿Qué estructura permite el paso de sangre en una sola dirección en el corazón?",
    "optionA": "Arteria",
    "optionB": "Válvula",
    "optionC": "Capilar",
    "optionD": "Vena",
    "correctAnswer": "Válvula"
  },
  {
    "id": 196,
    "question": "¿Qué sistema controla la producción hormonal?",
    "optionA": "Digestivo",
    "optionB": "Endocrino",
    "optionC": "Respiratorio",
    "optionD": "Muscular",
    "correctAnswer": "Endocrino"
  },
  {
    "id": 197,
    "question": "¿Qué órgano detecta los sonidos?",
    "optionA": "Nariz",
    "optionB": "Oído",
    "optionC": "Lengua",
    "optionD": "Ojo",
    "correctAnswer": "Oído"
  },
  {
    "id": 198,
    "question": "¿Qué parte del sistema digestivo produce enzimas pancreáticas?",
    "optionA": "Estómago",
    "optionB": "Hígado",
    "optionC": "Páncreas",
    "optionD": "Esófago",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 199,
    "question": "¿Qué tejido permite la contracción para generar movimiento?",
    "optionA": "Óseo",
    "optionB": "Muscular",
    "optionC": "Nervioso",
    "optionD": "Epitelial",
    "correctAnswer": "Muscular"
  },
  {
    "id": 200,
    "question": "¿Qué órgano transporta oxígeno desde los pulmones al cuerpo?",
    "optionA": "Riñón",
    "optionB": "Corazón",
    "optionC": "Hígado",
    "optionD": "Bazo",
    "correctAnswer": "Corazón"
  },
  {
    "id": 201,
    "question": "¿Qué parte del cerebro controla el equilibrio?",
    "optionA": "Cerebelo",
    "optionB": "Hipotálamo",
    "optionC": "Tálamo",
    "optionD": "Tronco",
    "correctAnswer": "Cerebelo"
  },
  {
    "id": 202,
    "question": "¿Qué tipo de sangre es considerado donante universal?",
    "optionA": "A+",
    "optionB": "B+",
    "optionC": "AB+",
    "optionD": "O-",
    "correctAnswer": "O-"
  },
  {
    "id": 203,
    "question": "¿Qué órgano participa en la digestión de lípidos mediante la bilis?",
    "optionA": "Riñón",
    "optionB": "Hígado",
    "optionC": "Pulmón",
    "optionD": "Vejiga",
    "correctAnswer": "Hígado"
  },
  {
    "id": 204,
    "question": "¿Qué estructura del ojo determina el color de los ojos?",
    "optionA": "Retina",
    "optionB": "Iris",
    "optionC": "Córnea",
    "optionD": "Pupila",
    "correctAnswer": "Iris"
  },
  {
    "id": 205,
    "question": "¿Qué órgano genera la voz?",
    "optionA": "Bronquio",
    "optionB": "Laringe",
    "optionC": "Esófago",
    "optionD": "Pulmón",
    "correctAnswer": "Laringe"
  },
  {
    "id": 206,
    "question": "¿Qué sistema corporal transporta oxígeno?",
    "optionA": "Respiratorio",
    "optionB": "Digestivo",
    "optionC": "Circulatorio",
    "optionD": "Endocrino",
    "correctAnswer": "Circulatorio"
  },
  {
    "id": 207,
    "question": "¿Qué estructura conecta el cerebro con el sistema nervioso periférico?",
    "optionA": "Cerebelo",
    "optionB": "Médula espinal",
    "optionC": "Hipotálamo",
    "optionD": "Tronco encefálico",
    "correctAnswer": "Médula espinal"
  },
  {
    "id": 208,
    "question": "¿Qué órgano regula líquidos corporales?",
    "optionA": "Pulmón",
    "optionB": "Riñón",
    "optionC": "Hígado",
    "optionD": "Estómago",
    "correctAnswer": "Riñón"
  },
  {
    "id": 209,
    "question": "¿Qué musculo permite flexionar el brazo?",
    "optionA": "Tríceps",
    "optionB": "Bíceps",
    "optionC": "Deltoides",
    "optionD": "Pectoral",
    "correctAnswer": "Bíceps"
  },
  {
    "id": 210,
    "question": "¿Qué estructura del oído regula el equilibrio?",
    "optionA": "Cóclea",
    "optionB": "Canales semicirculares",
    "optionC": "Tímpano",
    "optionD": "Martillo",
    "correctAnswer": "Canales semicirculares"
  },
  {
    "id": 211,
    "question": "¿Qué parte del sistema digestivo absorbe agua?",
    "optionA": "Intestino delgado",
    "optionB": "Colon",
    "optionC": "Esófago",
    "optionD": "Estómago",
    "correctAnswer": "Colon"
  },
  {
    "id": 212,
    "question": "¿Qué órgano produce hormonas sexuales?",
    "optionA": "Riñón",
    "optionB": "Gónadas",
    "optionC": "Hígado",
    "optionD": "Pulmón",
    "correctAnswer": "Gónadas"
  },
  {
    "id": 213,
    "question": "¿Qué parte del ojo permite ver en condiciones de poca luz?",
    "optionA": "Conos",
    "optionB": "Bastones",
    "optionC": "Iris",
    "optionD": "Cristalino",
    "correctAnswer": "Bastones"
  },
  {
    "id": 214,
    "question": "¿Qué sistema elimina desechos sólidos?",
    "optionA": "Digestivo",
    "optionB": "Respiratorio",
    "optionC": "Urinario",
    "optionD": "Endocrino",
    "correctAnswer": "Digestivo"
  },
  {
    "id": 215,
    "question": "¿Qué estructura permite la contracción del corazón?",
    "optionA": "Miocardio",
    "optionB": "Pleura",
    "optionC": "Endocardio",
    "optionD": "Septo",
    "correctAnswer": "Miocardio"
  },
  {
    "id": 216,
    "question": "¿Qué órgano participa en la producción de leucocitos?",
    "optionA": "Médula ósea",
    "optionB": "Hígado",
    "optionC": "Pulmón",
    "optionD": "Vejiga",
    "correctAnswer": "Médula ósea"
  },
  {
    "id": 217,
    "question": "¿Qué órgano tiene función digestiva y hormonal?",
    "optionA": "Riñón",
    "optionB": "Páncreas",
    "optionC": "Pulmón",
    "optionD": "Tiroides",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 218,
    "question": "¿Qué parte del sistema nervioso responde rápidamente a estímulos?",
    "optionA": "Reflejo",
    "optionB": "Hormona",
    "optionC": "Ligamento",
    "optionD": "Cartílago",
    "correctAnswer": "Reflejo"
  },
  {
    "id": 219,
    "question": "¿Qué elemento químico es clave para el transporte de oxígeno?",
    "optionA": "Calcio",
    "optionB": "Hierro",
    "optionC": "Sodio",
    "optionD": "Magnesio",
    "correctAnswer": "Hierro"
  },
  {
    "id": 220,
    "question": "¿Qué capa de la piel contiene vasos sanguíneos?",
    "optionA": "Epidermis",
    "optionB": "Dermis",
    "optionC": "Hipodermis",
    "optionD": "Cutícula",
    "correctAnswer": "Dermis"
  },
  {
    "id": 221,
    "question": "¿Qué estructura permite la expansión pulmonar?",
    "optionA": "Pleura",
    "optionB": "Diafragma",
    "optionC": "Traquea",
    "optionD": "Bronquio",
    "correctAnswer": "Diafragma"
  },
  {
    "id": 222,
    "question": "¿Qué sistema regula la homeostasis?",
    "optionA": "Endocrino",
    "optionB": "Respiratorio",
    "optionC": "Digestivo",
    "optionD": "Muscular",
    "correctAnswer": "Endocrino"
  },
  {
    "id": 223,
    "question": "¿Qué órgano participa en la visión?",
    "optionA": "Oído",
    "optionB": "Ojo",
    "optionC": "Nariz",
    "optionD": "Lengua",
    "correctAnswer": "Ojo"
  },
  {
    "id": 224,
    "question": "¿Qué tipo de tejido forma los huesos?",
    "optionA": "Nervioso",
    "optionB": "Muscular",
    "optionC": "Óseo",
    "optionD": "Epitelial",
    "correctAnswer": "Óseo"
  },
  {
    "id": 225,
    "question": "¿Qué parte del cuerpo detecta calor y frío?",
    "optionA": "Ojo",
    "optionB": "Piel",
    "optionC": "Pulmón",
    "optionD": "Hígado",
    "correctAnswer": "Piel"
  },
  {
    "id": 226,
    "question": "¿Qué órgano controla las emociones?",
    "optionA": "Cerebro",
    "optionB": "Corazón",
    "optionC": "Pulmón",
    "optionD": "Riñón",
    "correctAnswer": "Cerebro"
  },
  {
    "id": 227,
    "question": "¿Qué sistema produce enzimas digestivas?",
    "optionA": "Endocrino",
    "optionB": "Digestivo",
    "optionC": "Respiratorio",
    "optionD": "Nervioso",
    "correctAnswer": "Digestivo"
  },
  {
    "id": 228,
    "question": "¿Qué parte del sistema circulatorio transporta nutrientes?",
    "optionA": "Sangre",
    "optionB": "Huesos",
    "optionC": "Pulmones",
    "optionD": "Riñones",
    "correctAnswer": "Sangre"
  },
  {
    "id": 229,
    "question": "¿Qué órgano permite la excreción de CO2?",
    "optionA": "Pulmón",
    "optionB": "Hígado",
    "optionC": "Riñón",
    "optionD": "Vejiga",
    "correctAnswer": "Pulmón"
  },
  {
    "id": 230,
    "question": "¿Qué estructura protege el cerebro?",
    "optionA": "Costillas",
    "optionB": "Cráneo",
    "optionC": "Columna",
    "optionD": "Pelvis",
    "correctAnswer": "Cráneo"
  },
  {
    "id": 231,
    "question": "¿Qué tipo de tejido forma la capa interna de los órganos?",
    "optionA": "Muscular",
    "optionB": "Epitelial",
    "optionC": "Óseo",
    "optionD": "Nervioso",
    "correctAnswer": "Epitelial"
  },
  {
    "id": 232,
    "question": "¿Qué sustancia transporta hormonas y nutrientes en la sangre?",
    "optionA": "Glóbulos rojos",
    "optionB": "Plasma",
    "optionC": "Plaquetas",
    "optionD": "Linfocitos",
    "correctAnswer": "Plasma"
  },
  {
    "id": 233,
    "question": "¿Qué estructura sostiene el cuerpo y protege órganos?",
    "optionA": "Sistema muscular",
    "optionB": "Sistema óseo",
    "optionC": "Sistema nervioso",
    "optionD": "Sistema digestivo",
    "correctAnswer": "Sistema óseo"
  },
  {
    "id": 234,
    "question": "¿Qué órgano transforma glucosa en glucógeno?",
    "optionA": "Pulmón",
    "optionB": "Hígado",
    "optionC": "Riñón",
    "optionD": "Estómago",
    "correctAnswer": "Hígado"
  },
  {
    "id": 235,
    "question": "¿Qué parte del sistema respiratorio filtra el aire?",
    "optionA": "Nariz",
    "optionB": "Alvéolos",
    "optionC": "Bronquios",
    "optionD": "Laringe",
    "correctAnswer": "Nariz"
  },
  {
    "id": 236,
    "question": "¿Qué hueso protege la parte trasera del cerebro?",
    "optionA": "Frontal",
    "optionB": "Occipital",
    "optionC": "Temporal",
    "optionD": "Parietal",
    "correctAnswer": "Occipital"
  },
  {
    "id": 237,
    "question": "¿Qué tipo de célula elimina patógenos?",
    "optionA": "Eritrocito",
    "optionB": "Macrófago",
    "optionC": "Plaqueta",
    "optionD": "Miocito",
    "correctAnswer": "Macrófago"
  },
  {
    "id": 238,
    "question": "¿Qué sistema controla respuestas rápidas del cuerpo?",
    "optionA": "Endocrino",
    "optionB": "Nervioso",
    "optionC": "Digestivo",
    "optionD": "Inmunitario",
    "correctAnswer": "Nervioso"
  },
  {
    "id": 239,
    "question": "¿Qué órgano produce enzimas digestivas para proteínas, grasas y carbohidratos?",
    "optionA": "Páncreas",
    "optionB": "Hígado",
    "optionC": "Riñón",
    "optionD": "Pulmón",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 240,
    "question": "¿Qué estructura protege los órganos abdominales?",
    "optionA": "Cráneo",
    "optionB": "Pelvis",
    "optionC": "Columna",
    "optionD": "Costillas",
    "correctAnswer": "Pelvis"
  },
  {
    "id": 241,
    "question": "¿Qué músculo permite extender el brazo?",
    "optionA": "Bíceps",
    "optionB": "Tríceps",
    "optionC": "Deltoides",
    "optionD": "Pectoral",
    "correctAnswer": "Tríceps"
  },
  {
    "id": 242,
    "question": "¿Qué célula tiene forma bicóncava?",
    "optionA": "Neurona",
    "optionB": "Eritrocito",
    "optionC": "Linfocito",
    "optionD": "Plaqueta",
    "correctAnswer": "Eritrocito"
  },
  {
    "id": 243,
    "question": "¿Qué sistema elimina dióxido de carbono?",
    "optionA": "Digestivo",
    "optionB": "Respiratorio",
    "optionC": "Endocrino",
    "optionD": "Muscular",
    "correctAnswer": "Respiratorio"
  },
  {
    "id": 244,
    "question": "¿Qué órgano regula el equilibrio químico de la sangre?",
    "optionA": "Riñón",
    "optionB": "Pulmón",
    "optionC": "Estómago",
    "optionD": "Bazo",
    "correctAnswer": "Riñón"
  },
  {
    "id": 245,
    "question": "¿Qué hueso forma parte del cráneo lateral?",
    "optionA": "Temporal",
    "optionB": "Frontal",
    "optionC": "Occipital",
    "optionD": "Cigomático",
    "correctAnswer": "Temporal"
  },
  {
    "id": 246,
    "question": "¿Qué parte del sistema digestivo produce moco protector?",
    "optionA": "Estómago",
    "optionB": "Colon",
    "optionC": "Esófago",
    "optionD": "Duodeno",
    "correctAnswer": "Estómago"
  },
  {
    "id": 247,
    "question": "¿Qué hormona regula el metabolismo?",
    "optionA": "Insulina",
    "optionB": "Tiroxina",
    "optionC": "Melatonina",
    "optionD": "Adrenalina",
    "correctAnswer": "Tiroxina"
  },
  {
    "id": 248,
    "question": "¿Qué órgano participa en la respuesta de lucha o huida?",
    "optionA": "Bazo",
    "optionB": "Suprarrenales",
    "optionC": "Hígado",
    "optionD": "Pulmón",
    "correctAnswer": "Suprarrenales"
  },
  {
    "id": 249,
    "question": "¿Qué estructura conecta huesos para permitir movimiento?",
    "optionA": "Articulación",
    "optionB": "Tendón",
    "optionC": "Ligamento",
    "optionD": "Cartílago",
    "correctAnswer": "Articulación"
  },
  {
    "id": 250,
    "question": "¿Qué parte del cerebro regula el hambre?",
    "optionA": "Hipotálamo",
    "optionB": "Cerebelo",
    "optionC": "Tálamo",
    "optionD": "Amígdala",
    "correctAnswer": "Hipotálamo"
  },
  {
    "id": 251,
    "question": "¿Qué órgano almacena vitamina B12?",
    "optionA": "Hígado",
    "optionB": "Riñón",
    "optionC": "Pulmón",
    "optionD": "Estómago",
    "correctAnswer": "Hígado"
  },
  {
    "id": 252,
    "question": "¿Qué parte del ojo enfoca objetos cercanos y lejanos?",
    "optionA": "Iris",
    "optionB": "Cristalino",
    "optionC": "Retina",
    "optionD": "Córnea",
    "correctAnswer": "Cristalino"
  },
  {
    "id": 253,
    "question": "¿Qué sistema regula la respiración?",
    "optionA": "Digestivo",
    "optionB": "Nervioso",
    "optionC": "Endocrino",
    "optionD": "Muscular",
    "correctAnswer": "Nervioso"
  },
  {
    "id": 254,
    "question": "¿Qué tipo de sangre tiene ambos antígenos A y B?",
    "optionA": "A",
    "optionB": "B",
    "optionC": "AB",
    "optionD": "O",
    "correctAnswer": "AB"
  },
  {
    "id": 255,
    "question": "¿Qué órgano produce bilis?",
    "optionA": "Páncreas",
    "optionB": "Hígado",
    "optionC": "Bazo",
    "optionD": "Riñón",
    "correctAnswer": "Hígado"
  },
  {
    "id": 256,
    "question": "¿Qué parte del sistema respiratorio está justo antes de los alvéolos?",
    "optionA": "Bronquios",
    "optionB": "Bronquiolos",
    "optionC": "Tráquea",
    "optionD": "Faringe",
    "correctAnswer": "Bronquiolos"
  },
  {
    "id": 257,
    "question": "¿Qué tejido transporta impulsos eléctricos?",
    "optionA": "Muscular",
    "optionB": "Nervioso",
    "optionC": "Óseo",
    "optionD": "Conectivo",
    "correctAnswer": "Nervioso"
  },
  {
    "id": 258,
    "question": "¿Qué órgano tiene forma de frijol?",
    "optionA": "Pulmón",
    "optionB": "Riñón",
    "optionC": "Corazón",
    "optionD": "Hígado",
    "correctAnswer": "Riñón"
  },
  {
    "id": 259,
    "question": "¿Qué sistema protege contra infecciones?",
    "optionA": "Digestivo",
    "optionB": "Inmunitario",
    "optionC": "Muscular",
    "optionD": "Respiratorio",
    "correctAnswer": "Inmunitario"
  },
  {
    "id": 260,
    "question": "¿Qué órgano participa en la digestión de grasas?",
    "optionA": "Hígado",
    "optionB": "Bazo",
    "optionC": "Riñón",
    "optionD": "Corazón",
    "correctAnswer": "Hígado"
  },
  {
    "id": 261,
    "question": "¿Qué estructura del ojo es sensible a la luz?",
    "optionA": "Retina",
    "optionB": "Cristalino",
    "optionC": "Córnea",
    "optionD": "Iris",
    "correctAnswer": "Retina"
  },
  {
    "id": 262,
    "question": "¿Qué órgano produce hormonas como insulina?",
    "optionA": "Hígado",
    "optionB": "Páncreas",
    "optionC": "Riñón",
    "optionD": "Pulmón",
    "correctAnswer": "Páncreas"
  },
  {
    "id": 263,
    "question": "¿Qué músculo forma parte del sistema respiratorio?",
    "optionA": "Bíceps",
    "optionB": "Diafragma",
    "optionC": "Tríceps",
    "optionD": "Deltoides",
    "correctAnswer": "Diafragma"
  },
  {
    "id": 264,
    "question": "¿Qué hueso conecta con la clavícula?",
    "optionA": "Escápula",
    "optionB": "Fémur",
    "optionC": "Radio",
    "optionD": "Tibia",
    "correctAnswer": "Escápula"
  },
  {
    "id": 265,
    "question": "¿Qué órgano filtra linfa?",
    "optionA": "Hígado",
    "optionB": "Ganglios linfáticos",
    "optionC": "Riñón",
    "optionD": "Pulmón",
    "correctAnswer": "Ganglios linfáticos"
  },
  {
    "id": 266,
    "question": "¿Qué estructura conecta el oído externo con el interno?",
    "optionA": "Tímpano",
    "optionB": "Conducto auditivo",
    "optionC": "Cóclea",
    "optionD": "Martillo",
    "correctAnswer": "Tímpano"
  },
  {
    "id": 267,
    "question": "¿Qué sistema regula el balance hormonal?",
    "optionA": "Digestivo",
    "optionB": "Endocrino",
    "optionC": "Respiratorio",
    "optionD": "Muscular",
    "correctAnswer": "Endocrino"
  },
  {
    "id": 268,
    "question": "¿Qué parte del cerebro está relacionada con emociones?",
    "optionA": "Amígdala",
    "optionB": "Cerebelo",
    "optionC": "Hipotálamo",
    "optionD": "Tálamo",
    "correctAnswer": "Amígdala"
  },
  {
    "id": 269,
    "question": "¿Qué órgano transporta nutrientes en sangre?",
    "optionA": "Corazón",
    "optionB": "Venas",
    "optionC": "Sangre",
    "optionD": "Pulmón",
    "correctAnswer": "Sangre"
  },
  {
    "id": 270,
    "question": "¿Qué parte del sistema digestivo produce enzimas para proteínas?",
    "optionA": "Estómago",
    "optionB": "Colon",
    "optionC": "Esófago",
    "optionD": "Recto",
    "correctAnswer": "Estómago"
  },
  {
    "id": 271,
    "question": "¿Qué órgano ayuda a controlar la presión arterial?",
    "optionA": "Riñón",
    "optionB": "Lengua",
    "optionC": "Pulmón",
    "optionD": "Páncreas",
    "correctAnswer": "Riñón"
  },
  {
    "id": 272,
    "question": "¿Qué parte del ojo regula la entrada de luz?",
    "optionA": "Iris",
    "optionB": "Retina",
    "optionC": "Córnea",
    "optionD": "Cristalino",
    "correctAnswer": "Iris"
  },
  {
    "id": 273,
    "question": "¿Qué órgano elimina toxinas químicas?",
    "optionA": "Riñón",
    "optionB": "Hígado",
    "optionC": "Pulmón",
    "optionD": "Bazo",
    "correctAnswer": "Hígado"
  },
  {
    "id": 274,
    "question": "¿Qué sistema distribuye oxígeno en el cuerpo?",
    "optionA": "Respiratorio",
    "optionB": "Circulatorio",
    "optionC": "Digestivo",
    "optionD": "Endocrino",
    "correctAnswer": "Circulatorio"
  },
  {
    "id": 275,
    "question": "¿Qué hueso está en el brazo superior?",
    "optionA": "Radio",
    "optionB": "Cúbito",
    "optionC": "Húmero",
    "optionD": "Clavícula",
    "correctAnswer": "Húmero"
  },
  {
    "id": 276,
    "question": "¿Qué órgano regula el sistema nervioso?",
    "optionA": "Pulmón",
    "optionB": "Cerebro",
    "optionC": "Riñón",
    "optionD": "Hígado",
    "correctAnswer": "Cerebro"
  },
  {
    "id": 277,
    "question": "¿Qué tejido almacena grasa?",
    "optionA": "Adiposo",
    "optionB": "Muscular",
    "optionC": "Nervioso",
    "optionD": "Óseo",
    "correctAnswer": "Adiposo"
  },
  {
    "id": 278,
    "question": "¿Qué parte del sistema digestivo se encarga de eliminar residuos?",
    "optionA": "Colon",
    "optionB": "Estómago",
    "optionC": "Esófago",
    "optionD": "Duodeno",
    "correctAnswer": "Colon"
  },
  {
    "id": 279,
    "question": "¿Qué órgano genera impulsos eléctricos para latir?",
    "optionA": "Corazón",
    "optionB": "Pulmón",
    "optionC": "Hígado",
    "optionD": "Riñón",
    "correctAnswer": "Corazón"
  },
  {
    "id": 280,
    "question": "¿Qué estructura protege el cuerpo contra agentes externos?",
    "optionA": "Piel",
    "optionB": "Pulmón",
    "optionC": "Cráneo",
    "optionD": "Hueso",
    "correctAnswer": "Piel"
  }
]
''';

  final List<dynamic> jsonList = jsonDecode(questionsJson);

  final questions = jsonList.map<QuestionStruct>((item) {
    return QuestionStruct(
      id: item['id'],
      subject: item['subject'],
      question: item['question'],
      optionA: item['optionA'],
      optionB: item['optionB'],
      optionC: item['optionC'],
      optionD: item['optionD'],
      correctAnswer: item['correctAnswer'],
    );
  }).toList();

  questions.shuffle(Random());

  return questions;
}
