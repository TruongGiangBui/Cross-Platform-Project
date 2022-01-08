const {
    PRIVATE_CHAT,
    GROUP_CHAT,
} = require('../constants/constants');
const ChatModel = require("../models/Chats");
const MessagesModel = require("../models/Messages");
const UsersModel=require("../models/Users")
const DocumentModel=require("../models/Documents")
const httpStatus = require("../utils/httpStatus");
const chatController = {};
var ObjectId = require('mongodb').ObjectId;      
const { chat } = require('googleapis/build/src/apis/chat');

chatController.send = async (req, res, next) => {
    try {
        let userId = req.userId;
        const {
            name,
            chatId,
            receivedId,
            member,
            type,
            content
        } = req.body;
        let chatIdSend = null;
        let chat;
        if (type === PRIVATE_CHAT) {
            if (chatId) {
                chat = await ChatModel.findById(chatId);
                if (chat !== null) {
                    chatIdSend = chat._id;
                }
            } else {
                chat = new ChatModel({
                   type: PRIVATE_CHAT,
                   member: [
                       receivedId,
                       userId
                   ]
                });
                await chat.save();
                chatIdSend = chat._id;
            }
        } else if (type === GROUP_CHAT) {
            if (chatId) {
                chat = await ChatModel.findById(chatId);
                if (chat !== null) {
                    chatIdSend = chat._id;
                }
            } else {
                chat = new ChatModel({
                    type: GROUP_CHAT,
                    member: member
                });
                await chat.save();
                chatIdSend = chat._id;
            }
        }
        if (chatIdSend) {
            if (content) {
                let message = new MessagesModel({
                    chat: chatIdSend,
                    user: userId,
                    content: content
                });
                await message.save();
                let messageNew = await MessagesModel.findById(message._id).populate('user');
                return res.status(httpStatus.OK).json({
                    data: messageNew
                });
            } else {
                return res.status(httpStatus.OK).json({
                    data: chat,
                    message: 'Create chat success',
                    response: 'CREATE_CHAT_SUCCESS'
                });
            }
        } else {
            return res.status(httpStatus.BAD_REQUEST).json({
                message: 'Not chat'
            });
        }

    } catch (e) {
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            message: e.message
        });
    }
}
chatController.getMessages = async (req, res, next) => {
    try {
        let messages = await MessagesModel.find({
            chat: req.params.chatId
        }).populate({
            path : 'user',
            populate : {
              path : 'avatar'
            }
          });
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            data: messages
        });
    } catch (e) {
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            message: e.message
        });
    }
}
chatController.getChatwithuser = async (req, res, next) => {
    try {
        var chatid='';
        let chats = await ChatModel.find({});
        for(var i=0;i<chats.length;i++){
            if(chats[i].member.includes(req.params.receiverid)&&chats[i].member.includes(req.userId)){            
                chatid=chats[i]._id;
                return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
                    data: chatid
                });
            }
        }
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            data: chatid
        });
    } catch (e) {
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            message: e.message
        });
    }
}
chatController.deletechat= async (req, res, next) => {
    console.log("1212")
    try {
        await ChatModel.findByIdAndDelete({
            _id: req.params.chatId
        });
        return res.status(httpStatus.OK);
    } catch (e) {
        return res.status(httpStatus.INTERNAL_SERVER_ERROR);
    }
}
chatController.getChats = async (req, res, next) => {
    try {
        let messages = await    ChatModel.find({});
        let data=Array();
        console.log(messages)
        for(var i=0;i<messages.length;i++){
            console.log(messages[i])
            if(messages[i].member.includes(req.userId)){
                var chat=new Map()
                chat['owner']=req.userId;
                chat['guest']=messages[i].member.filter(item => item != req.userId)[0];
                let guest=await UsersModel.findOne({"_id":ObjectId(chat['guest'])}).populate("avatar");
                chat['guestavt']=guest['avatar']
                chat['guestname']=guest['username']
                chat['messages']=messages[i].messages
                chat['seens']=messages[i].seens
                chat['type']=messages[i].type
                chat['updateAt']=messages[i]['updatedAt']
                chat['pivots']=messages[i].pivots
                chat['_id']=messages[i]._id
                data.push(chat);
            }
        }
        console.log(data);
        return res.status(httpStatus.ACCEPTED).json({
            data: data.reverse()
        });
    } catch (e) {
        return res.status(httpStatus.INTERNAL_SERVER_ERROR).json({
            message: e.message
        });
    }
}
module.exports = chatController;