import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/globalclass/icons.dart';
import 'package:vetner360/helping/chat_request.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vetner360/helping/help.dart';
import 'package:open_filex/open_filex.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

import 'package:vetner360/theme/themecontroller.dart';

class UserChat extends StatefulWidget {
  const UserChat({super.key, required this.detailInfo});
  final detailInfo;

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  List<types.Message> _messages = [];
  types.User _user = types.User(id: "");
  final themedata = Get.put(DoctorThemecontroler());

  @override
  void initState() {
    ChatRequest.socket.on('received-message', this._receivedMessageEvent);
    Helping.getToken("id").then((String? userId) {
      if (userId != null) {
        String roomId = "${userId}${widget.detailInfo["token"]}";
        ChatRequest.socket.emit("join-room", roomId);
        _loadMessages(roomId);
        setState(() {
          this._user = types.User(
            id: userId,
          );
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    ChatRequest.socket.off('received-message', this._receivedMessageEvent);
    super.dispose();
  }

  void _receivedMessageEvent(data) {
    DateTime dateTime = DateTime.parse(data['created_at']);
    final textMessage = types.TextMessage(
      id: data['token'],
      author: _user as types.User,
      text: data['content'],
      roomId: data['roomId'],
      createdAt: dateTime.millisecondsSinceEpoch,
    );
    _addMessage(textMessage);
  }

  Future<void> _loadMessages(String roomId) async {
    final loadedMessages = await ChatRequest.loadChatMessage(context, roomId);
    if (loadedMessages != null) {
      setState(() {
        this._messages = loadedMessages.map((message) {
          DateTime dateTime = DateTime.parse(message['created_at']);
          return types.TextMessage(
            id: message['token'],
            author: types.User(id: message['senderId']),
            text: message['content'],
            roomId: message['roomId'],
            createdAt: dateTime.millisecondsSinceEpoch,
          );
        }).toList() as List<types.Message>;
      });
    }
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
      print(_messages);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user as types.User,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    if (this._user.id.length == 0) {
      return;
    }
    String roomId = "${this._user.id}${widget.detailInfo["token"]}";
    if (this._messages.length == 0) {
      await ChatRequest.setParticipant(
          context, this._user.id, widget.detailInfo["token"], roomId);
      await ChatRequest.setParticipant(
          context, widget.detailInfo["token"], this._user.id, roomId);
    }
    var messageBody = {
      "senderId": this._user.id,
      "roomId": roomId,
      "content": message.text,
      "type": "text",
    };
    ChatRequest.socket.emit("message", messageBody);
  }

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor:
            themedata.isdark ? DoctorColor.black : DoctorColor.white,
        leadingWidth: width / 1,
        toolbarHeight: height / 16,
        leading: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "${widget.detailInfo['firstName']} ${widget.detailInfo['lastName']}",
                  style: isemibold.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Chat(
        messages: _messages,
        onPreviewDataFetched: _handlePreviewDataFetched,
        // onAttachmentPressed: _handleAttachmentPressed,
        onSendPressed: _handleSendPressed,
        onMessageTap: _handleMessageTap,
        showUserAvatars: true,
        showUserNames: true,
        user: _user as types.User,
      ),
    );
  }
}
