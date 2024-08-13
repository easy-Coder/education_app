import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';

part 'providers.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore fireStore(FireStoreRef ref) {
  return FirebaseFirestore.instance;
}

@riverpod
GenerativeModel model(ModelRef ref) {
  final _vertexAI = FirebaseVertexAI.instanceFor(location: 'europe-southwest1');
  final generationConfig = GenerationConfig(
    // stopSequences: ["red"],
    temperature: 0,
    topP: 0.1,
    topK: 16,
  );
  final safetySettings = [
    SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
  ];
  return _vertexAI.generativeModel(
    model: 'gemini-1.5-pro',
    systemInstruction: Content.system(
        "You are a teaching assistant that handle various task such as explaining a lesson to student based on their level, quizzing student on lesson to know their area they performance improve."),
    generationConfig: generationConfig,
    safetySettings: safetySettings,
  );
}
