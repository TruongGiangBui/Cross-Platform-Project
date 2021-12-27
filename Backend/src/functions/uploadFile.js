const bodyParser = require('body-parser');
const fs = require('fs');
const mime = require('mime');
const { v4: uuidv4 } = require('uuid');
const {
    DOCUMENT_TYPE_VIDEO,
    DOCUMENT_TYPE_IMAGE,
    DOCUMENT_TYPE_OTHER
} = require('../constants/constants');
const uploadFile = {};

uploadFile.matchesFileBase64 = (fileBase64) => {
    const matches = fileBase64.match(/^data:([A-Za-z-+/]+);base64,(.+)$/);
    if (!Array.isArray(matches) || matches.length !== 3) {
        return false;
    }
    console.log("Match base64 encode")
    return true;
}

uploadFile.uploadFile = (fileBase64) => {
    const matches = fileBase64.match(/^data:([A-Za-z-+/]+);base64,(.+)$/), response = {};
    if (!Array.isArray(matches) || matches.length !== 3) {
        return false;
    }
    console.log("Start up load file")

    response.type = matches[1];
    response.data = new Buffer(matches[2], 'base64');
    let decodedImg = response;
    let imageBuffer = decodedImg.data;
    let type = decodedImg.type;
    let extension = mime.getExtension(type);
    let documentType = DOCUMENT_TYPE_OTHER;
    if (type.toString().includes(DOCUMENT_TYPE_VIDEO)) {
        documentType = DOCUMENT_TYPE_VIDEO;
    } else if (type.toString().includes(DOCUMENT_TYPE_IMAGE)) {
        documentType = DOCUMENT_TYPE_IMAGE;
    }
    if(extension==null) extension="png";
    let fileName = uuidv4() + "." + extension;
    console.log(fileName)
    try {
        currentPath = process.cwd()
        console.log(currentPath)
        fs.writeFileSync(currentPath+ "/src/files/" + fileName, imageBuffer, 'utf8');
        console.log("Upload file success")
        return ({
            fileName: fileName,
            fileSize: imageBuffer.length,
            type: documentType
        });
    } catch (e) {
        console.log("UPLOAD FAIL")
        return false;
    }
}

module.exports = uploadFile;