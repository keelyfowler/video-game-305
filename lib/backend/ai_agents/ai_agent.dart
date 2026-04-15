import 'package:flutter/material.dart';
import 'firebase_vertexai_agent.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Calls an AI agent and manages the conversation thread.
///
/// * [context] - The build context for showing error messages if needed.
/// * [prompt] - The user's message to send to the agent.
/// * [imageUrl] - A URL to an image to send to the agent (optional).
/// * [imageAsset] - An uploaded image file to send to the agent (optional).
/// * [audioUrl] - A URL to an audio file to send to the agent (optional).
/// * [audioAsset] - An uploaded audio file to send to the agent (optional).
/// * [videoUrl] - A URL to a video to send to the agent (optional).
/// * [videoAsset] - An uploaded video file to send to the agent (optional).
/// * [pdfUrl] - Optional URL of a PDF to include in the message.
/// * [pdfAsset] - Optional PDF file to include in the message.
/// * [threadId] - A local identifier for the conversation thread.
/// * [agentCloudFunctionName] - The name of the cloud function to call for the agent.
/// * [provider] - The AI provider (e.g. 'OPENAI', 'GOOGLE').
/// * [agentJson] - Optional configuration parameters for the agent. Required for Google agents
///   when using Firebase Vertex AI (Gemini) since configuration is passed client-side.
///   Not required for cloud function-based agents since configuration is included in
///   the cloud function source code.
/// * [responseType] - The type of response to expect from the agent.
///
/// Returns a Future that completes with the agent's response message, or null if there was an error.
Future<dynamic> callAiAgent({
  required BuildContext context,
  required String prompt,
  String? imageUrl,
  FFUploadedFile? imageAsset,
  String? audioUrl,
  FFUploadedFile? audioAsset,
  String? videoUrl,
  FFUploadedFile? videoAsset,
  String? pdfUrl,
  FFUploadedFile? pdfAsset,
  required String threadId,
  required String agentCloudFunctionName,
  required String provider,
  String? agentJson,
  required String responseType,
}) async {
  try {
    switch (provider) {
      case 'GOOGLE':
        if (agentJson == null) {
          throw Exception('Agent configuration required for Google AI');
        }
        final parsedJson = jsonDecode(agentJson) as Map<String, dynamic>;
        return await ChatManager().sendMessage(
          prompt,
          threadId,
          parsedJson,
          imageUrl: imageUrl,
          imageAsset: imageAsset,
          audioUrl: audioUrl,
          audioAsset: audioAsset,
          videoUrl: videoUrl,
          videoAsset: videoAsset,
          pdfUrl: pdfUrl,
          pdfAsset: pdfAsset,
        );

      default:
        showSnackbar(
          context,
          'Unsupported AI provider: $provider}',
        );
        return null;
    }
  } catch (e) {
    showSnackbar(
      context,
      'Error: ${e.toString()}',
    );
    return null;
  }
}

void clearAiChat(String threadId, String provider) {
  switch (provider) {
    case 'GOOGLE':
      ChatManager().clearChat(threadId);
      break;

    default:
      // Handle other providers if needed
      break;
  }
}
