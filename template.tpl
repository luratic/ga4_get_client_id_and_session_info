___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 - Get Client Id \u0026 Session Info (Safe API)",
  "description": "Safely retrieves GA4 Client ID, Session ID or Session Number using the readAnalyticsStorage API.\nSession values require a valid Measurement ID.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "id_source",
    "displayName": "Data to return",
    "label": "Select the type of data you want to retrieve",
    "simpleValueType": true,
    "default": "client_id",
    "radioItems": [
      {
        "value": "client_id",
        "displayValue": "Client ID"
      },
      {
        "value": "session_data",
        "displayValue": "Session Data"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "session_group",
    "displayName": "Session Configuration",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "measurement_id",
        "displayName": "GA4 Measurement ID",
        "label": "Measurement ID (e.g., G-XXXXXXX)",
        "help": "Required when returning session information. Must start with \u0027G-\u0027.",
        "default": "",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "REGEX",
            "args": [
              "^G-[A-Z0-9]+$"
            ],
            "errorMessage": "The Measurement ID must start with \u0027G-\u0027 (e.g., G-ABC123DEF4)."
          },
          {
            "type": "NON_EMPTY"
          }
        ]
      },
      {
        "type": "RADIO",
        "name": "session_data_type",
        "displayName": "Session Field",
        "label": "Select which session value to return",
        "simpleValueType": true,
        "default": "session_id",
        "radioItems": [
          {
            "value": "session_id",
            "displayValue": "Session ID"
          },
          {
            "value": "session_number",
            "displayValue": "Session Number"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "id_source",
        "paramValue": "session_data",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "info",
    "displayName": "Information",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "LABEL",
        "name": "community",
        "displayName": "\u003cstrong\u003e\u003ca href\u003d\"https://datola.es/?utm_source\u003dgtm\u0026utm_medium\u003dtemplates\u0026utm_campaign\u003dga4_client_id\"\u003eDatola | Community 📊\u003c/a\u003e\u003c/strong\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const readAnalyticsStorage = require('readAnalyticsStorage');
const log = require('logToConsole');

const idSource = data.id_source;

//log('📥 ID source selected:', idSource);

const analyticsStorageData = readAnalyticsStorage();
log('ℹ️', analyticsStorageData);

if (!analyticsStorageData) {
//  log('⚠️ No analytics storage data available');
  return undefined;
}

// If client_id is selected
if (idSource === 'client_id') {
//  log('🆔 Returning Client ID:', analyticsStorageData.client_id);
  return analyticsStorageData.client_id;
}

// Session-related handling
const measurementId = data.measurement_id;
const sessionDataType = data.session_data_type;

log('🎯 Measurement ID:', measurementId);
log('📌 Session data type:', sessionDataType);

// Validate sessions array (without Array.isArray)
if (!analyticsStorageData.sessions) {
  log('⚠️ No valid sessions found');
  return undefined;
}

// Iterate through sessions to find the matching one
// Buscamos sesión correspondiente
for (let i = 0; i < analyticsStorageData.sessions.length; i++) {
  const session = analyticsStorageData.sessions[i];
  if (analyticsStorageData.sessions[i].measurement_id === measurementId) {
    if (sessionDataType === 'session_id') {
//      log('📆 Returning Session ID:', session.session_id);
      return session.session_id;
    }
    if (sessionDataType === 'session_number') {
//      log('🔢 Returning Session Number:', session.session_number);
      return session.session_number;
    }
  }
}
return undefined;
// No session found


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_analytics_storage",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Developed with ❤ by: Alfonso, Txema and Brais.
Web: www.luratic.com
Web: www.datola.es
RRSS: 
https://www.linkedin.com/in/braiscalvo/ | https://twitter.com/braiscv
https://www.linkedin.com/in/alfonsorc/
https://www.linkedin.com/in/txemasm/


