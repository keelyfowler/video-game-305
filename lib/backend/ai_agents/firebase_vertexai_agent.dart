import 'dart:convert';

import '../../flutter_flow/uploaded_file.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A singleton class that manages chat sessions for Firebase Vertex AI.
///
/// This class maintains a map of chat sessions indexed by thread ID and handles:
/// - Initializing new chat sessions with specific model configurations
/// - Managing multiple concurrent chat sessions
/// - Sending and receiving messages
/// - Clearing chat history
class ChatManager {
  static final ChatManager _instance = ChatManager._internal();
  ChatManager._internal();
  factory ChatManager() => _instance;

  // Map to store multiple chat sessions with their thread IDs
  final Map<String, ChatSession> _chats = {};

  Future<void> initializeChat(
    String threadId,
    Map<String, dynamic> agentJson,
  ) async {
    if (!_chats.containsKey(threadId)) {
      // Create Vertex AI instance
      final vertexAI = FirebaseVertexAI.instanceFor(
        auth: FirebaseAuth.instance,
      );
      final aiModel = agentJson['aiModel'];
      final responseOptions = agentJson['responseOptions'];

      // Get base system message
      var systemMessage = (aiModel['messages'] as List<dynamic>)
              .firstWhere((message) => message['role'] == 'SYSTEM')['text']
          as String;

      // Add response format instructions to system message
      // Note: For structured data output, users need to specify their desired JSON format
      // in the system instructions since schema-based responses are not yet supported
      switch (responseOptions['responseType']) {
        case 'PLAINTEXT':
          systemMessage +=
              '\n Please provide your responses in plain text format only, without any special formatting or markdown.';
          break;
        case 'MARKDOWN':
          systemMessage +=
              '\n Please format your responses using markdown syntax for better readability.';
          break;
        case 'JSON':
          systemMessage +=
              '\n Please provide your responses in valid JSON format.';
          break;
        default:
          break;
      }

      // Add the preloaded messages
      final messages = (aiModel['messages'] as List<dynamic>)
          .where((message) => message['role'] != 'SYSTEM')
          .map((message) => Content(
              message['role'] == 'USER' ? 'user' : 'model',
              [TextPart(message['text'])]));

      // Initialize the chat session
      final model = vertexAI.generativeModel(
        model: aiModel['model'],
        systemInstruction: Content.system(systemMessage),
        generationConfig: GenerationConfig(
          temperature:
              aiModel['parameters']['temperature']['inputValue'].toDouble(),
          topP: aiModel['parameters']['topP']['inputValue'].toDouble(),
          maxOutputTokens:
              aiModel['parameters']['maxTokens']['inputValue'].toInt(),
          responseMimeType: responseOptions['responseType'] == 'JSON'
              ? 'application/json'
              : null,
        ),
      );

      _chats[threadId] = model.startChat(history: messages.toList());
    }
  }

  void clearChat(String threadId) {
    _chats.remove(threadId);
  }

  Future<dynamic> sendMessage(
    String userMessage,
    String threadId,
    Map<String, dynamic> agentJson, {
    String? imageUrl,
    FFUploadedFile? imageAsset,
    String? audioUrl,
    FFUploadedFile? audioAsset,
    String? videoUrl,
    FFUploadedFile? videoAsset,
    String? pdfUrl,
    FFUploadedFile? pdfAsset,
  }) async {
    await initializeChat(threadId, agentJson);

    final chat = _chats[threadId];
    if (chat == null) {
      throw Exception('Failed to initialize chat session');
    }

    final Content prompt;
    final parts = <Part>[TextPart(userMessage)];

    // Add image if provided
    if (imageAsset != null && imageAsset.bytes?.isNotEmpty == true) {
      parts.add(InlineDataPart('image/jpeg', imageAsset.bytes!));
    } else if (imageUrl != null && imageUrl.isNotEmpty) {
      parts.add(FileData(
          getMimeTypeFromUrl(imageUrl, defaultMimeType: 'image/jpeg'),
          imageUrl));
    }

    // Add audio if provided
    if (audioAsset != null && audioAsset.bytes?.isNotEmpty == true) {
      parts.add(InlineDataPart('audio/m4a', audioAsset.bytes!));
    } else if (audioUrl != null && audioUrl.isNotEmpty) {
      parts.add(FileData(
          getMimeTypeFromUrl(audioUrl, defaultMimeType: 'audio/mp3'),
          audioUrl));
    }

    // Add video if provided
    if (videoAsset != null && videoAsset.bytes?.isNotEmpty == true) {
      parts.add(InlineDataPart('video/mp4', videoAsset.bytes!));
    } else if (videoUrl != null && videoUrl.isNotEmpty) {
      parts.add(FileData(
          getMimeTypeFromUrl(videoUrl, defaultMimeType: 'video/mp4'),
          videoUrl));
    }

    // Add PDF if provided
    if (pdfAsset != null && pdfAsset.bytes?.isNotEmpty == true) {
      parts.add(InlineDataPart('application/pdf', pdfAsset.bytes!));
    } else if (pdfUrl != null && pdfUrl.isNotEmpty) {
      parts.add(FileData(
          getMimeTypeFromUrl(pdfUrl, defaultMimeType: 'application/pdf'),
          pdfUrl));
    }

    // Use Content.multi if we have multiple parts, otherwise just use Content.text
    prompt =
        parts.length > 1 ? Content.multi(parts) : Content.text(userMessage);

    final response = await chat.sendMessage(prompt);
    if (agentJson['responseOptions']['responseType'] == 'JSON') {
      try {
        // Parse the response into a JSON object and return it
        return jsonDecode(response.text!) as Map<String, dynamic>;
      } catch (e) {
        print('Failed to parse JSON response: ${response.text}');
        throw Exception('AI response was not valid JSON');
      }
    }
    return response.text;
  }

  /// Attempts to determine the MIME type from a URL.
  ///
  /// Extracts the file extension from the URL and maps it to the corresponding
  /// MIME type. If the URL doesn't contain a recognized extension or if
  /// any error occurs during processing, uses the provided default MIME type.
  ///
  /// Example URLs that can be handled:
  /// - https://example.com/image.jpg
  /// - https://example.com/path/video.mp4?size=large
  /// - https://storage.googleapis.com/my-bucket/audio.mp3
  ///
  /// @param url The URL to analyze
  /// @param defaultMimeType The fallback MIME type if one cannot be determined
  String getMimeTypeFromUrl(String url,
      {String defaultMimeType = 'application/octet-stream'}) {
    try {
      // Extract file extension from the URL
      String extension = url.split('?').first.split('.').last.toLowerCase();

      // Map common file extensions to MIME types
      switch (extension) {
        // Image types
        case 'jpg':
        case 'jpeg':
          return 'image/jpeg';
        case 'png':
          return 'image/png';
        case 'gif':
          return 'image/gif';
        case 'webp':
          return 'image/webp';
        case 'svg':
          return 'image/svg+xml';
        case 'bmp':
          return 'image/bmp';
        case 'tiff':
        case 'tif':
          return 'image/tiff';

        // Audio types
        case 'mp3':
          return 'audio/mp3';
        case 'm4a':
          return 'audio/m4a';
        case 'wav':
          return 'audio/wav';
        case 'ogg':
          return 'audio/ogg';
        case 'aac':
          return 'audio/aac';
        case 'wma':
          return 'audio/x-ms-wma';
        case 'flac':
          return 'audio/flac';

        // Video types
        case 'mp4':
          return 'video/mp4';
        case 'mov':
          return 'video/quicktime';
        case 'avi':
          return 'video/x-msvideo';
        case 'wmv':
          return 'video/x-ms-wmv';
        case 'flv':
          return 'video/x-flv';
        case 'webm':
          return 'video/webm';
        case 'mkv':
          return 'video/x-matroska';

        default:
          return defaultMimeType;
      }
    } catch (e) {
      return defaultMimeType;
    }
  }
}
