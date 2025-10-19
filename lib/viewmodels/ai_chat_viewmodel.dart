import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class AiChatViewModel extends GetxController {
  // Replace with your actual Gemini API key
  static const String _apiKey = 'YOUR_GEMINI_API_KEY_HERE';
  
  late final GenerativeModel _model;
  late final ChatSession _chat;
  
  final RxList<Message> messages = <Message>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeModel();
    _addWelcomeMessage();
  }

  void _initializeModel() {
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 1024,
      ),
    );
    
    _chat = _model.startChat(history: []);
  }

  void _addWelcomeMessage() {
    messages.add(
      Message(
        text: 'Bonjour! Je suis votre assistant IA. Comment puis-je vous aider aujourd\'hui?',
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    messages.add(
      Message(
        text: text.trim(),
        isUser: true,
        timestamp: DateTime.now(),
      ),
    );

    isLoading.value = true;
    error.value = '';

    try {
      // Send message to Gemini
      final response = await _chat.sendMessage(
        Content.text(text.trim()),
      );

      // Add AI response
      if (response.text != null && response.text!.isNotEmpty) {
        messages.add(
          Message(
            text: response.text!,
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      } else {
        throw Exception('Réponse vide de l\'IA');
      }
    } catch (e) {
      error.value = 'Erreur: ${e.toString()}';
      messages.add(
        Message(
          text: 'Désolé, une erreur s\'est produite. Veuillez réessayer.',
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearChat() {
    messages.clear();
    _chat = _model.startChat(history: []);
    _addWelcomeMessage();
  }

  @override
  void onClose() {
    messages.clear();
    super.onClose();
  }
}

